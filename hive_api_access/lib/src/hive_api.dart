import 'package:api_access/api_access.dart';
import 'package:hive/hive.dart';
import 'package:hive_api_access/src/guid.dart';

class HiveApiAccess implements IApiAccess {
  final RecordDataSerializer<Map<String, dynamic>> _serializer;

  HiveApiAccess(this._hive, this._serializer);

  final HiveInterface _hive;

  String generateUid() {
    return GUIDGen.generate();
  }

  @override
  Collection<T> collection<T>(String resource) {
    return Collection((b) => b
      ..api = this
      ..resource = resource);
  }

  @override
  Future<void> create<T>(Collection<T> collection, T data) async {
    final box = await _getBox(collection);
    await box.put(generateUid(), _serializer.serializeValue<T>(data));
  }

  @override
  Future<void> delete<T>(RecordReference<T> ref) async {
    final box = await _getBox(collection<T>(ref.resource));
    await box.delete(ref.id);
  }

  @override
  Future<QueryResult<T>> getQuery<T>(Query<T> query) async {
    final box = await _getBox<T>(query.collection);
    final records = await Future.wait(box.keys.map((key) {
      String keyString = key.toString();
      return box.get(key).then((value) {
        final data = value == null
            ? null
            : _serializer.deserializeValue<T>(Map<String, dynamic>.from(value));
        final ref = RecordReference<T>((b) => b
          ..api = this
          ..id = keyString
          ..resource = query.collection.resource);
        final record = Record<T>((b) => b
          ..data = data
          ..ref = ref.toBuilder());
        return record;
      });
    }));
    return QueryResult((b) => b
      ..collection = query.collection.toBuilder()
      ..hasError = false
      ..records = ListBuilder(records));
  }

  @override
  Future<Record<T>> getRecord<T>(RecordReference<T> ref) async {
    final box = await _getBox(collection<T>(ref.resource));
    final map = await box.get(ref.id);
    return Record((b) => b
      ..data = map == null
          ? null
          : _serializer.deserializeValue<T>(Map<String, dynamic>.from(map))
      ..ref = ref.toBuilder());
  }

  @override
  Future<void> update<T, V>(RecordReference<T> ref, V newValue) async {
    final box = await _getBox(collection<T>(ref.resource));
    final newMap = _serializer.serializeValue<V>(newValue);
    await box.put(ref.id, newMap);
  }

  @override
  Stream<QueryResult<T>> watchQuery<T>(Query<T> query) async* {
    final box = await _getBox<T>(query.collection);
    yield await getQuery<T>(query);
    await for (var _ in box.watch()) {
      yield await getQuery<T>(query);
    }
  }

  @override
  Stream<Record<T>> watchRecord<T>(RecordReference<T> ref) async* {
    final box = await _getBox(collection<T>(ref.resource));
    yield await getRecord<T>(ref);
    await for (var event in box.watch(key: ref.id)) {
      if (event.deleted) {
        yield Record<T>((b) => b
          ..data = null
          ..ref = ref.toBuilder());
      } else {
        final data = _serializer.deserializeValue<T>(event.value);
        yield Record<T>((b) => b
          ..data = data
          ..ref = ref.toBuilder());
      }
    }
  }

  Future<LazyBox<Map>> _getBox<T>(Collection<T> collection) {
    return _hive.openLazyBox<Map>(collection.resource);
  }
}
