import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'collection.dart';
import 'query_result.dart';

part 'query.g.dart';

/// Represents a query for retrieving data from a remote data source.
///
/// A query consists of a collection to query and an optional set of filters to
/// apply to the results. Queries can be watched or retrieved using the [watch]
/// and [get] methods, respectively.
abstract class Query<T> implements Built<Query<T>, QueryBuilder<T>> {
  /// The collection to query.
  Collection<T> get collection;

  /// The filters to apply to the query, if any.
  BuiltMap<String, Object>? get filters;

  /// Creates a new query.
  ///
  /// If [updates] is provided, it is used to update the new query instance
  /// before it is returned.
  factory Query([void Function(QueryBuilder<T>) updates]) = _$Query<T>;
  Query._();

  /// Watches the query for changes.
  ///
  /// Returns a [Stream] of [QueryResult] instances representing the current
  /// state of the query and any subsequent changes to it.
  Stream<QueryResult<T>> watch() {
    return collection.api.watchQuery(this);
  }

  /// Executes the query and returns the results.
  ///
  /// Returns a [Future] that completes with a [QueryResult] instance
  /// representing the current state of the query.
  Future<QueryResult<T>> get() {
    return collection.api.getQuery(this);
  }
}
