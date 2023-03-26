import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'collection.dart';
import 'query_result.dart';

part 'query.g.dart';

abstract class Query<T> implements Built<Query<T>, QueryBuilder<T>> {
  Collection<T> get collection;
  BuiltMap<String, Object>? get filters;

  Query._();
  factory Query([void Function(QueryBuilder<T>) updates]) = _$Query<T>;

  Stream<QueryResult<T>> watch() {
    return collection.api.watchQuery(this);
  }

  Future<QueryResult<T>> get() {
    return collection.api.getQuery(this);
  }
}
