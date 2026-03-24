// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_form_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrgFormTemplate _$OrgFormTemplateFromJson(Map<String, dynamic> json) {
  return _OrgFormTemplate.fromJson(json);
}

/// @nodoc
mixin _$OrgFormTemplate {
  int? get id => throw _privateConstructorUsedError;
  int get orgId => throw _privateConstructorUsedError;
  int get templateId => throw _privateConstructorUsedError;

  /// Organization-specific customizations (field visibility, label overrides, etc.)
  Map<String, dynamic>? get customizations =>
      throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  DateTime? get enabledAt => throw _privateConstructorUsedError;

  /// The base template (joined data, not stored in this table)
  FormTemplate? get template => throw _privateConstructorUsedError;

  /// Serializes this OrgFormTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrgFormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrgFormTemplateCopyWith<OrgFormTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgFormTemplateCopyWith<$Res> {
  factory $OrgFormTemplateCopyWith(
    OrgFormTemplate value,
    $Res Function(OrgFormTemplate) then,
  ) = _$OrgFormTemplateCopyWithImpl<$Res, OrgFormTemplate>;
  @useResult
  $Res call({
    int? id,
    int orgId,
    int templateId,
    Map<String, dynamic>? customizations,
    bool isEnabled,
    DateTime? enabledAt,
    FormTemplate? template,
  });

  $FormTemplateCopyWith<$Res>? get template;
}

/// @nodoc
class _$OrgFormTemplateCopyWithImpl<$Res, $Val extends OrgFormTemplate>
    implements $OrgFormTemplateCopyWith<$Res> {
  _$OrgFormTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrgFormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? templateId = null,
    Object? customizations = freezed,
    Object? isEnabled = null,
    Object? enabledAt = freezed,
    Object? template = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            orgId: null == orgId
                ? _value.orgId
                : orgId // ignore: cast_nullable_to_non_nullable
                      as int,
            templateId: null == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                      as int,
            customizations: freezed == customizations
                ? _value.customizations
                : customizations // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            isEnabled: null == isEnabled
                ? _value.isEnabled
                : isEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            enabledAt: freezed == enabledAt
                ? _value.enabledAt
                : enabledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            template: freezed == template
                ? _value.template
                : template // ignore: cast_nullable_to_non_nullable
                      as FormTemplate?,
          )
          as $Val,
    );
  }

  /// Create a copy of OrgFormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormTemplateCopyWith<$Res>? get template {
    if (_value.template == null) {
      return null;
    }

    return $FormTemplateCopyWith<$Res>(_value.template!, (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrgFormTemplateImplCopyWith<$Res>
    implements $OrgFormTemplateCopyWith<$Res> {
  factory _$$OrgFormTemplateImplCopyWith(
    _$OrgFormTemplateImpl value,
    $Res Function(_$OrgFormTemplateImpl) then,
  ) = __$$OrgFormTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int orgId,
    int templateId,
    Map<String, dynamic>? customizations,
    bool isEnabled,
    DateTime? enabledAt,
    FormTemplate? template,
  });

  @override
  $FormTemplateCopyWith<$Res>? get template;
}

/// @nodoc
class __$$OrgFormTemplateImplCopyWithImpl<$Res>
    extends _$OrgFormTemplateCopyWithImpl<$Res, _$OrgFormTemplateImpl>
    implements _$$OrgFormTemplateImplCopyWith<$Res> {
  __$$OrgFormTemplateImplCopyWithImpl(
    _$OrgFormTemplateImpl _value,
    $Res Function(_$OrgFormTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrgFormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? templateId = null,
    Object? customizations = freezed,
    Object? isEnabled = null,
    Object? enabledAt = freezed,
    Object? template = freezed,
  }) {
    return _then(
      _$OrgFormTemplateImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        orgId: null == orgId
            ? _value.orgId
            : orgId // ignore: cast_nullable_to_non_nullable
                  as int,
        templateId: null == templateId
            ? _value.templateId
            : templateId // ignore: cast_nullable_to_non_nullable
                  as int,
        customizations: freezed == customizations
            ? _value._customizations
            : customizations // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        isEnabled: null == isEnabled
            ? _value.isEnabled
            : isEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        enabledAt: freezed == enabledAt
            ? _value.enabledAt
            : enabledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        template: freezed == template
            ? _value.template
            : template // ignore: cast_nullable_to_non_nullable
                  as FormTemplate?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrgFormTemplateImpl extends _OrgFormTemplate {
  const _$OrgFormTemplateImpl({
    this.id,
    required this.orgId,
    required this.templateId,
    final Map<String, dynamic>? customizations,
    this.isEnabled = true,
    this.enabledAt,
    this.template,
  }) : _customizations = customizations,
       super._();

  factory _$OrgFormTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrgFormTemplateImplFromJson(json);

  @override
  final int? id;
  @override
  final int orgId;
  @override
  final int templateId;

  /// Organization-specific customizations (field visibility, label overrides, etc.)
  final Map<String, dynamic>? _customizations;

  /// Organization-specific customizations (field visibility, label overrides, etc.)
  @override
  Map<String, dynamic>? get customizations {
    final value = _customizations;
    if (value == null) return null;
    if (_customizations is EqualUnmodifiableMapView) return _customizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isEnabled;
  @override
  final DateTime? enabledAt;

  /// The base template (joined data, not stored in this table)
  @override
  final FormTemplate? template;

  @override
  String toString() {
    return 'OrgFormTemplate(id: $id, orgId: $orgId, templateId: $templateId, customizations: $customizations, isEnabled: $isEnabled, enabledAt: $enabledAt, template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrgFormTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            const DeepCollectionEquality().equals(
              other._customizations,
              _customizations,
            ) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.enabledAt, enabledAt) ||
                other.enabledAt == enabledAt) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orgId,
    templateId,
    const DeepCollectionEquality().hash(_customizations),
    isEnabled,
    enabledAt,
    template,
  );

  /// Create a copy of OrgFormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrgFormTemplateImplCopyWith<_$OrgFormTemplateImpl> get copyWith =>
      __$$OrgFormTemplateImplCopyWithImpl<_$OrgFormTemplateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrgFormTemplateImplToJson(this);
  }
}

