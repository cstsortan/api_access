// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Record<T> extends Record<T> {
  @override
  final RecordReference<T> ref;
  @override
  final T? data;

  factory _$Record([void Function(RecordBuilder<T>)? updates]) =>
      (new RecordBuilder<T>()..update(updates))._build();

  _$Record._({required this.ref, this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ref, r'Record', 'ref');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'Record', 'T');
    }
  }

  @override
  Record<T> rebuild(void Function(RecordBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecordBuilder<T> toBuilder() => new RecordBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Record && ref == other.ref && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Record')
          ..add('ref', ref)
          ..add('data', data))
        .toString();
  }
}

class RecordBuilder<T> implements Builder<Record<T>, RecordBuilder<T>> {
  _$Record<T>? _$v;

  RecordReferenceBuilder<T>? _ref;
  RecordReferenceBuilder<T> get ref =>
      _$this._ref ??= new RecordReferenceBuilder<T>();
  set ref(RecordReferenceBuilder<T>? ref) => _$this._ref = ref;

  T? _data;
  T? get data => _$this._data;
  set data(T? data) => _$this._data = data;

  RecordBuilder();

  RecordBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Record<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Record<T>;
  }

  @override
  void update(void Function(RecordBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Record<T> build() => _build();

  _$Record<T> _build() {
    _$Record<T> _$result;
    try {
      _$result = _$v ?? new _$Record<T>._(ref: ref.build(), data: data);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ref';
        ref.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Record', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
