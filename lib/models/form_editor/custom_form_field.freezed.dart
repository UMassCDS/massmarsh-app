// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_form_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomFormField _$CustomFormFieldFromJson(Map<String, dynamic> json) {
  return _CustomFormField.fromJson(json);
}

/// @nodoc
mixin _$CustomFormField {
  int? get id => throw _privateConstructorUsedError;
  int get orgId => throw _privateConstructorUsedError;
  String get formName =>
      throw _privateConstructorUsedError; // 'common', 'vegetation', 'hydrology', 'elevation'
  String get fieldId => throw _privateConstructorUsedError;
  String get fieldLabel => throw _privateConstructorUsedError;
  String get fieldType => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  ValidationRules? get validation => throw _privateConstructorUsedError;
  List<DropdownOption>? get options => throw _privateConstructorUsedError;
  String? get helpText => throw _privateConstructorUsedError;
  int? get orderIndex => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int? get createdByUserId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CustomFormField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomFormField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomFormFieldCopyWith<CustomFormField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomFormFieldCopyWith<$Res> {
  factory $CustomFormFieldCopyWith(
    CustomFormField value,
    $Res Function(CustomFormField) then,
  ) = _$CustomFormFieldCopyWithImpl<$Res, CustomFormField>;
  @useResult
  $Res call({
    int? id,
    int orgId,
    String formName,
    String fieldId,
    String fieldLabel,
    String fieldType,
    bool required,
    ValidationRules? validation,
    List<DropdownOption>? options,
    String? helpText,
    int? orderIndex,
    bool isActive,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $ValidationRulesCopyWith<$Res>? get validation;
}

/// @nodoc
class _$CustomFormFieldCopyWithImpl<$Res, $Val extends CustomFormField>
    implements $CustomFormFieldCopyWith<$Res> {
  _$CustomFormFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomFormField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? formName = null,
    Object? fieldId = null,
    Object? fieldLabel = null,
    Object? fieldType = null,
    Object? required = null,
    Object? validation = freezed,
    Object? options = freezed,
    Object? helpText = freezed,
    Object? orderIndex = freezed,
    Object? isActive = null,
    Object? createdByUserId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
            formName: null == formName
                ? _value.formName
                : formName // ignore: cast_nullable_to_non_nullable
                      as String,
            fieldId: null == fieldId
                ? _value.fieldId
                : fieldId // ignore: cast_nullable_to_non_nullable
                      as String,
            fieldLabel: null == fieldLabel
                ? _value.fieldLabel
                : fieldLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            fieldType: null == fieldType
                ? _value.fieldType
                : fieldType // ignore: cast_nullable_to_non_nullable
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
            helpText: freezed == helpText
                ? _value.helpText
                : helpText // ignore: cast_nullable_to_non_nullable
                      as String?,
            orderIndex: freezed == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdByUserId: freezed == createdByUserId
                ? _value.createdByUserId
                : createdByUserId // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of CustomFormField
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
abstract class _$$CustomFormFieldImplCopyWith<$Res>
    implements $CustomFormFieldCopyWith<$Res> {
  factory _$$CustomFormFieldImplCopyWith(
    _$CustomFormFieldImpl value,
    $Res Function(_$CustomFormFieldImpl) then,
  ) = __$$CustomFormFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int orgId,
    String formName,
    String fieldId,
    String fieldLabel,
    String fieldType,
    bool required,
    ValidationRules? validation,
    List<DropdownOption>? options,
    String? helpText,
    int? orderIndex,
    bool isActive,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $ValidationRulesCopyWith<$Res>? get validation;
}

/// @nodoc
class __$$CustomFormFieldImplCopyWithImpl<$Res>
    extends _$CustomFormFieldCopyWithImpl<$Res, _$CustomFormFieldImpl>
    implements _$$CustomFormFieldImplCopyWith<$Res> {
  __$$CustomFormFieldImplCopyWithImpl(
    _$CustomFormFieldImpl _value,
    $Res Function(_$CustomFormFieldImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomFormField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? formName = null,
    Object? fieldId = null,
    Object? fieldLabel = null,
    Object? fieldType = null,
    Object? required = null,
    Object? validation = freezed,
    Object? options = freezed,
    Object? helpText = freezed,
    Object? orderIndex = freezed,
    Object? isActive = null,
    Object? createdByUserId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$CustomFormFieldImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        orgId: null == orgId
            ? _value.orgId
            : orgId // ignore: cast_nullable_to_non_nullable
                  as int,
        formName: null == formName
            ? _value.formName
            : formName // ignore: cast_nullable_to_non_nullable
                  as String,
        fieldId: null == fieldId
            ? _value.fieldId
            : fieldId // ignore: cast_nullable_to_non_nullable
                  as String,
        fieldLabel: null == fieldLabel
            ? _value.fieldLabel
            : fieldLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        fieldType: null == fieldType
            ? _value.fieldType
            : fieldType // ignore: cast_nullable_to_non_nullable
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
        helpText: freezed == helpText
            ? _value.helpText
            : helpText // ignore: cast_nullable_to_non_nullable
                  as String?,
        orderIndex: freezed == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdByUserId: freezed == createdByUserId
            ? _value.createdByUserId
            : createdByUserId // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomFormFieldImpl implements _CustomFormField {
  const _$CustomFormFieldImpl({
    this.id,
    required this.orgId,
    required this.formName,
    required this.fieldId,
    required this.fieldLabel,
    required this.fieldType,
    this.required = false,
    this.validation,
    final List<DropdownOption>? options,
    this.helpText,
    this.orderIndex,
    this.isActive = true,
    this.createdByUserId,
    this.createdAt,
    this.updatedAt,
  }) : _options = options;

  factory _$CustomFormFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomFormFieldImplFromJson(json);

  @override
  final int? id;
  @override
  final int orgId;
  @override
  final String formName;
  // 'common', 'vegetation', 'hydrology', 'elevation'
  @override
  final String fieldId;
  @override
  final String fieldLabel;
  @override
  final String fieldType;
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
  final String? helpText;
  @override
  final int? orderIndex;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final int? createdByUserId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CustomFormField(id: $id, orgId: $orgId, formName: $formName, fieldId: $fieldId, fieldLabel: $fieldLabel, fieldType: $fieldType, required: $required, validation: $validation, options: $options, helpText: $helpText, orderIndex: $orderIndex, isActive: $isActive, createdByUserId: $createdByUserId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomFormFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.formName, formName) ||
                other.formName == formName) &&
            (identical(other.fieldId, fieldId) || other.fieldId == fieldId) &&
            (identical(other.fieldLabel, fieldLabel) ||
                other.fieldLabel == fieldLabel) &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.helpText, helpText) ||
                other.helpText == helpText) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orgId,
    formName,
    fieldId,
    fieldLabel,
    fieldType,
    required,
    validation,
    const DeepCollectionEquality().hash(_options),
    helpText,
    orderIndex,
    isActive,
    createdByUserId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of CustomFormField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomFormFieldImplCopyWith<_$CustomFormFieldImpl> get copyWith =>
      __$$CustomFormFieldImplCopyWithImpl<_$CustomFormFieldImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomFormFieldImplToJson(this);
  }
}

abstract class _CustomFormField implements CustomFormField {
  const factory _CustomFormField({
    final int? id,
    required final int orgId,
    required final String formName,
    required final String fieldId,
    required final String fieldLabel,
    required final String fieldType,
    final bool required,
    final ValidationRules? validation,
    final List<DropdownOption>? options,
    final String? helpText,
    final int? orderIndex,
    final bool isActive,
    final int? createdByUserId,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$CustomFormFieldImpl;

  factory _CustomFormField.fromJson(Map<String, dynamic> json) =
      _$CustomFormFieldImpl.fromJson;

  @override
  int? get id;
  @override
  int get orgId;
  @override
  String get formName; // 'common', 'vegetation', 'hydrology', 'elevation'
  @override
  String get fieldId;
  @override
  String get fieldLabel;
  @override
  String get fieldType;
  @override
  bool get required;
  @override
  ValidationRules? get validation;
  @override
  List<DropdownOption>? get options;
  @override
  String? get helpText;
  @override
  int? get orderIndex;
  @override
  bool get isActive;
  @override
  int? get createdByUserId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CustomFormField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomFormFieldImplCopyWith<_$CustomFormFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormVersion _$FormVersionFromJson(Map<String, dynamic> json) {
  return _FormVersion.fromJson(json);
}

/// @nodoc
mixin _$FormVersion {
  int? get id => throw _privateConstructorUsedError;
  int get orgId => throw _privateConstructorUsedError;
  String get formName => throw _privateConstructorUsedError;
  int get versionNumber => throw _privateConstructorUsedError;
  String get configHash => throw _privateConstructorUsedError;
  int? get publishedByUserId => throw _privateConstructorUsedError;
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FormVersion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormVersionCopyWith<FormVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormVersionCopyWith<$Res> {
  factory $FormVersionCopyWith(
    FormVersion value,
    $Res Function(FormVersion) then,
  ) = _$FormVersionCopyWithImpl<$Res, FormVersion>;
  @useResult
  $Res call({
    int? id,
    int orgId,
    String formName,
    int versionNumber,
    String configHash,
    int? publishedByUserId,
    DateTime? publishedAt,
    bool isActive,
    String? description,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$FormVersionCopyWithImpl<$Res, $Val extends FormVersion>
    implements $FormVersionCopyWith<$Res> {
  _$FormVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? formName = null,
    Object? versionNumber = null,
    Object? configHash = null,
    Object? publishedByUserId = freezed,
    Object? publishedAt = freezed,
    Object? isActive = null,
    Object? description = freezed,
    Object? createdAt = freezed,
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
            formName: null == formName
                ? _value.formName
                : formName // ignore: cast_nullable_to_non_nullable
                      as String,
            versionNumber: null == versionNumber
                ? _value.versionNumber
                : versionNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            configHash: null == configHash
                ? _value.configHash
                : configHash // ignore: cast_nullable_to_non_nullable
                      as String,
            publishedByUserId: freezed == publishedByUserId
                ? _value.publishedByUserId
                : publishedByUserId // ignore: cast_nullable_to_non_nullable
                      as int?,
            publishedAt: freezed == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormVersionImplCopyWith<$Res>
    implements $FormVersionCopyWith<$Res> {
  factory _$$FormVersionImplCopyWith(
    _$FormVersionImpl value,
    $Res Function(_$FormVersionImpl) then,
  ) = __$$FormVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int orgId,
    String formName,
    int versionNumber,
    String configHash,
    int? publishedByUserId,
    DateTime? publishedAt,
    bool isActive,
    String? description,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$FormVersionImplCopyWithImpl<$Res>
    extends _$FormVersionCopyWithImpl<$Res, _$FormVersionImpl>
    implements _$$FormVersionImplCopyWith<$Res> {
  __$$FormVersionImplCopyWithImpl(
    _$FormVersionImpl _value,
    $Res Function(_$FormVersionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? formName = null,
    Object? versionNumber = null,
    Object? configHash = null,
    Object? publishedByUserId = freezed,
    Object? publishedAt = freezed,
    Object? isActive = null,
    Object? description = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$FormVersionImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        orgId: null == orgId
            ? _value.orgId
            : orgId // ignore: cast_nullable_to_non_nullable
                  as int,
        formName: null == formName
            ? _value.formName
            : formName // ignore: cast_nullable_to_non_nullable
                  as String,
        versionNumber: null == versionNumber
            ? _value.versionNumber
            : versionNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        configHash: null == configHash
            ? _value.configHash
            : configHash // ignore: cast_nullable_to_non_nullable
                  as String,
        publishedByUserId: freezed == publishedByUserId
            ? _value.publishedByUserId
            : publishedByUserId // ignore: cast_nullable_to_non_nullable
                  as int?,
        publishedAt: freezed == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormVersionImpl implements _FormVersion {
  const _$FormVersionImpl({
    this.id,
    required this.orgId,
    required this.formName,
    required this.versionNumber,
    required this.configHash,
    this.publishedByUserId,
    this.publishedAt,
    this.isActive = true,
    this.description,
    this.createdAt,
  });

  factory _$FormVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormVersionImplFromJson(json);

  @override
  final int? id;
  @override
  final int orgId;
  @override
  final String formName;
  @override
  final int versionNumber;
  @override
  final String configHash;
  @override
  final int? publishedByUserId;
  @override
  final DateTime? publishedAt;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? description;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FormVersion(id: $id, orgId: $orgId, formName: $formName, versionNumber: $versionNumber, configHash: $configHash, publishedByUserId: $publishedByUserId, publishedAt: $publishedAt, isActive: $isActive, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormVersionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.formName, formName) ||
                other.formName == formName) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.configHash, configHash) ||
                other.configHash == configHash) &&
            (identical(other.publishedByUserId, publishedByUserId) ||
                other.publishedByUserId == publishedByUserId) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orgId,
    formName,
    versionNumber,
    configHash,
    publishedByUserId,
    publishedAt,
    isActive,
    description,
    createdAt,
  );

  /// Create a copy of FormVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormVersionImplCopyWith<_$FormVersionImpl> get copyWith =>
      __$$FormVersionImplCopyWithImpl<_$FormVersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormVersionImplToJson(this);
  }
}

abstract class _FormVersion implements FormVersion {
  const factory _FormVersion({
    final int? id,
    required final int orgId,
    required final String formName,
    required final int versionNumber,
    required final String configHash,
    final int? publishedByUserId,
    final DateTime? publishedAt,
    final bool isActive,
    final String? description,
    final DateTime? createdAt,
  }) = _$FormVersionImpl;

  factory _FormVersion.fromJson(Map<String, dynamic> json) =
      _$FormVersionImpl.fromJson;

  @override
  int? get id;
  @override
  int get orgId;
  @override
  String get formName;
  @override
  int get versionNumber;
  @override
  String get configHash;
  @override
  int? get publishedByUserId;
  @override
  DateTime? get publishedAt;
  @override
  bool get isActive;
  @override
  String? get description;
  @override
  DateTime? get createdAt;

  /// Create a copy of FormVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormVersionImplCopyWith<_$FormVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
