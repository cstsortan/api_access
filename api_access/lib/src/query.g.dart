// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Query<T> extends Query<T> {
  @override
  final Collection<T> collection;
  @override
  final BuiltMap<String, Object>? filters;

  factory _$Query([void Function(QueryBuilder<T>)? updates]) =>
      (new QueryBuilder<T>()..update(updates))._build();

  _$Query._({required this.collection, this.filters}) : super._() {
    BuiltValueNullFieldError.checkNotNull(collection, r'Query', 'collection');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'Query', 'T');
    }
  }

  @override
  Query<T> rebuild(void Function(QueryBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QueryBuilder<T> toBuilder() => new QueryBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Query &&
        collection == other.collection &&
        filters == other.filters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collection.hashCode);
    _$hash = $jc(_$hash, filters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Query')
          ..add('collection', collection)
          ..add('filters', filters))
        .toString();
  }
}

class QueryBuilder<T> implements Builder<Query<T>, QueryBuilder<T>> {
  _$Query<T>? _$v;

  CollectionBuilder<T>? _collection;
  CollectionBuilder<T> get collection =>
      _$this._collection ??= new CollectionBuilder<T>();
  set collection(CollectionBuilder<T>? collection) =>
      _$this._collection = collection;

  MapBuilder<String, Object>? _filters;
  MapBuilder<String, Object> get filters =>
      _$this._filters ??= new MapBuilder<String, Object>();
  set filters(MapBuilder<String, Object>? filters) => _$this._filters = filters;

  QueryBuilder();

  QueryBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _collection = $v.collection.toBuilder();
      _filters = $v.filters?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Query<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Query<T>;
  }

  @override
  void update(void Function(QueryBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Query<T> build() => _build();

  _$Query<T> _build() {
    _$Query<T> _$result;
    try {
      _$result = _$v ??
          new _$Query<T>._(
              collection: collection.build(), filters: _filters?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collection';
        collection.build();
        _$failedField = 'filters';
        _filters?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Query', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