abstract class _OrgFormTemplate extends OrgFormTemplate {
  const factory _OrgFormTemplate({
    final int? id,
    required final int orgId,
    required final int templateId,
    final Map<String, dynamic>? customizations,
    final bool isEnabled,
    final DateTime? enabledAt,
    final FormTemplate? template,
  }) = _$OrgFormTemplateImpl;
  const _OrgFormTemplate._() : super._();

  factory _OrgFormTemplate.fromJson(Map<String, dynamic> json) =
      _$OrgFormTemplateImpl.fromJson;

  @override
  int? get id;
  @override
  int get orgId;
  @override
  int get templateId;

  /// Organization-specific customizations (field visibility, label overrides, etc.)
  @override
  Map<String, dynamic>? get customizations;
  @override
  bool get isEnabled;
  @override
  DateTime? get enabledAt;

  /// The base template (joined data, not stored in this table)
  @override
  FormTemplate? get template;

  /// Create a copy of OrgFormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrgFormTemplateImplCopyWith<_$OrgFormTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateCustomization _$TemplateCustomizationFromJson(
  Map<String, dynamic> json,
) {
  return _TemplateCustomization.fromJson(json);
}

/// @nodoc
mixin _$TemplateCustomization {
  /// Fields to hide (list of field IDs)
  List<String> get hiddenFields => throw _privateConstructorUsedError;

  /// Label overrides (field ID -> new label)
  Map<String, String> get labelOverrides => throw _privateConstructorUsedError;

  /// Default value overrides (field ID -> default value)
  Map<String, String> get defaultOverrides =>
      throw _privateConstructorUsedError;

  /// Required field overrides (field ID -> required status)
  Map<String, bool> get requiredOverrides => throw _privateConstructorUsedError;

  /// Serializes this TemplateCustomization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateCustomizationCopyWith<TemplateCustomization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateCustomizationCopyWith<$Res> {
  factory $TemplateCustomizationCopyWith(
    TemplateCustomization value,
    $Res Function(TemplateCustomization) then,
  ) = _$TemplateCustomizationCopyWithImpl<$Res, TemplateCustomization>;
  @useResult
  $Res call({
    List<String> hiddenFields,
    Map<String, String> labelOverrides,
    Map<String, String> defaultOverrides,
    Map<String, bool> requiredOverrides,
  });
}

/// @nodoc
class _$TemplateCustomizationCopyWithImpl<
  $Res,
  $Val extends TemplateCustomization
