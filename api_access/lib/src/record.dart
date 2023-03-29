import 'package:built_value/built_value.dart';

import 'record_reference.dart';

part 'record.g.dart';

/// A generic class that describes a record in the database, containing both its reference and data.
///
/// The generic type `T` describes the type of data contained in the record.
///
/// The [RecordReference] instance `ref` is a reference to the record in the model.
///
/// The data contained in the record is nullable and can be accessed through the `data` property.
///
/// The `exists` property indicates whether the record data exists or not, which is determined by checking if the `data` property is null.
///
/// The `delete` method deletes the record from the database using its [RecordReference].
///
/// The `update` method updates the data in the record with new data, which is passed as a parameter.
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
