// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FormConfig _$FormConfigFromJson(Map<String, dynamic> json) {
  return _FormConfig.fromJson(json);
}

/// @nodoc
mixin _$FormConfig {
  int get orgId => throw _privateConstructorUsedError;
  String get configVersion => throw _privateConstructorUsedError;
  String get configHash => throw _privateConstructorUsedError;
  CommonFormConfig get commonForm => throw _privateConstructorUsedError;
  VegetationFormConfig get vegetationForm => throw _privateConstructorUsedError;
  HydrologyFormConfig get hydrologyForm => throw _privateConstructorUsedError;
  ElevationFormConfig get elevationForm => throw _privateConstructorUsedError;
  DateTime get downloadedAt => throw _privateConstructorUsedError;
  DateTime? get lastValidatedAt => throw _privateConstructorUsedError;

  /// Serializes this FormConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormConfigCopyWith<FormConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormConfigCopyWith<$Res> {
  factory $FormConfigCopyWith(
    FormConfig value,
    $Res Function(FormConfig) then,
  ) = _$FormConfigCopyWithImpl<$Res, FormConfig>;
  @useResult
  $Res call({
    int orgId,
    String configVersion,
    String configHash,
    CommonFormConfig commonForm,
    VegetationFormConfig vegetationForm,
    HydrologyFormConfig hydrologyForm,
    ElevationFormConfig elevationForm,
    DateTime downloadedAt,
    DateTime? lastValidatedAt,
  });

  $CommonFormConfigCopyWith<$Res> get commonForm;
  $VegetationFormConfigCopyWith<$Res> get vegetationForm;
  $HydrologyFormConfigCopyWith<$Res> get hydrologyForm;
  $ElevationFormConfigCopyWith<$Res> get elevationForm;
}

