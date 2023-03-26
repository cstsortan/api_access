import 'package:api_access/api_access.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirestoreApiAccess implements IApiAccess {
  final RecordDataSerializer<Map<String, dynamic>> _serializer;
  final firestore.FirebaseFirestore _db;

  FirestoreApiAccess(this._db, this._serializer);

  @override
  Future<void> create<T>(Collection<T> collection, T data) {
    return _db
        .collection(collection.resource)
        .add(_serializer.serializeValue(data));
  }

  @override
  Future<void> delete<T>(RecordReference<T> ref) {
    return _db.collection(ref.resource).doc(ref.id).delete();
  }

  @override
  Future<QueryResult<T>> getQuery<T>(Query<T> query) {
    return _getFirestoreQuery<T>(query)
        .get()
        .then((value) => getQueryResultFromQuerySnapshot<T>(
            query.collection.resource, value, false))
        .catchError((_) {
      return getQueryResultFromQuerySnapshot<T>(
          query.collection.resource, null, true);
    });
  }

  @override
  Future<Record<T>> getRecord<T>(RecordReference<T> ref) {
    return _getDocumentReferenceFromRecordReference<T>(ref)
        .get()
        .then((snap) => _getRecordFromDocumentSnapshot<T>(snap));
  }

  @override
  Future<void> update<T, V>(RecordReference<T> ref, V newValue) {
    final newValueMap = _serializer.serializeValue<V>(newValue);
    return _db.collection(ref.resource).doc(ref.id).update(newValueMap);
  }

  @override
  Stream<QueryResult<T>> watchQuery<T>(Query<T> query) {
    return _getFirestoreQuery<T>(query)
        .snapshots()
        .map((value) => getQueryResultFromQuerySnapshot<T>(
            query.collection.resource, value, false))
        .handleError((error) {
      return getQueryResultFromQuerySnapshot<T>(
          query.collection.resource, null, true);
    });
  }

  @override
  Stream<Record<T>> watchRecord<T>(RecordReference<T> ref) {
    return _getDocumentReferenceFromRecordReference<T>(ref)
        .snapshots()
        .map((snap) => _getRecordFromDocumentSnapshot<T>(snap));
  }

  @override
  Collection<T> collection<T>(String resource) {
    return Collection<T>((b) => b
      ..api = this
      ..resource = resource);
  }

  Record<T> _getRecordFromDocumentSnapshot<T>(
    firestore.DocumentSnapshot snap,
  ) {
    final data = !snap.exists
        ? null
        : _serializer.deserializeValue<T>(snap.data() as Map<String, dynamic>);
    return Record<T>((b) => b
      ..ref = _getRecordReferenceFromDocumentReference<T>(snap.reference)
          .toBuilder()
      ..data = data);
  }

  RecordReference<T> _getRecordReferenceFromDocumentReference<T>(
      firestore.DocumentReference doc) {
    return RecordReference((b) => b
      ..api = this
      ..id = doc.id
      ..resource = doc.parent.path);
  }

  firestore.DocumentReference _getDocumentReferenceFromRecordReference<T>(
    RecordReference<T> recordReference,
  ) {
    return _db.collection(recordReference.resource).doc(recordReference.id);
  }

  firestore.Query _getFirestoreQuery<T>(Query<T> query) {
    firestore.Query q = _db.collection(query.collection.resource);

    query.filters?.forEach((key, value) {
      q = q.where(key, isEqualTo: value);
    });

    return q;
  }

  QueryResult<T> getQueryResultFromQuerySnapshot<T>(
      String resource, firestore.QuerySnapshot? querySnapshot, bool hasError) {
    final records = querySnapshot?.docs.map((docSnapshot) {
          return _getRecordFromDocumentSnapshot<T>(docSnapshot);
        }).toList() ??
        [];

    return QueryResult((b) => b
      ..collection = collection<T>(resource).toBuilder()
      ..hasError = hasError
      ..records = ListBuilder(records));
  }
}
