import 'package:api_access/api_access.dart';
import 'package:dio/dio.dart';

class DioApiAccess extends IApiAccess {
  final Dio _http;
  final RecordDataSerializer _serializer;

  DioApiAccess(this._http, this._serializer);

  @override
  Future<void> create<T>(Collection<T> collection, T data) {
    final map = _serializer.serializeValue<T>(data);
    return _http.post(_getPathFromCollection(collection), data: map);
  }

  @override
  Future<void> delete<T>(RecordReference<T> ref) {
    return _http.delete(_getPathFromRecordReference<T>(ref));
  }

  @override
  Future<QueryResult<T>> getQuery<T>(Query<T> query) {
    return _http
        .get(_getPathFromCollection(query.collection),
            queryParameters: query.filters?.asMap())
        .then((res) {
      final records = List<dynamic>.from(res.data).map((listItem) {
        return _getRecordFromJson<T>(query.collection.resource, listItem);
      });

      return QueryResult<T>((b) => b
        ..collection = query.collection.toBuilder()
        ..hasError = false
        ..records = ListBuilder(records));
    }).catchError((_) => QueryResult<T>((b) => b
          ..collection = query.collection.toBuilder()
          ..hasError = true
          ..records = ListBuilder()));
  }

  @override
  Future<Record<T>> getRecord<T>(RecordReference<T> ref) {
    return _http
        .get(_getPathFromRecordReference<T>(ref))
        .then((res) => _getRecordFromJson(ref.resource, res, ref.id));
  }

  @override
  Future<void> update<T, V>(RecordReference<T> ref, V newValue) {
    return _http.put(_getPathFromRecordReference<T>(ref),
        data: _serializer.serializeValue<V>(newValue));
  }

  @override
  Stream<QueryResult<T>> watchQuery<T>(Query<T> query) {
    return getQuery<T>(query).asStream();
  }

  @override
  Stream<Record<T>> watchRecord<T>(RecordReference<T> ref) {
    return getRecord<T>(ref).asStream();
  }

  String _getPathFromCollection<T>(Collection<T> col) {
    return '/${col.resource}';
  }

  String _getPathFromRecordReference<T>(RecordReference<T> ref) {
    return '/${ref.resource}/${ref.id}';
  }

  Record<T> _getRecordFromJson<T>(String resource, dynamic json,
      [String? recordId]) {
    final data =
        _serializer.deserializeValue<T>(Map<String, dynamic>.from(json));
    final String id = recordId ?? json['id'];
    final ref = collection<T>(resource).ref(id);
    return Record<T>((b) => b
      ..data = data
      ..ref = ref.toBuilder());
  }
}
