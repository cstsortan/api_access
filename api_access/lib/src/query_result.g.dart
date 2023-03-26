// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QueryResult<T> extends QueryResult<T> {
  @override
  final Collection<T> collection;
  @override
  final BuiltList<Record<T>> records;
  @override
  final bool hasError;

  factory _$QueryResult([void Function(QueryResultBuilder<T>)? updates]) =>
      (new QueryResultBuilder<T>()..update(updates))._build();

  _$QueryResult._(
      {required this.collection, required this.records, required this.hasError})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        collection, r'QueryResult', 'collection');
    BuiltValueNullFieldError.checkNotNull(records, r'QueryResult', 'records');
    BuiltValueNullFieldError.checkNotNull(hasError, r'QueryResult', 'hasError');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'QueryResult', 'T');
    }
  }

  @override
  QueryResult<T> rebuild(void Function(QueryResultBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QueryResultBuilder<T> toBuilder() =>
      new QueryResultBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QueryResult &&
        collection == other.collection &&
        records == other.records &&
        hasError == other.hasError;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collection.hashCode);
    _$hash = $jc(_$hash, records.hashCode);
    _$hash = $jc(_$hash, hasError.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QueryResult')
          ..add('collection', collection)
          ..add('records', records)
          ..add('hasError', hasError))
        .toString();
  }
}

class QueryResultBuilder<T>
    implements Builder<QueryResult<T>, QueryResultBuilder<T>> {
  _$QueryResult<T>? _$v;

  CollectionBuilder<T>? _collection;
  CollectionBuilder<T> get collection =>
      _$this._collection ??= new CollectionBuilder<T>();
  set collection(CollectionBuilder<T>? collection) =>
      _$this._collection = collection;

  ListBuilder<Record<T>>? _records;
  ListBuilder<Record<T>> get records =>
      _$this._records ??= new ListBuilder<Record<T>>();
  set records(ListBuilder<Record<T>>? records) => _$this._records = records;

  bool? _hasError;
  bool? get hasError => _$this._hasError;
  set hasError(bool? hasError) => _$this._hasError = hasError;

  QueryResultBuilder();

  QueryResultBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _collection = $v.collection.toBuilder();
      _records = $v.records.toBuilder();
      _hasError = $v.hasError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QueryResult<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QueryResult<T>;
  }

  @override
  void update(void Function(QueryResultBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QueryResult<T> build() => _build();

  _$QueryResult<T> _build() {
    _$QueryResult<T> _$result;
    try {
      _$result = _$v ??
          new _$QueryResult<T>._(
              collection: collection.build(),
              records: records.build(),
              hasError: BuiltValueNullFieldError.checkNotNull(
                  hasError, r'QueryResult', 'hasError'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collection';
        collection.build();
        _$failedField = 'records';
        records.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QueryResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