/// @nodoc
class _$FormConfigCopyWithImpl<$Res, $Val extends FormConfig>
    implements $FormConfigCopyWith<$Res> {
  _$FormConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = null,
    Object? configVersion = null,
    Object? configHash = null,
    Object? commonForm = null,
    Object? vegetationForm = null,
    Object? hydrologyForm = null,
    Object? elevationForm = null,
    Object? downloadedAt = null,
    Object? lastValidatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            orgId: null == orgId
                ? _value.orgId
                : orgId // ignore: cast_nullable_to_non_nullable
                      as int,
            configVersion: null == configVersion
                ? _value.configVersion
                : configVersion // ignore: cast_nullable_to_non_nullable
                      as String,
            configHash: null == configHash
                ? _value.configHash
                : configHash // ignore: cast_nullable_to_non_nullable
                      as String,
            commonForm: null == commonForm
                ? _value.commonForm
                : commonForm // ignore: cast_nullable_to_non_nullable
                      as CommonFormConfig,
            vegetationForm: null == vegetationForm
                ? _value.vegetationForm
                : vegetationForm // ignore: cast_nullable_to_non_nullable
                      as VegetationFormConfig,
            hydrologyForm: null == hydrologyForm
                ? _value.hydrologyForm
                : hydrologyForm // ignore: cast_nullable_to_non_nullable
                      as HydrologyFormConfig,
            elevationForm: null == elevationForm
                ? _value.elevationForm
                : elevationForm // ignore: cast_nullable_to_non_nullable
                      as ElevationFormConfig,
            downloadedAt: null == downloadedAt
                ? _value.downloadedAt
                : downloadedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastValidatedAt: freezed == lastValidatedAt
                ? _value.lastValidatedAt
                : lastValidatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonFormConfigCopyWith<$Res> get commonForm {
    return $CommonFormConfigCopyWith<$Res>(_value.commonForm, (value) {
      return _then(_value.copyWith(commonForm: value) as $Val);
    });
  }

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VegetationFormConfigCopyWith<$Res> get vegetationForm {
    return $VegetationFormConfigCopyWith<$Res>(_value.vegetationForm, (value) {
      return _then(_value.copyWith(vegetationForm: value) as $Val);
    });
  }

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HydrologyFormConfigCopyWith<$Res> get hydrologyForm {
    return $HydrologyFormConfigCopyWith<$Res>(_value.hydrologyForm, (value) {
      return _then(_value.copyWith(hydrologyForm: value) as $Val);
    });
  }

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ElevationFormConfigCopyWith<$Res> get elevationForm {
    return $ElevationFormConfigCopyWith<$Res>(_value.elevationForm, (value) {
      return _then(_value.copyWith(elevationForm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormConfigImplCopyWith<$Res>
    implements $FormConfigCopyWith<$Res> {
  factory _$$FormConfigImplCopyWith(
    _$FormConfigImpl value,
    $Res Function(_$FormConfigImpl) then,
  ) = __$$FormConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int orgId,
    String configVersion,
    String configHash,
    CommonFormConfig commonForm,
    VegetationFormConfig vegetationForm,
    HydrologyFormConfig hydrologyForm,
    ElevationFormConfig elevationForm,
    DateTime downloadedAt,
    DateTime? lastValidatedAt,
  });

  @override
  $CommonFormConfigCopyWith<$Res> get commonForm;
  @override
  $VegetationFormConfigCopyWith<$Res> get vegetationForm;
  @override
  $HydrologyFormConfigCopyWith<$Res> get hydrologyForm;
  @override
  $ElevationFormConfigCopyWith<$Res> get elevationForm;
}

/// @nodoc
class __$$FormConfigImplCopyWithImpl<$Res>
    extends _$FormConfigCopyWithImpl<$Res, _$FormConfigImpl>
    implements _$$FormConfigImplCopyWith<$Res> {
  __$$FormConfigImplCopyWithImpl(
    _$FormConfigImpl _value,
    $Res Function(_$FormConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgId = null,
    Object? configVersion = null,
    Object? configHash = null,
    Object? commonForm = null,
    Object? vegetationForm = null,
    Object? hydrologyForm = null,
    Object? elevationForm = null,
    Object? downloadedAt = null,
    Object? lastValidatedAt = freezed,
  }) {
    return _then(
      _$FormConfigImpl(
        orgId: null == orgId
            ? _value.orgId
            : orgId // ignore: cast_nullable_to_non_nullable
                  as int,
        configVersion: null == configVersion
            ? _value.configVersion
            : configVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        configHash: null == configHash
            ? _value.configHash
            : configHash // ignore: cast_nullable_to_non_nullable
                  as String,
        commonForm: null == commonForm
            ? _value.commonForm
            : commonForm // ignore: cast_nullable_to_non_nullable
                  as CommonFormConfig,
        vegetationForm: null == vegetationForm
            ? _value.vegetationForm
            : vegetationForm // ignore: cast_nullable_to_non_nullable
                  as VegetationFormConfig,
        hydrologyForm: null == hydrologyForm
            ? _value.hydrologyForm
            : hydrologyForm // ignore: cast_nullable_to_non_nullable
                  as HydrologyFormConfig,
        elevationForm: null == elevationForm
            ? _value.elevationForm
            : elevationForm // ignore: cast_nullable_to_non_nullable
                  as ElevationFormConfig,
        downloadedAt: null == downloadedAt
            ? _value.downloadedAt
            : downloadedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastValidatedAt: freezed == lastValidatedAt
            ? _value.lastValidatedAt
            : lastValidatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormConfigImpl implements _FormConfig {
  const _$FormConfigImpl({
    required this.orgId,
    required this.configVersion,
    required this.configHash,
    required this.commonForm,
    required this.vegetationForm,
    required this.hydrologyForm,
    required this.elevationForm,
    required this.downloadedAt,
    this.lastValidatedAt,
  });

  factory _$FormConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormConfigImplFromJson(json);

  @override
  final int orgId;
  @override
  final String configVersion;
  @override
  final String configHash;
  @override
  final CommonFormConfig commonForm;
  @override
  final VegetationFormConfig vegetationForm;
  @override
  final HydrologyFormConfig hydrologyForm;
  @override
  final ElevationFormConfig elevationForm;
  @override
  final DateTime downloadedAt;
  @override
  final DateTime? lastValidatedAt;

  @override
  String toString() {
    return 'FormConfig(orgId: $orgId, configVersion: $configVersion, configHash: $configHash, commonForm: $commonForm, vegetationForm: $vegetationForm, hydrologyForm: $hydrologyForm, elevationForm: $elevationForm, downloadedAt: $downloadedAt, lastValidatedAt: $lastValidatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormConfigImpl &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.configVersion, configVersion) ||
                other.configVersion == configVersion) &&
            (identical(other.configHash, configHash) ||
                other.configHash == configHash) &&
            (identical(other.commonForm, commonForm) ||
                other.commonForm == commonForm) &&
            (identical(other.vegetationForm, vegetationForm) ||
                other.vegetationForm == vegetationForm) &&
            (identical(other.hydrologyForm, hydrologyForm) ||
                other.hydrologyForm == hydrologyForm) &&
            (identical(other.elevationForm, elevationForm) ||
                other.elevationForm == elevationForm) &&
            (identical(other.downloadedAt, downloadedAt) ||
                other.downloadedAt == downloadedAt) &&
            (identical(other.lastValidatedAt, lastValidatedAt) ||
                other.lastValidatedAt == lastValidatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orgId,
    configVersion,
    configHash,
    commonForm,
    vegetationForm,
    hydrologyForm,
    elevationForm,
    downloadedAt,
    lastValidatedAt,
  );

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormConfigImplCopyWith<_$FormConfigImpl> get copyWith =>
      __$$FormConfigImplCopyWithImpl<_$FormConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormConfigImplToJson(this);
  }
}

abstract class _FormConfig implements FormConfig {
  const factory _FormConfig({
    required final int orgId,
    required final String configVersion,
    required final String configHash,
    required final CommonFormConfig commonForm,
    required final VegetationFormConfig vegetationForm,
    required final HydrologyFormConfig hydrologyForm,
    required final ElevationFormConfig elevationForm,
    required final DateTime downloadedAt,
    final DateTime? lastValidatedAt,
  }) = _$FormConfigImpl;

  factory _FormConfig.fromJson(Map<String, dynamic> json) =
      _$FormConfigImpl.fromJson;

  @override
  int get orgId;
  @override
  String get configVersion;
  @override
  String get configHash;
  @override
  CommonFormConfig get commonForm;
  @override
  VegetationFormConfig get vegetationForm;
  @override
  HydrologyFormConfig get hydrologyForm;
  @override
  ElevationFormConfig get elevationForm;
  @override
  DateTime get downloadedAt;
  @override
  DateTime? get lastValidatedAt;

  /// Create a copy of FormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormConfigImplCopyWith<_$FormConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommonFormConfig _$CommonFormConfigFromJson(Map<String, dynamic> json) {
  return _CommonFormConfig.fromJson(json);
}

/// @nodoc
mixin _$CommonFormConfig {
  String get version => throw _privateConstructorUsedError;
  List<FormFieldDef> get fields => throw _privateConstructorUsedError;

  /// Serializes this CommonFormConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonFormConfigCopyWith<CommonFormConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonFormConfigCopyWith<$Res> {
  factory $CommonFormConfigCopyWith(
    CommonFormConfig value,
    $Res Function(CommonFormConfig) then,
  ) = _$CommonFormConfigCopyWithImpl<$Res, CommonFormConfig>;
  @useResult
  $Res call({String version, List<FormFieldDef> fields});
}

/// @nodoc
class _$CommonFormConfigCopyWithImpl<$Res, $Val extends CommonFormConfig>
    implements $CommonFormConfigCopyWith<$Res> {
  _$CommonFormConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? fields = null}) {
    return _then(
      _value.copyWith(
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            fields: null == fields
                ? _value.fields
                : fields // ignore: cast_nullable_to_non_nullable
                      as List<FormFieldDef>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommonFormConfigImplCopyWith<$Res>
    implements $CommonFormConfigCopyWith<$Res> {
  factory _$$CommonFormConfigImplCopyWith(
    _$CommonFormConfigImpl value,
    $Res Function(_$CommonFormConfigImpl) then,
  ) = __$$CommonFormConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, List<FormFieldDef> fields});
}

/// @nodoc
class __$$CommonFormConfigImplCopyWithImpl<$Res>
    extends _$CommonFormConfigCopyWithImpl<$Res, _$CommonFormConfigImpl>
    implements _$$CommonFormConfigImplCopyWith<$Res> {
  __$$CommonFormConfigImplCopyWithImpl(
    _$CommonFormConfigImpl _value,
    $Res Function(_$CommonFormConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommonFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? fields = null}) {
    return _then(
      _$CommonFormConfigImpl(
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        fields: null == fields
            ? _value._fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as List<FormFieldDef>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonFormConfigImpl implements _CommonFormConfig {
  const _$CommonFormConfigImpl({
    required this.version,
    required final List<FormFieldDef> fields,
  }) : _fields = fields;

  factory _$CommonFormConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonFormConfigImplFromJson(json);

  @override
  final String version;
  final List<FormFieldDef> _fields;
  @override
  List<FormFieldDef> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'CommonFormConfig(version: $version, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonFormConfigImpl &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    version,
    const DeepCollectionEquality().hash(_fields),
  );

  /// Create a copy of CommonFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonFormConfigImplCopyWith<_$CommonFormConfigImpl> get copyWith =>
      __$$CommonFormConfigImplCopyWithImpl<_$CommonFormConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonFormConfigImplToJson(this);
  }
}

abstract class _CommonFormConfig implements CommonFormConfig {
  const factory _CommonFormConfig({
    required final String version,
    required final List<FormFieldDef> fields,
  }) = _$CommonFormConfigImpl;

  factory _CommonFormConfig.fromJson(Map<String, dynamic> json) =
      _$CommonFormConfigImpl.fromJson;

  @override
  String get version;
  @override
  List<FormFieldDef> get fields;

  /// Create a copy of CommonFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonFormConfigImplCopyWith<_$CommonFormConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VegetationFormConfig _$VegetationFormConfigFromJson(Map<String, dynamic> json) {
  return _VegetationFormConfig.fromJson(json);
}

/// @nodoc
mixin _$VegetationFormConfig {
  String get version => throw _privateConstructorUsedError;
  RepeatingGroupDef get repeatingGroup => throw _privateConstructorUsedError;

  /// Serializes this VegetationFormConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VegetationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VegetationFormConfigCopyWith<VegetationFormConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VegetationFormConfigCopyWith<$Res> {
  factory $VegetationFormConfigCopyWith(
    VegetationFormConfig value,
    $Res Function(VegetationFormConfig) then,
  ) = _$VegetationFormConfigCopyWithImpl<$Res, VegetationFormConfig>;
  @useResult
  $Res call({String version, RepeatingGroupDef repeatingGroup});

  $RepeatingGroupDefCopyWith<$Res> get repeatingGroup;
}

/// @nodoc
class _$VegetationFormConfigCopyWithImpl<
  $Res,
  $Val extends VegetationFormConfig
>
    implements $VegetationFormConfigCopyWith<$Res> {
  _$VegetationFormConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VegetationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? repeatingGroup = null}) {
    return _then(
      _value.copyWith(
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            repeatingGroup: null == repeatingGroup
                ? _value.repeatingGroup
                : repeatingGroup // ignore: cast_nullable_to_non_nullable
                      as RepeatingGroupDef,
          )
          as $Val,
    );
  }

  /// Create a copy of VegetationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeatingGroupDefCopyWith<$Res> get repeatingGroup {
    return $RepeatingGroupDefCopyWith<$Res>(_value.repeatingGroup, (value) {
      return _then(_value.copyWith(repeatingGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VegetationFormConfigImplCopyWith<$Res>
    implements $VegetationFormConfigCopyWith<$Res> {
  factory _$$VegetationFormConfigImplCopyWith(
    _$VegetationFormConfigImpl value,
    $Res Function(_$VegetationFormConfigImpl) then,
  ) = __$$VegetationFormConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, RepeatingGroupDef repeatingGroup});

  @override
  $RepeatingGroupDefCopyWith<$Res> get repeatingGroup;
}

/// @nodoc
class __$$VegetationFormConfigImplCopyWithImpl<$Res>
    extends _$VegetationFormConfigCopyWithImpl<$Res, _$VegetationFormConfigImpl>
    implements _$$VegetationFormConfigImplCopyWith<$Res> {
  __$$VegetationFormConfigImplCopyWithImpl(
    _$VegetationFormConfigImpl _value,
    $Res Function(_$VegetationFormConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VegetationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? repeatingGroup = null}) {
    return _then(
      _$VegetationFormConfigImpl(
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        repeatingGroup: null == repeatingGroup
            ? _value.repeatingGroup
            : repeatingGroup // ignore: cast_nullable_to_non_nullable
                  as RepeatingGroupDef,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VegetationFormConfigImpl implements _VegetationFormConfig {
  const _$VegetationFormConfigImpl({
    required this.version,
    required this.repeatingGroup,
  });

  factory _$VegetationFormConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$VegetationFormConfigImplFromJson(json);

  @override
  final String version;
  @override
  final RepeatingGroupDef repeatingGroup;

  @override
  String toString() {
    return 'VegetationFormConfig(version: $version, repeatingGroup: $repeatingGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VegetationFormConfigImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.repeatingGroup, repeatingGroup) ||
                other.repeatingGroup == repeatingGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version, repeatingGroup);

  /// Create a copy of VegetationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VegetationFormConfigImplCopyWith<_$VegetationFormConfigImpl>
  get copyWith =>
      __$$VegetationFormConfigImplCopyWithImpl<_$VegetationFormConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VegetationFormConfigImplToJson(this);
  }
}

abstract class _VegetationFormConfig implements VegetationFormConfig {
  const factory _VegetationFormConfig({
    required final String version,
    required final RepeatingGroupDef repeatingGroup,
  }) = _$VegetationFormConfigImpl;

  factory _VegetationFormConfig.fromJson(Map<String, dynamic> json) =
      _$VegetationFormConfigImpl.fromJson;

  @override
  String get version;
  @override
  RepeatingGroupDef get repeatingGroup;

  /// Create a copy of VegetationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VegetationFormConfigImplCopyWith<_$VegetationFormConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

HydrologyFormConfig _$HydrologyFormConfigFromJson(Map<String, dynamic> json) {
  return _HydrologyFormConfig.fromJson(json);
}

/// @nodoc
mixin _$HydrologyFormConfig {
  String get version => throw _privateConstructorUsedError;
  List<FormFieldDef> get fields => throw _privateConstructorUsedError;

  /// Serializes this HydrologyFormConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HydrologyFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HydrologyFormConfigCopyWith<HydrologyFormConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HydrologyFormConfigCopyWith<$Res> {
  factory $HydrologyFormConfigCopyWith(
    HydrologyFormConfig value,
    $Res Function(HydrologyFormConfig) then,
  ) = _$HydrologyFormConfigCopyWithImpl<$Res, HydrologyFormConfig>;
  @useResult
  $Res call({String version, List<FormFieldDef> fields});
}

/// @nodoc
class _$HydrologyFormConfigCopyWithImpl<$Res, $Val extends HydrologyFormConfig>
    implements $HydrologyFormConfigCopyWith<$Res> {
  _$HydrologyFormConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HydrologyFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? fields = null}) {
    return _then(
      _value.copyWith(
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            fields: null == fields
                ? _value.fields
                : fields // ignore: cast_nullable_to_non_nullable
                      as List<FormFieldDef>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HydrologyFormConfigImplCopyWith<$Res>
    implements $HydrologyFormConfigCopyWith<$Res> {
  factory _$$HydrologyFormConfigImplCopyWith(
    _$HydrologyFormConfigImpl value,
    $Res Function(_$HydrologyFormConfigImpl) then,
  ) = __$$HydrologyFormConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, List<FormFieldDef> fields});
}

/// @nodoc
class __$$HydrologyFormConfigImplCopyWithImpl<$Res>
    extends _$HydrologyFormConfigCopyWithImpl<$Res, _$HydrologyFormConfigImpl>
    implements _$$HydrologyFormConfigImplCopyWith<$Res> {
  __$$HydrologyFormConfigImplCopyWithImpl(
    _$HydrologyFormConfigImpl _value,
    $Res Function(_$HydrologyFormConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HydrologyFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? fields = null}) {
    return _then(
      _$HydrologyFormConfigImpl(
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        fields: null == fields
            ? _value._fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as List<FormFieldDef>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HydrologyFormConfigImpl implements _HydrologyFormConfig {
  const _$HydrologyFormConfigImpl({
    required this.version,
    required final List<FormFieldDef> fields,
  }) : _fields = fields;

  factory _$HydrologyFormConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$HydrologyFormConfigImplFromJson(json);

  @override
  final String version;
  final List<FormFieldDef> _fields;
  @override
  List<FormFieldDef> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'HydrologyFormConfig(version: $version, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HydrologyFormConfigImpl &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    version,
    const DeepCollectionEquality().hash(_fields),
  );

  /// Create a copy of HydrologyFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HydrologyFormConfigImplCopyWith<_$HydrologyFormConfigImpl> get copyWith =>
      __$$HydrologyFormConfigImplCopyWithImpl<_$HydrologyFormConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HydrologyFormConfigImplToJson(this);
  }
}

abstract class _HydrologyFormConfig implements HydrologyFormConfig {
  const factory _HydrologyFormConfig({
    required final String version,
    required final List<FormFieldDef> fields,
  }) = _$HydrologyFormConfigImpl;

  factory _HydrologyFormConfig.fromJson(Map<String, dynamic> json) =
      _$HydrologyFormConfigImpl.fromJson;

  @override
  String get version;
  @override
  List<FormFieldDef> get fields;

  /// Create a copy of HydrologyFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HydrologyFormConfigImplCopyWith<_$HydrologyFormConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ElevationFormConfig _$ElevationFormConfigFromJson(Map<String, dynamic> json) {
  return _ElevationFormConfig.fromJson(json);
}

/// @nodoc
mixin _$ElevationFormConfig {
  String get version => throw _privateConstructorUsedError;
  RepeatingGroupDef get repeatingGroup => throw _privateConstructorUsedError;

  /// Serializes this ElevationFormConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ElevationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElevationFormConfigCopyWith<ElevationFormConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElevationFormConfigCopyWith<$Res> {
  factory $ElevationFormConfigCopyWith(
    ElevationFormConfig value,
    $Res Function(ElevationFormConfig) then,
  ) = _$ElevationFormConfigCopyWithImpl<$Res, ElevationFormConfig>;
  @useResult
  $Res call({String version, RepeatingGroupDef repeatingGroup});

  $RepeatingGroupDefCopyWith<$Res> get repeatingGroup;
}

/// @nodoc
class _$ElevationFormConfigCopyWithImpl<$Res, $Val extends ElevationFormConfig>
    implements $ElevationFormConfigCopyWith<$Res> {
  _$ElevationFormConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ElevationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? repeatingGroup = null}) {
    return _then(
      _value.copyWith(
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            repeatingGroup: null == repeatingGroup
                ? _value.repeatingGroup
                : repeatingGroup // ignore: cast_nullable_to_non_nullable
                      as RepeatingGroupDef,
          )
          as $Val,
    );
  }

  /// Create a copy of ElevationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepeatingGroupDefCopyWith<$Res> get repeatingGroup {
    return $RepeatingGroupDefCopyWith<$Res>(_value.repeatingGroup, (value) {
      return _then(_value.copyWith(repeatingGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ElevationFormConfigImplCopyWith<$Res>
    implements $ElevationFormConfigCopyWith<$Res> {
  factory _$$ElevationFormConfigImplCopyWith(
    _$ElevationFormConfigImpl value,
    $Res Function(_$ElevationFormConfigImpl) then,
  ) = __$$ElevationFormConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, RepeatingGroupDef repeatingGroup});

  @override
  $RepeatingGroupDefCopyWith<$Res> get repeatingGroup;
}

/// @nodoc
class __$$ElevationFormConfigImplCopyWithImpl<$Res>
    extends _$ElevationFormConfigCopyWithImpl<$Res, _$ElevationFormConfigImpl>
    implements _$$ElevationFormConfigImplCopyWith<$Res> {
  __$$ElevationFormConfigImplCopyWithImpl(
    _$ElevationFormConfigImpl _value,
    $Res Function(_$ElevationFormConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ElevationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? repeatingGroup = null}) {
    return _then(
      _$ElevationFormConfigImpl(
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        repeatingGroup: null == repeatingGroup
            ? _value.repeatingGroup
            : repeatingGroup // ignore: cast_nullable_to_non_nullable
                  as RepeatingGroupDef,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ElevationFormConfigImpl implements _ElevationFormConfig {
  const _$ElevationFormConfigImpl({
    required this.version,
    required this.repeatingGroup,
  });

  factory _$ElevationFormConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElevationFormConfigImplFromJson(json);

  @override
  final String version;
  @override
  final RepeatingGroupDef repeatingGroup;

  @override
  String toString() {
    return 'ElevationFormConfig(version: $version, repeatingGroup: $repeatingGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElevationFormConfigImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.repeatingGroup, repeatingGroup) ||
                other.repeatingGroup == repeatingGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, version, repeatingGroup);

  /// Create a copy of ElevationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElevationFormConfigImplCopyWith<_$ElevationFormConfigImpl> get copyWith =>
      __$$ElevationFormConfigImplCopyWithImpl<_$ElevationFormConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ElevationFormConfigImplToJson(this);
  }
}

abstract class _ElevationFormConfig implements ElevationFormConfig {
  const factory _ElevationFormConfig({
    required final String version,
    required final RepeatingGroupDef repeatingGroup,
  }) = _$ElevationFormConfigImpl;

  factory _ElevationFormConfig.fromJson(Map<String, dynamic> json) =
      _$ElevationFormConfigImpl.fromJson;

  @override
  String get version;
  @override
  RepeatingGroupDef get repeatingGroup;

  /// Create a copy of ElevationFormConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElevationFormConfigImplCopyWith<_$ElevationFormConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepeatingGroupDef _$RepeatingGroupDefFromJson(Map<String, dynamic> json) {
  return _RepeatingGroupDef.fromJson(json);
}

/// @nodoc
mixin _$RepeatingGroupDef {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<FormFieldDef> get fields => throw _privateConstructorUsedError;
  int? get minItems => throw _privateConstructorUsedError;
  int? get maxItems => throw _privateConstructorUsedError;

  /// Serializes this RepeatingGroupDef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepeatingGroupDef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepeatingGroupDefCopyWith<RepeatingGroupDef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepeatingGroupDefCopyWith<$Res> {
  factory $RepeatingGroupDefCopyWith(
    RepeatingGroupDef value,
    $Res Function(RepeatingGroupDef) then,
  ) = _$RepeatingGroupDefCopyWithImpl<$Res, RepeatingGroupDef>;
  @useResult
  $Res call({
    String id,
    String name,
    List<FormFieldDef> fields,
    int? minItems,
    int? maxItems,
  });
}

/// @nodoc
class _$RepeatingGroupDefCopyWithImpl<$Res, $Val extends RepeatingGroupDef>
    implements $RepeatingGroupDefCopyWith<$Res> {
  _$RepeatingGroupDefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepeatingGroupDef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fields = null,
    Object? minItems = freezed,
    Object? maxItems = freezed,
  }) {
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
            fields: null == fields
                ? _value.fields
                : fields // ignore: cast_nullable_to_non_nullable
                      as List<FormFieldDef>,
            minItems: freezed == minItems
                ? _value.minItems
                : minItems // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxItems: freezed == maxItems
                ? _value.maxItems
                : maxItems // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RepeatingGroupDefImplCopyWith<$Res>
    implements $RepeatingGroupDefCopyWith<$Res> {
  factory _$$RepeatingGroupDefImplCopyWith(
    _$RepeatingGroupDefImpl value,
    $Res Function(_$RepeatingGroupDefImpl) then,
  ) = __$$RepeatingGroupDefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    List<FormFieldDef> fields,
    int? minItems,
    int? maxItems,
  });
}

/// @nodoc
class __$$RepeatingGroupDefImplCopyWithImpl<$Res>
    extends _$RepeatingGroupDefCopyWithImpl<$Res, _$RepeatingGroupDefImpl>
    implements _$$RepeatingGroupDefImplCopyWith<$Res> {
  __$$RepeatingGroupDefImplCopyWithImpl(
    _$RepeatingGroupDefImpl _value,
    $Res Function(_$RepeatingGroupDefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RepeatingGroupDef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fields = null,
    Object? minItems = freezed,
    Object? maxItems = freezed,
  }) {
    return _then(
      _$RepeatingGroupDefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        fields: null == fields
            ? _value._fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as List<FormFieldDef>,
        minItems: freezed == minItems
            ? _value.minItems
            : minItems // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxItems: freezed == maxItems
            ? _value.maxItems
            : maxItems // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RepeatingGroupDefImpl implements _RepeatingGroupDef {
  const _$RepeatingGroupDefImpl({
    required this.id,
    required this.name,
    required final List<FormFieldDef> fields,
    this.minItems,
    this.maxItems,
  }) : _fields = fields;

  factory _$RepeatingGroupDefImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepeatingGroupDefImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<FormFieldDef> _fields;
  @override
  List<FormFieldDef> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  final int? minItems;
  @override
  final int? maxItems;

  @override
  String toString() {
    return 'RepeatingGroupDef(id: $id, name: $name, fields: $fields, minItems: $minItems, maxItems: $maxItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepeatingGroupDefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.minItems, minItems) ||
                other.minItems == minItems) &&
            (identical(other.maxItems, maxItems) ||
                other.maxItems == maxItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_fields),
    minItems,
    maxItems,
  );

  /// Create a copy of RepeatingGroupDef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepeatingGroupDefImplCopyWith<_$RepeatingGroupDefImpl> get copyWith =>
      __$$RepeatingGroupDefImplCopyWithImpl<_$RepeatingGroupDefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RepeatingGroupDefImplToJson(this);
  }
}

abstract class _RepeatingGroupDef implements RepeatingGroupDef {
  const factory _RepeatingGroupDef({
    required final String id,
    required final String name,
    required final List<FormFieldDef> fields,
    final int? minItems,
    final int? maxItems,
  }) = _$RepeatingGroupDefImpl;

  factory _RepeatingGroupDef.fromJson(Map<String, dynamic> json) =
      _$RepeatingGroupDefImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<FormFieldDef> get fields;
  @override
  int? get minItems;
  @override
  int? get maxItems;

  /// Create a copy of RepeatingGroupDef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepeatingGroupDefImplCopyWith<_$RepeatingGroupDefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormFieldDef _$FormFieldDefFromJson(Map<String, dynamic> json) {
  return _FormFieldDef.fromJson(json);
}

/// @nodoc
mixin _$FormFieldDef {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  ValidationRules? get validation => throw _privateConstructorUsedError;
  List<DropdownOption>? get options => throw _privateConstructorUsedError;
  String? get dataSource => throw _privateConstructorUsedError;
  List<FormFieldDef>? get nestedFields => throw _privateConstructorUsedError;
  int? get minItems => throw _privateConstructorUsedError;
  int? get maxItems => throw _privateConstructorUsedError;
  String? get section => throw _privateConstructorUsedError;
  String? get helpText => throw _privateConstructorUsedError;

  /// Serializes this FormFieldDef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormFieldDef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormFieldDefCopyWith<FormFieldDef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldDefCopyWith<$Res> {
  factory $FormFieldDefCopyWith(
    FormFieldDef value,
    $Res Function(FormFieldDef) then,
  ) = _$FormFieldDefCopyWithImpl<$Res, FormFieldDef>;
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    bool required,
    ValidationRules? validation,
    List<DropdownOption>? options,
    String? dataSource,
    List<FormFieldDef>? nestedFields,
    int? minItems,
    int? maxItems,
    String? section,
    String? helpText,
  });

  $ValidationRulesCopyWith<$Res>? get validation;
}

/// @nodoc
class _$FormFieldDefCopyWithImpl<$Res, $Val extends FormFieldDef>
    implements $FormFieldDefCopyWith<$Res> {
  _$FormFieldDefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormFieldDef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? required = null,
    Object? validation = freezed,
    Object? options = freezed,
    Object? dataSource = freezed,
    Object? nestedFields = freezed,
    Object? minItems = freezed,
    Object? maxItems = freezed,
    Object? section = freezed,
    Object? helpText = freezed,
  }) {
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            required: null == required
                ? _value.required
                : required // ignore: cast_nullable_to_non_nullable
                      as bool,
            validation: freezed == validation
                ? _value.validation
                : validation // ignore: cast_nullable_to_non_nullable
                      as ValidationRules?,
            options: freezed == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<DropdownOption>?,
            dataSource: freezed == dataSource
                ? _value.dataSource
                : dataSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            nestedFields: freezed == nestedFields
                ? _value.nestedFields
                : nestedFields // ignore: cast_nullable_to_non_nullable
                      as List<FormFieldDef>?,
            minItems: freezed == minItems
                ? _value.minItems
                : minItems // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxItems: freezed == maxItems
                ? _value.maxItems
                : maxItems // ignore: cast_nullable_to_non_nullable
                      as int?,
            section: freezed == section
                ? _value.section
                : section // ignore: cast_nullable_to_non_nullable
                      as String?,
            helpText: freezed == helpText
                ? _value.helpText
                : helpText // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of FormFieldDef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationRulesCopyWith<$Res>? get validation {
    if (_value.validation == null) {
      return null;
    }

    return $ValidationRulesCopyWith<$Res>(_value.validation!, (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormFieldDefImplCopyWith<$Res>
    implements $FormFieldDefCopyWith<$Res> {
  factory _$$FormFieldDefImplCopyWith(
    _$FormFieldDefImpl value,
    $Res Function(_$FormFieldDefImpl) then,
  ) = __$$FormFieldDefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    bool required,
    ValidationRules? validation,
    List<DropdownOption>? options,
    String? dataSource,
    List<FormFieldDef>? nestedFields,
    int? minItems,
    int? maxItems,
    String? section,
    String? helpText,
  });

  @override
  $ValidationRulesCopyWith<$Res>? get validation;
}

/// @nodoc
class __$$FormFieldDefImplCopyWithImpl<$Res>
    extends _$FormFieldDefCopyWithImpl<$Res, _$FormFieldDefImpl>
    implements _$$FormFieldDefImplCopyWith<$Res> {
  __$$FormFieldDefImplCopyWithImpl(
    _$FormFieldDefImpl _value,
    $Res Function(_$FormFieldDefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormFieldDef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? required = null,
    Object? validation = freezed,
    Object? options = freezed,
    Object? dataSource = freezed,
    Object? nestedFields = freezed,
    Object? minItems = freezed,
    Object? maxItems = freezed,
    Object? section = freezed,
    Object? helpText = freezed,
  }) {
    return _then(
      _$FormFieldDefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        required: null == required
            ? _value.required
            : required // ignore: cast_nullable_to_non_nullable
                  as bool,
        validation: freezed == validation
            ? _value.validation
            : validation // ignore: cast_nullable_to_non_nullable
                  as ValidationRules?,
        options: freezed == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<DropdownOption>?,
        dataSource: freezed == dataSource
            ? _value.dataSource
            : dataSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        nestedFields: freezed == nestedFields
            ? _value._nestedFields
            : nestedFields // ignore: cast_nullable_to_non_nullable
                  as List<FormFieldDef>?,
        minItems: freezed == minItems
            ? _value.minItems
            : minItems // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxItems: freezed == maxItems
            ? _value.maxItems
            : maxItems // ignore: cast_nullable_to_non_nullable
                  as int?,
        section: freezed == section
            ? _value.section
            : section // ignore: cast_nullable_to_non_nullable
                  as String?,
        helpText: freezed == helpText
            ? _value.helpText
            : helpText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormFieldDefImpl implements _FormFieldDef {
  const _$FormFieldDefImpl({
    required this.id,
    required this.name,
    required this.type,
    this.required = false,
    this.validation,
    final List<DropdownOption>? options,
    this.dataSource,
    final List<FormFieldDef>? nestedFields,
    this.minItems,
    this.maxItems,
    this.section,
    this.helpText,
  }) : _options = options,
       _nestedFields = nestedFields;

  factory _$FormFieldDefImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormFieldDefImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  @JsonKey()
  final bool required;
  @override
  final ValidationRules? validation;
  final List<DropdownOption>? _options;
  @override
  List<DropdownOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? dataSource;
  final List<FormFieldDef>? _nestedFields;
  @override
  List<FormFieldDef>? get nestedFields {
    final value = _nestedFields;
    if (value == null) return null;
    if (_nestedFields is EqualUnmodifiableListView) return _nestedFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? minItems;
  @override
  final int? maxItems;
  @override
  final String? section;
  @override
  final String? helpText;

  @override
  String toString() {
    return 'FormFieldDef(id: $id, name: $name, type: $type, required: $required, validation: $validation, options: $options, dataSource: $dataSource, nestedFields: $nestedFields, minItems: $minItems, maxItems: $maxItems, section: $section, helpText: $helpText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormFieldDefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            const DeepCollectionEquality().equals(
              other._nestedFields,
              _nestedFields,
            ) &&
            (identical(other.minItems, minItems) ||
                other.minItems == minItems) &&
            (identical(other.maxItems, maxItems) ||
                other.maxItems == maxItems) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.helpText, helpText) ||
                other.helpText == helpText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    required,
    validation,
    const DeepCollectionEquality().hash(_options),
    dataSource,
    const DeepCollectionEquality().hash(_nestedFields),
    minItems,
    maxItems,
    section,
    helpText,
  );

  /// Create a copy of FormFieldDef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormFieldDefImplCopyWith<_$FormFieldDefImpl> get copyWith =>
      __$$FormFieldDefImplCopyWithImpl<_$FormFieldDefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormFieldDefImplToJson(this);
  }
}

abstract class _FormFieldDef implements FormFieldDef {
  const factory _FormFieldDef({
    required final String id,
    required final String name,
    required final String type,
    final bool required,
    final ValidationRules? validation,
    final List<DropdownOption>? options,
    final String? dataSource,
    final List<FormFieldDef>? nestedFields,
    final int? minItems,
    final int? maxItems,
    final String? section,
    final String? helpText,
  }) = _$FormFieldDefImpl;

  factory _FormFieldDef.fromJson(Map<String, dynamic> json) =
      _$FormFieldDefImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  bool get required;
  @override
  ValidationRules? get validation;
  @override
  List<DropdownOption>? get options;
  @override
  String? get dataSource;
  @override
  List<FormFieldDef>? get nestedFields;
  @override
  int? get minItems;
  @override
  int? get maxItems;
  @override
  String? get section;
  @override
  String? get helpText;

  /// Create a copy of FormFieldDef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormFieldDefImplCopyWith<_$FormFieldDefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationRules _$ValidationRulesFromJson(Map<String, dynamic> json) {
  return _ValidationRules.fromJson(json);
}

/// @nodoc
mixin _$ValidationRules {
  int? get minLength => throw _privateConstructorUsedError;
  int? get maxLength => throw _privateConstructorUsedError;
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  String? get pattern => throw _privateConstructorUsedError;
  int? get maxSizeKb => throw _privateConstructorUsedError;
  List<String>? get formats => throw _privateConstructorUsedError;

  /// Serializes this ValidationRules to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationRulesCopyWith<ValidationRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationRulesCopyWith<$Res> {
  factory $ValidationRulesCopyWith(
    ValidationRules value,
    $Res Function(ValidationRules) then,
  ) = _$ValidationRulesCopyWithImpl<$Res, ValidationRules>;
  @useResult
  $Res call({
    int? minLength,
    int? maxLength,
    double? min,
    double? max,
    String? pattern,
    int? maxSizeKb,
    List<String>? formats,
  });
}

/// @nodoc
class _$ValidationRulesCopyWithImpl<$Res, $Val extends ValidationRules>
    implements $ValidationRulesCopyWith<$Res> {
  _$ValidationRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? pattern = freezed,
    Object? maxSizeKb = freezed,
    Object? formats = freezed,
  }) {
    return _then(
      _value.copyWith(
            minLength: freezed == minLength
                ? _value.minLength
                : minLength // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxLength: freezed == maxLength
                ? _value.maxLength
                : maxLength // ignore: cast_nullable_to_non_nullable
                      as int?,
            min: freezed == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as double?,
            max: freezed == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as double?,
            pattern: freezed == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as String?,
            maxSizeKb: freezed == maxSizeKb
                ? _value.maxSizeKb
                : maxSizeKb // ignore: cast_nullable_to_non_nullable
                      as int?,
            formats: freezed == formats
                ? _value.formats
                : formats // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ValidationRulesImplCopyWith<$Res>
    implements $ValidationRulesCopyWith<$Res> {
  factory _$$ValidationRulesImplCopyWith(
    _$ValidationRulesImpl value,
    $Res Function(_$ValidationRulesImpl) then,
  ) = __$$ValidationRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? minLength,
    int? maxLength,
    double? min,
    double? max,
    String? pattern,
    int? maxSizeKb,
    List<String>? formats,
  });
}

/// @nodoc
class __$$ValidationRulesImplCopyWithImpl<$Res>
    extends _$ValidationRulesCopyWithImpl<$Res, _$ValidationRulesImpl>
    implements _$$ValidationRulesImplCopyWith<$Res> {
  __$$ValidationRulesImplCopyWithImpl(
    _$ValidationRulesImpl _value,
    $Res Function(_$ValidationRulesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? pattern = freezed,
    Object? maxSizeKb = freezed,
    Object? formats = freezed,
  }) {
    return _then(
      _$ValidationRulesImpl(
        minLength: freezed == minLength
            ? _value.minLength
            : minLength // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxLength: freezed == maxLength
            ? _value.maxLength
            : maxLength // ignore: cast_nullable_to_non_nullable
                  as int?,
        min: freezed == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as double?,
        max: freezed == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as double?,
        pattern: freezed == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as String?,
        maxSizeKb: freezed == maxSizeKb
            ? _value.maxSizeKb
            : maxSizeKb // ignore: cast_nullable_to_non_nullable
                  as int?,
        formats: freezed == formats
            ? _value._formats
            : formats // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationRulesImpl implements _ValidationRules {
  const _$ValidationRulesImpl({
    this.minLength,
    this.maxLength,
    this.min,
    this.max,
    this.pattern,
    this.maxSizeKb,
    final List<String>? formats,
  }) : _formats = formats;

  factory _$ValidationRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationRulesImplFromJson(json);

  @override
  final int? minLength;
  @override
  final int? maxLength;
  @override
  final double? min;
  @override
  final double? max;
  @override
  final String? pattern;
  @override
  final int? maxSizeKb;
  final List<String>? _formats;
  @override
  List<String>? get formats {
    final value = _formats;
    if (value == null) return null;
    if (_formats is EqualUnmodifiableListView) return _formats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ValidationRules(minLength: $minLength, maxLength: $maxLength, min: $min, max: $max, pattern: $pattern, maxSizeKb: $maxSizeKb, formats: $formats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationRulesImpl &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.maxSizeKb, maxSizeKb) ||
                other.maxSizeKb == maxSizeKb) &&
            const DeepCollectionEquality().equals(other._formats, _formats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    minLength,
    maxLength,
    min,
    max,
    pattern,
    maxSizeKb,
    const DeepCollectionEquality().hash(_formats),
  );

  /// Create a copy of ValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationRulesImplCopyWith<_$ValidationRulesImpl> get copyWith =>
      __$$ValidationRulesImplCopyWithImpl<_$ValidationRulesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationRulesImplToJson(this);
  }
}

abstract class _ValidationRules implements ValidationRules {
  const factory _ValidationRules({
    final int? minLength,
    final int? maxLength,
    final double? min,
    final double? max,
    final String? pattern,
    final int? maxSizeKb,
    final List<String>? formats,
  }) = _$ValidationRulesImpl;

  factory _ValidationRules.fromJson(Map<String, dynamic> json) =
      _$ValidationRulesImpl.fromJson;

  @override
  int? get minLength;
  @override
  int? get maxLength;
  @override
  double? get min;
  @override
  double? get max;
  @override
  String? get pattern;
  @override
  int? get maxSizeKb;
  @override
  List<String>? get formats;

  /// Create a copy of ValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationRulesImplCopyWith<_$ValidationRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DropdownOption _$DropdownOptionFromJson(Map<String, dynamic> json) {
  return _DropdownOption.fromJson(json);
}

/// @nodoc
mixin _$DropdownOption {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this DropdownOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DropdownOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DropdownOptionCopyWith<DropdownOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropdownOptionCopyWith<$Res> {
  factory $DropdownOptionCopyWith(
    DropdownOption value,
    $Res Function(DropdownOption) then,
  ) = _$DropdownOptionCopyWithImpl<$Res, DropdownOption>;
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class _$DropdownOptionCopyWithImpl<$Res, $Val extends DropdownOption>
    implements $DropdownOptionCopyWith<$Res> {
  _$DropdownOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DropdownOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? label = null}) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DropdownOptionImplCopyWith<$Res>
    implements $DropdownOptionCopyWith<$Res> {
  factory _$$DropdownOptionImplCopyWith(
    _$DropdownOptionImpl value,
    $Res Function(_$DropdownOptionImpl) then,
  ) = __$$DropdownOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label});
}

/// @nodoc
class __$$DropdownOptionImplCopyWithImpl<$Res>
    extends _$DropdownOptionCopyWithImpl<$Res, _$DropdownOptionImpl>
    implements _$$DropdownOptionImplCopyWith<$Res> {
  __$$DropdownOptionImplCopyWithImpl(
    _$DropdownOptionImpl _value,
    $Res Function(_$DropdownOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DropdownOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null, Object? label = null}) {
    return _then(
      _$DropdownOptionImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DropdownOptionImpl implements _DropdownOption {
  const _$DropdownOptionImpl({required this.value, required this.label});

  factory _$DropdownOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DropdownOptionImplFromJson(json);

  @override
  final String value;
  @override
  final String label;

  @override
  String toString() {
    return 'DropdownOption(value: $value, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropdownOptionImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, label);

  /// Create a copy of DropdownOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DropdownOptionImplCopyWith<_$DropdownOptionImpl> get copyWith =>
      __$$DropdownOptionImplCopyWithImpl<_$DropdownOptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DropdownOptionImplToJson(this);
  }
}

abstract class _DropdownOption implements DropdownOption {
  const factory _DropdownOption({
    required final String value,
    required final String label,
  }) = _$DropdownOptionImpl;

  factory _DropdownOption.fromJson(Map<String, dynamic> json) =
      _$DropdownOptionImpl.fromJson;

  @override
  String get value;
  @override
  String get label;

  /// Create a copy of DropdownOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DropdownOptionImplCopyWith<_$DropdownOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
