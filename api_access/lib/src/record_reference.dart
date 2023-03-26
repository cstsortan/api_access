import 'package:built_value/built_value.dart';

import 'api_access.dart';
import 'record.dart';

part 'record_reference.g.dart';

abstract class RecordReference<T>
    implements Built<RecordReference<T>, RecordReferenceBuilder<T>> {
  RecordReference._();

  String get id;
  String get resource;
  IApiAccess get api;

  Future<void> delete() {
    return api.delete(this);
  }

  Future<void> update<V>(V newData) {
    return api.update<T, V>(this, newData);
  }

  Future<Record<T>> get() {
    return api.getRecord(this);
  }

  Stream<Record<T>> watch() {
    return api.watchRecord<T>(this);
  }

  factory RecordReference([void Function(RecordReferenceBuilder<T>) updates]) =
      _$RecordReference<T>;
}
