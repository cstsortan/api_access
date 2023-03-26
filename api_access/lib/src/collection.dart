import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'api_access.dart';
import 'query.dart';
import 'query_result.dart';
import 'record_reference.dart';

part 'collection.g.dart';

abstract class Collection<T>
    implements Built<Collection<T>, CollectionBuilder<T>> {
  String get resource;

  IApiAccess get api;

  RecordReference<T> ref(String id) {
    return RecordReference<T>((b) => b
      ..resource = resource
      ..id = id
      ..api = api);
  }

  Collection._();

  Query<T> query([Map<String, Object?>? filters]) {
    return Query<T>((b) => b
      ..collection = toBuilder()
      ..filters = MapBuilder(filters));
  }

  Future<void> create(T data) {
    return api.create(this, data);
  }

  factory Collection([void Function(CollectionBuilder<T>) updates]) =
      _$Collection<T>;
}
