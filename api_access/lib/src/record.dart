import 'package:built_value/built_value.dart';

import 'record_reference.dart';

part 'record.g.dart';

abstract class Record<T> implements Built<Record<T>, RecordBuilder<T>> {
  RecordReference<T> get ref;
  T? get data;

  bool get exists {
    return data != null;
  }

  Future<void> delete() {
    return ref.delete();
  }

  Future<void> update<V>(V newData) {
    return ref.update<V>(newData);
  }

  Record._();
  factory Record([void Function(RecordBuilder<T>) updates]) = _$Record<T>;
}
