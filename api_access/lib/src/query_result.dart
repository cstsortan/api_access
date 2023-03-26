import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'collection.dart';
import 'record.dart';

part 'query_result.g.dart';

abstract class QueryResult<T>
    implements Built<QueryResult<T>, QueryResultBuilder<T>> {
  Collection<T> get collection;
  BuiltList<Record<T>> get records;
  bool get hasError;

  bool get hasData {
    return records.isNotEmpty;
  }

  QueryResult._();
  factory QueryResult([void Function(QueryResultBuilder<T>) updates]) =
      _$QueryResult<T>;
}
