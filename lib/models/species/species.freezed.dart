// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'species.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Species _$SpeciesFromJson(Map<String, dynamic> json) {
  return _Species.fromJson(json);
}

/// @nodoc
mixin _$Species {
  String get code => throw _privateConstructorUsedError;
  String? get commonName => throw _privateConstructorUsedError;
  String? get scientificName => throw _privateConstructorUsedError;
  String? get family => throw _privateConstructorUsedError;
  String? get growthForm => throw _privateConstructorUsedError;
  String? get nativeStatus => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this Species to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Species
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeciesCopyWith<Species> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesCopyWith<$Res> {
  factory $SpeciesCopyWith(Species value, $Res Function(Species) then) =
      _$SpeciesCopyWithImpl<$Res, Species>;
  @useResult
  $Res call({
    String code,
    String? commonName,
    String? scientificName,
    String? family,
    String? growthForm,
    String? nativeStatus,
    bool active,
  });
}

/// @nodoc
class _$SpeciesCopyWithImpl<$Res, $Val extends Species>
    implements $SpeciesCopyWith<$Res> {
  _$SpeciesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Species
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? commonName = freezed,
    Object? scientificName = freezed,
    Object? family = freezed,
    Object? growthForm = freezed,
    Object? nativeStatus = freezed,
    Object? active = null,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            commonName: freezed == commonName
                ? _value.commonName
                : commonName // ignore: cast_nullable_to_non_nullable
                      as String?,
            scientificName: freezed == scientificName
                ? _value.scientificName
                : scientificName // ignore: cast_nullable_to_non_nullable
                      as String?,
            family: freezed == family
                ? _value.family
                : family // ignore: cast_nullable_to_non_nullable
                      as String?,
            growthForm: freezed == growthForm
                ? _value.growthForm
                : growthForm // ignore: cast_nullable_to_non_nullable
                      as String?,
            nativeStatus: freezed == nativeStatus
                ? _value.nativeStatus
                : nativeStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpeciesImplCopyWith<$Res> implements $SpeciesCopyWith<$Res> {
  factory _$$SpeciesImplCopyWith(
    _$SpeciesImpl value,
    $Res Function(_$SpeciesImpl) then,
  ) = __$$SpeciesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String? commonName,
    String? scientificName,
    String? family,
    String? growthForm,
    String? nativeStatus,
    bool active,
  });
}

/// @nodoc
class __$$SpeciesImplCopyWithImpl<$Res>
    extends _$SpeciesCopyWithImpl<$Res, _$SpeciesImpl>
    implements _$$SpeciesImplCopyWith<$Res> {
  __$$SpeciesImplCopyWithImpl(
    _$SpeciesImpl _value,
    $Res Function(_$SpeciesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Species
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? commonName = freezed,
    Object? scientificName = freezed,
    Object? family = freezed,
    Object? growthForm = freezed,
    Object? nativeStatus = freezed,
    Object? active = null,
  }) {
    return _then(
      _$SpeciesImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        commonName: freezed == commonName
            ? _value.commonName
            : commonName // ignore: cast_nullable_to_non_nullable
                  as String?,
        scientificName: freezed == scientificName
            ? _value.scientificName
            : scientificName // ignore: cast_nullable_to_non_nullable
                  as String?,
        family: freezed == family
            ? _value.family
            : family // ignore: cast_nullable_to_non_nullable
                  as String?,
        growthForm: freezed == growthForm
            ? _value.growthForm
            : growthForm // ignore: cast_nullable_to_non_nullable
                  as String?,
        nativeStatus: freezed == nativeStatus
            ? _value.nativeStatus
            : nativeStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpeciesImpl extends _Species {
  const _$SpeciesImpl({
    required this.code,
    this.commonName,
    this.scientificName,
    this.family,
    this.growthForm,
    this.nativeStatus,
    this.active = true,
  }) : super._();

  factory _$SpeciesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeciesImplFromJson(json);

  @override
  final String code;
  @override
  final String? commonName;
  @override
  final String? scientificName;
  @override
  final String? family;
  @override
  final String? growthForm;
  @override
  final String? nativeStatus;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'Species(code: $code, commonName: $commonName, scientificName: $scientificName, family: $family, growthForm: $growthForm, nativeStatus: $nativeStatus, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.commonName, commonName) ||
                other.commonName == commonName) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.growthForm, growthForm) ||
                other.growthForm == growthForm) &&
            (identical(other.nativeStatus, nativeStatus) ||
                other.nativeStatus == nativeStatus) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    commonName,
    scientificName,
    family,
    growthForm,
    nativeStatus,
    active,
  );

  /// Create a copy of Species
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesImplCopyWith<_$SpeciesImpl> get copyWith =>
      __$$SpeciesImplCopyWithImpl<_$SpeciesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeciesImplToJson(this);
  }
}

abstract class _Species extends Species {
  const factory _Species({
    required final String code,
    final String? commonName,
    final String? scientificName,
    final String? family,
    final String? growthForm,
    final String? nativeStatus,
    final bool active,
  }) = _$SpeciesImpl;
  const _Species._() : super._();

  factory _Species.fromJson(Map<String, dynamic> json) = _$SpeciesImpl.fromJson;

  @override
  String get code;
  @override
  String? get commonName;
  @override
  String? get scientificName;
  @override
  String? get family;
  @override
  String? get growthForm;
  @override
  String? get nativeStatus;
  @override
  bool get active;

  /// Create a copy of Species
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeciesImplCopyWith<_$SpeciesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
