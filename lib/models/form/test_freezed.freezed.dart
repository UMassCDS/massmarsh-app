// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TestFreezed _$TestFreezedFromJson(Map<String, dynamic> json) {
  return _TestFreezed.fromJson(json);
}

/// @nodoc
mixin _$TestFreezed {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this TestFreezed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestFreezedCopyWith<TestFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestFreezedCopyWith<$Res> {
  factory $TestFreezedCopyWith(
    TestFreezed value,
    $Res Function(TestFreezed) then,
  ) = _$TestFreezedCopyWithImpl<$Res, TestFreezed>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$TestFreezedCopyWithImpl<$Res, $Val extends TestFreezed>
    implements $TestFreezedCopyWith<$Res> {
  _$TestFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TestFreezedImplCopyWith<$Res>
    implements $TestFreezedCopyWith<$Res> {
  factory _$$TestFreezedImplCopyWith(
    _$TestFreezedImpl value,
    $Res Function(_$TestFreezedImpl) then,
  ) = __$$TestFreezedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$TestFreezedImplCopyWithImpl<$Res>
    extends _$TestFreezedCopyWithImpl<$Res, _$TestFreezedImpl>
    implements _$$TestFreezedImplCopyWith<$Res> {
  __$$TestFreezedImplCopyWithImpl(
    _$TestFreezedImpl _value,
    $Res Function(_$TestFreezedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TestFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$TestFreezedImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TestFreezedImpl extends _TestFreezed {
  const _$TestFreezedImpl({required this.id, required this.name}) : super._();

  factory _$TestFreezedImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestFreezedImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'TestFreezed(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestFreezedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of TestFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestFreezedImplCopyWith<_$TestFreezedImpl> get copyWith =>
      __$$TestFreezedImplCopyWithImpl<_$TestFreezedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestFreezedImplToJson(this);
  }
}

abstract class _TestFreezed extends TestFreezed {
  const factory _TestFreezed({
    required final String id,
    required final String name,
  }) = _$TestFreezedImpl;
  const _TestFreezed._() : super._();

  factory _TestFreezed.fromJson(Map<String, dynamic> json) =
      _$TestFreezedImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of TestFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestFreezedImplCopyWith<_$TestFreezedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
