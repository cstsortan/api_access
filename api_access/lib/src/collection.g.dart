// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Collection<T> extends Collection<T> {
  @override
  final String resource;
  @override
  final IApiAccess api;

  factory _$Collection([void Function(CollectionBuilder<T>)? updates]) =>
      (new CollectionBuilder<T>()..update(updates))._build();

  _$Collection._({required this.resource, required this.api}) : super._() {
    BuiltValueNullFieldError.checkNotNull(resource, r'Collection', 'resource');
    BuiltValueNullFieldError.checkNotNull(api, r'Collection', 'api');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'Collection', 'T');
    }
  }

  @override
  Collection<T> rebuild(void Function(CollectionBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionBuilder<T> toBuilder() => new CollectionBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Collection &&
        resource == other.resource &&
        api == other.api;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, resource.hashCode);
    _$hash = $jc(_$hash, api.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Collection')
          ..add('resource', resource)
          ..add('api', api))
        .toString();
  }
}

class CollectionBuilder<T>
    implements Builder<Collection<T>, CollectionBuilder<T>> {
  _$Collection<T>? _$v;

  String? _resource;
  String? get resource => _$this._resource;
  set resource(String? resource) => _$this._resource = resource;

  IApiAccess? _api;
  IApiAccess? get api => _$this._api;
  set api(IApiAccess? api) => _$this._api = api;

  CollectionBuilder();

  CollectionBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _resource = $v.resource;
      _api = $v.api;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Collection<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Collection<T>;
  }

  @override
  void update(void Function(CollectionBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Collection<T> build() => _build();

  _$Collection<T> _build() {
    final _$result = _$v ??
        new _$Collection<T>._(
            resource: BuiltValueNullFieldError.checkNotNull(
                resource, r'Collection', 'resource'),
            api: BuiltValueNullFieldError.checkNotNull(
                api, r'Collection', 'api'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
