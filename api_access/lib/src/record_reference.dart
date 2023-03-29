import 'package:built_value/built_value.dart';

import 'api_access.dart';
import 'record.dart';

part 'record_reference.g.dart';

/// A reference to a specific record in a remote data source.
///
/// A record reference consists of a unique ID and the resource it belongs to,
/// as well as a reference to the API that should be used to interact with it.
/// Record references can be used to watch, retrieve, update, and delete
/// individual records using the corresponding methods.
abstract class RecordReference<T>
    implements Built<RecordReference<T>, RecordReferenceBuilder<T>> {
  RecordReference._();

  /// The unique identifier of the record.
  String get id;

  /// The resource that the record belongs to.
  String get resource;

  /// The API that should be used to interact with the record.
  /// We're maintaining an instance in order to provide with helper functions
  IApiAccess get api;

  /// Deletes the record from the data source.
  ///
  /// Returns a [Future] that completes when the record has been deleted.
  Future<void> delete() {
    return api.delete(this);
  }

  /// Updates the record with new data.
  ///
  /// [newData] may need to be of different data type than the original record.
  /// Returns a [Future] that completes when the record has been updated.
  Future<void> update<V>(V newData) {
    return api.update<T, V>(this, newData);
  }

  /// Retrieves the current state of the record.
  ///
  /// Returns a [Future] that completes with a [Record] instance representing
  /// the current state of the record.
  Future<Record<T>> get() {
    return api.getRecord(this);
  }

  /// Watches the record for changes.
  ///
  /// Returns a [Stream] of [Record] instances representing the current state
  /// of the record and any subsequent changes to it.
  Stream<Record<T>> watch() {
    return api.watchRecord<T>(this);
  }

  factory RecordReference([void Function(RecordReferenceBuilder<T>) updates]) =
      _$RecordReference<T>;
}
