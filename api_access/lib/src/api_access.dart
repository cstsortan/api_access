import 'collection.dart';
import 'query.dart';
import 'query_result.dart';
import 'record.dart';
import 'record_reference.dart';

abstract class IApiAccess {
  Future<void> delete<T>(RecordReference<T> ref);
  Future<void> update<T, V>(RecordReference<T> ref, V newValue);
  Collection<T> collection<T>(String resource) {
    return Collection<T>((b) => b
      ..resource = resource
      ..api = this);
  }

  /// used to display on UI
  /// These data may come from cache
  Stream<QueryResult<T>> watchQuery<T>(Query<T> query);

  /// The response data will always be from the server
  Future<QueryResult<T>> getQuery<T>(Query<T> query);

  Stream<Record<T>> watchRecord<T>(RecordReference<T> ref);

  Future<Record<T>> getRecord<T>(RecordReference<T> ref);

  Future<void> create<T>(Collection<T> collection, T data);
}
