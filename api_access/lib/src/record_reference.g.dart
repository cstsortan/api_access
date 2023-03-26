// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_reference.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordReference<T> extends RecordReference<T> {
  @override
  final String id;
  @override
  final String resource;
  @override
  final IApiAccess api;

  factory _$RecordReference(
          [void Function(RecordReferenceBuilder<T>)? updates]) =>
      (new RecordReferenceBuilder<T>()..update(updates))._build();

  _$RecordReference._(
      {required this.id, required this.resource, required this.api})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'RecordReference', 'id');
    BuiltValueNullFieldError.checkNotNull(
        resource, r'RecordReference', 'resource');
    BuiltValueNullFieldError.checkNotNull(api, r'RecordReference', 'api');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'RecordReference', 'T');
    }
  }

  @override
  RecordReference<T> rebuild(
          void Function(RecordReferenceBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecordReferenceBuilder<T> toBuilder() =>
      new RecordReferenceBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordReference &&
        id == other.id &&
        resource == other.resource &&
        api == other.api;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, resource.hashCode);
    _$hash = $jc(_$hash, api.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordReference')
          ..add('id', id)
          ..add('resource', resource)
          ..add('api', api))
        .toString();
  }
}

class RecordReferenceBuilder<T>
    implements Builder<RecordReference<T>, RecordReferenceBuilder<T>> {
  _$RecordReference<T>? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _resource;
  String? get resource => _$this._resource;
  set resource(String? resource) => _$this._resource = resource;

  IApiAccess? _api;
  IApiAccess? get api => _$this._api;
  set api(IApiAccess? api) => _$this._api = api;

  RecordReferenceBuilder();

  RecordReferenceBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _resource = $v.resource;
      _api = $v.api;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordReference<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordReference<T>;
  }

  @override
  void update(void Function(RecordReferenceBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordReference<T> build() => _build();

  _$RecordReference<T> _build() {
    final _$result = _$v ??
        new _$RecordReference<T>._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'RecordReference', 'id'),
            resource: BuiltValueNullFieldError.checkNotNull(
                resource, r'RecordReference', 'resource'),
            api: BuiltValueNullFieldError.checkNotNull(
                api, r'RecordReference', 'api'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