>
    implements $TemplateCustomizationCopyWith<$Res> {
  _$TemplateCustomizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiddenFields = null,
    Object? labelOverrides = null,
    Object? defaultOverrides = null,
    Object? requiredOverrides = null,
  }) {
    return _then(
      _value.copyWith(
            hiddenFields: null == hiddenFields
                ? _value.hiddenFields
                : hiddenFields // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            labelOverrides: null == labelOverrides
                ? _value.labelOverrides
                : labelOverrides // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            defaultOverrides: null == defaultOverrides
                ? _value.defaultOverrides
                : defaultOverrides // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            requiredOverrides: null == requiredOverrides
                ? _value.requiredOverrides
                : requiredOverrides // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TemplateCustomizationImplCopyWith<$Res>
    implements $TemplateCustomizationCopyWith<$Res> {
  factory _$$TemplateCustomizationImplCopyWith(
    _$TemplateCustomizationImpl value,
    $Res Function(_$TemplateCustomizationImpl) then,
  ) = __$$TemplateCustomizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> hiddenFields,
    Map<String, String> labelOverrides,
    Map<String, String> defaultOverrides,
    Map<String, bool> requiredOverrides,
  });
}

/// @nodoc
class __$$TemplateCustomizationImplCopyWithImpl<$Res>
    extends
        _$TemplateCustomizationCopyWithImpl<$Res, _$TemplateCustomizationImpl>
    implements _$$TemplateCustomizationImplCopyWith<$Res> {
  __$$TemplateCustomizationImplCopyWithImpl(
    _$TemplateCustomizationImpl _value,
    $Res Function(_$TemplateCustomizationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TemplateCustomization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiddenFields = null,
    Object? labelOverrides = null,
    Object? defaultOverrides = null,
    Object? requiredOverrides = null,
  }) {
    return _then(
      _$TemplateCustomizationImpl(
        hiddenFields: null == hiddenFields
            ? _value._hiddenFields
            : hiddenFields // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        labelOverrides: null == labelOverrides
            ? _value._labelOverrides
            : labelOverrides // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        defaultOverrides: null == defaultOverrides
            ? _value._defaultOverrides
            : defaultOverrides // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        requiredOverrides: null == requiredOverrides
            ? _value._requiredOverrides
            : requiredOverrides // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateCustomizationImpl extends _TemplateCustomization {
  const _$TemplateCustomizationImpl({
    final List<String> hiddenFields = const [],
    final Map<String, String> labelOverrides = const {},
    final Map<String, String> defaultOverrides = const {},
    final Map<String, bool> requiredOverrides = const {},
  }) : _hiddenFields = hiddenFields,
       _labelOverrides = labelOverrides,
       _defaultOverrides = defaultOverrides,
       _requiredOverrides = requiredOverrides,
       super._();

  factory _$TemplateCustomizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateCustomizationImplFromJson(json);

  /// Fields to hide (list of field IDs)
  final List<String> _hiddenFields;

  /// Fields to hide (list of field IDs)
  @override
  @JsonKey()
  List<String> get hiddenFields {
    if (_hiddenFields is EqualUnmodifiableListView) return _hiddenFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hiddenFields);
  }

  /// Label overrides (field ID -> new label)
  final Map<String, String> _labelOverrides;

  /// Label overrides (field ID -> new label)
  @override
  @JsonKey()
  Map<String, String> get labelOverrides {
    if (_labelOverrides is EqualUnmodifiableMapView) return _labelOverrides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_labelOverrides);
  }

  /// Default value overrides (field ID -> default value)
  final Map<String, String> _defaultOverrides;

  /// Default value overrides (field ID -> default value)
  @override
  @JsonKey()
  Map<String, String> get defaultOverrides {
    if (_defaultOverrides is EqualUnmodifiableMapView) return _defaultOverrides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_defaultOverrides);
  }

  /// Required field overrides (field ID -> required status)
  final Map<String, bool> _requiredOverrides;

  /// Required field overrides (field ID -> required status)
  @override
  @JsonKey()
  Map<String, bool> get requiredOverrides {
    if (_requiredOverrides is EqualUnmodifiableMapView)
      return _requiredOverrides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_requiredOverrides);
  }

  @override
  String toString() {
    return 'TemplateCustomization(hiddenFields: $hiddenFields, labelOverrides: $labelOverrides, defaultOverrides: $defaultOverrides, requiredOverrides: $requiredOverrides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateCustomizationImpl &&
            const DeepCollectionEquality().equals(
              other._hiddenFields,
              _hiddenFields,
            ) &&
            const DeepCollectionEquality().equals(
              other._labelOverrides,
              _labelOverrides,
            ) &&
            const DeepCollectionEquality().equals(
              other._defaultOverrides,
              _defaultOverrides,
            ) &&
            const DeepCollectionEquality().equals(
              other._requiredOverrides,
              _requiredOverrides,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_hiddenFields),
    const DeepCollectionEquality().hash(_labelOverrides),
    const DeepCollectionEquality().hash(_defaultOverrides),
    const DeepCollectionEquality().hash(_requiredOverrides),
  );

  /// Create a copy of TemplateCustomization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateCustomizationImplCopyWith<_$TemplateCustomizationImpl>
  get copyWith =>
      __$$TemplateCustomizationImplCopyWithImpl<_$TemplateCustomizationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateCustomizationImplToJson(this);
  }
}

abstract class _TemplateCustomization extends TemplateCustomization {
  const factory _TemplateCustomization({
    final List<String> hiddenFields,
    final Map<String, String> labelOverrides,
    final Map<String, String> defaultOverrides,
    final Map<String, bool> requiredOverrides,
  }) = _$TemplateCustomizationImpl;
  const _TemplateCustomization._() : super._();

  factory _TemplateCustomization.fromJson(Map<String, dynamic> json) =
      _$TemplateCustomizationImpl.fromJson;

  /// Fields to hide (list of field IDs)
  @override
  List<String> get hiddenFields;

  /// Label overrides (field ID -> new label)
  @override
  Map<String, String> get labelOverrides;

  /// Default value overrides (field ID -> default value)
  @override
  Map<String, String> get defaultOverrides;

  /// Required field overrides (field ID -> required status)
  @override
  Map<String, bool> get requiredOverrides;

  /// Create a copy of TemplateCustomization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateCustomizationImplCopyWith<_$TemplateCustomizationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
