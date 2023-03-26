import 'package:api_access/api_access.dart';
import 'package:firebase_database/firebase_database.dart' as fb;

class RealtimeDatabaseApiAccess implements IApiAccess {
  final fb.FirebaseDatabase _db;
  final RecordDataSerializer<Map<String, dynamic>> _serializer;

  RealtimeDatabaseApiAccess(this._db, this._serializer);

  @override
  Collection<T> collection<T>(String resource) {
    return Collection<T>((b) => b
      ..api = this
      ..resource = resource);
  }

  @override
  Future<void> create<T>(Collection<T> collection, T data) {
    final dataMap = _serializer.serializeValue<T>(data);
    return _getReferenceFromCollection(collection).push().set(dataMap);
  }

  @override
  Future<void> delete<T>(RecordReference<T> ref) {
    return _getReferenceFromRecordReference(ref).remove();
  }

  @override
  Future<QueryResult<T>> getQuery<T>(Query<T> query) {
    fb.Query q = _db.ref(query.collection.resource);
    query.filters?.forEach((key, value) {
      q = q.orderByChild(key).equalTo(value);
    });
    return q
        .get()
        .then((snap) => _getQueryResultFromDataSnapshot<T>(
            snap, false, query.collection.resource))
        .catchError((_) => _getQueryResultFromDataSnapshot<T>(
            null, false, query.collection.resource));
  }

  @override
  Future<Record<T>> getRecord<T>(RecordReference<T> ref) {
    final dbRef = _db.ref(ref.resource).child(ref.id);
    return dbRef.get().then((snap) => _getRecordFromDataSnapshot<T>(snap));
  }

  @override
  Future<void> update<T, V>(RecordReference<T> ref, V newValue) {
    final dbRef = _db.ref(ref.resource).child(ref.id);
    final newValueMap = _serializer.serializeValue<V>(newValue);

    return dbRef.update(newValueMap);
  }

  @override
  Stream<QueryResult<T>> watchQuery<T>(Query<T> query) {
    fb.Query q = _db.ref(query.collection.resource);
    query.filters?.forEach((key, value) {
      q = q.orderByChild(key).equalTo(value);
    });
    return q.onValue
        .map((event) => _getQueryResultFromDataSnapshot<T>(
            event.snapshot, false, query.collection.resource))
        .handleError((_) => _getQueryResultFromDataSnapshot<T>(
            null, false, query.collection.resource));
  }

  @override
  Stream<Record<T>> watchRecord<T>(RecordReference<T> ref) {
    final dbRef = _db.ref(ref.resource).child(ref.id);
    return dbRef.onValue
        .map((event) => _getRecordFromDataSnapshot<T>(event.snapshot));
  }

  fb.DatabaseReference _getReferenceFromRecordReference<T>(
      RecordReference<T> recordReference) {
    return _db.ref(recordReference.resource).child(recordReference.id);
  }

  fb.DatabaseReference _getReferenceFromCollection<T>(Collection<T> col) {
    return _db.ref(col.resource);
  }

  Record<T> _getRecordFromDataSnapshot<T>(fb.DataSnapshot snap) {
    final value = !snap.exists
        ? null
        : _serializer.deserializeValue<T>(snap.value as Map<String, dynamic>);
    return Record<T>((b) => b
      ..data = value
      ..ref = collection<T>(snap.ref.parent!.path).ref(snap.key!).toBuilder());
  }

  QueryResult<T> _getQueryResultFromDataSnapshot<T>(
      fb.DataSnapshot? snap, bool hasError, String resource) {
    final records =
        snap?.children.map((snap) => _getRecordFromDataSnapshot<T>(snap)) ??
            Iterable<Record<T>>.empty();

    final col = collection<T>(resource);

    return QueryResult((b) => b
      ..collection = col.toBuilder()
      ..records = ListBuilder(records)
      ..hasError = hasError);
  }
}
