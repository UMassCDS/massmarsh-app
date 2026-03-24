// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FormTemplate _$FormTemplateFromJson(Map<String, dynamic> json) {
  return _FormTemplate.fromJson(json);
}

/// @nodoc
mixin _$FormTemplate {
  int? get id => throw _privateConstructorUsedError;
  String get templateCode => throw _privateConstructorUsedError;
  String get templateName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get monitoringType => throw _privateConstructorUsedError;
  FormSchema get schema => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FormTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormTemplateCopyWith<FormTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormTemplateCopyWith<$Res> {
  factory $FormTemplateCopyWith(
    FormTemplate value,
    $Res Function(FormTemplate) then,
  ) = _$FormTemplateCopyWithImpl<$Res, FormTemplate>;
  @useResult
  $Res call({
    int? id,
    String templateCode,
    String templateName,
    String? description,
    String monitoringType,
    FormSchema schema,
    bool isActive,
    DateTime? createdAt,
  });

  $FormSchemaCopyWith<$Res> get schema;
}

/// @nodoc
class _$FormTemplateCopyWithImpl<$Res, $Val extends FormTemplate>
    implements $FormTemplateCopyWith<$Res> {
  _$FormTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? templateCode = null,
    Object? templateName = null,
    Object? description = freezed,
    Object? monitoringType = null,
    Object? schema = null,
    Object? isActive = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            templateCode: null == templateCode
                ? _value.templateCode
                : templateCode // ignore: cast_nullable_to_non_nullable
                      as String,
            templateName: null == templateName
                ? _value.templateName
                : templateName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            monitoringType: null == monitoringType
                ? _value.monitoringType
                : monitoringType // ignore: cast_nullable_to_non_nullable
                      as String,
            schema: null == schema
                ? _value.schema
                : schema // ignore: cast_nullable_to_non_nullable
                      as FormSchema,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of FormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormSchemaCopyWith<$Res> get schema {
    return $FormSchemaCopyWith<$Res>(_value.schema, (value) {
      return _then(_value.copyWith(schema: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormTemplateImplCopyWith<$Res>
    implements $FormTemplateCopyWith<$Res> {
  factory _$$FormTemplateImplCopyWith(
    _$FormTemplateImpl value,
    $Res Function(_$FormTemplateImpl) then,
  ) = __$$FormTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String templateCode,
    String templateName,
    String? description,
    String monitoringType,
    FormSchema schema,
    bool isActive,
    DateTime? createdAt,
  });

  @override
  $FormSchemaCopyWith<$Res> get schema;
}

/// @nodoc
class __$$FormTemplateImplCopyWithImpl<$Res>
    extends _$FormTemplateCopyWithImpl<$Res, _$FormTemplateImpl>
    implements _$$FormTemplateImplCopyWith<$Res> {
  __$$FormTemplateImplCopyWithImpl(
    _$FormTemplateImpl _value,
    $Res Function(_$FormTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? templateCode = null,
    Object? templateName = null,
    Object? description = freezed,
    Object? monitoringType = null,
    Object? schema = null,
    Object? isActive = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$FormTemplateImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        templateCode: null == templateCode
            ? _value.templateCode
            : templateCode // ignore: cast_nullable_to_non_nullable
                  as String,
        templateName: null == templateName
            ? _value.templateName
            : templateName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        monitoringType: null == monitoringType
            ? _value.monitoringType
            : monitoringType // ignore: cast_nullable_to_non_nullable
                  as String,
        schema: null == schema
            ? _value.schema
            : schema // ignore: cast_nullable_to_non_nullable
                  as FormSchema,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$FormTemplateImpl extends _FormTemplate {
  const _$FormTemplateImpl({
    this.id,
    required this.templateCode,
    required this.templateName,
    this.description,
    required this.monitoringType,
    required this.schema,
    this.isActive = true,
    this.createdAt,
  }) : super._();

  factory _$FormTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormTemplateImplFromJson(json);

  @override
  final int? id;
  @override
  final String templateCode;
  @override
  final String templateName;
  @override
  final String? description;
  @override
  final String monitoringType;
  @override
  final FormSchema schema;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FormTemplate(id: $id, templateCode: $templateCode, templateName: $templateName, description: $description, monitoringType: $monitoringType, schema: $schema, isActive: $isActive, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.templateCode, templateCode) ||
                other.templateCode == templateCode) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.monitoringType, monitoringType) ||
                other.monitoringType == monitoringType) &&
            (identical(other.schema, schema) || other.schema == schema) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    templateCode,
    templateName,
    description,
    monitoringType,
    schema,
    isActive,
    createdAt,
  );

  /// Create a copy of FormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormTemplateImplCopyWith<_$FormTemplateImpl> get copyWith =>
      __$$FormTemplateImplCopyWithImpl<_$FormTemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormTemplateImplToJson(this);
  }
}

abstract class _FormTemplate extends FormTemplate {
  const factory _FormTemplate({
    final int? id,
    required final String templateCode,
    required final String templateName,
    final String? description,
    required final String monitoringType,
    required final FormSchema schema,
    final bool isActive,
    final DateTime? createdAt,
  }) = _$FormTemplateImpl;
  const _FormTemplate._() : super._();

  factory _FormTemplate.fromJson(Map<String, dynamic> json) =
      _$FormTemplateImpl.fromJson;

  @override
  int? get id;
  @override
  String get templateCode;
  @override
  String get templateName;
  @override
  String? get description;
  @override
  String get monitoringType;
  @override
  FormSchema get schema;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;

  /// Create a copy of FormTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormTemplateImplCopyWith<_$FormTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormSchema _$FormSchemaFromJson(Map<String, dynamic> json) {
  return _FormSchema.fromJson(json);
}

/// @nodoc
mixin _$FormSchema {
  String get version => throw _privateConstructorUsedError;
  List<FormSection> get sections => throw _privateConstructorUsedError;

  /// Serializes this FormSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormSchemaCopyWith<FormSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormSchemaCopyWith<$Res> {
  factory $FormSchemaCopyWith(
    FormSchema value,
    $Res Function(FormSchema) then,
  ) = _$FormSchemaCopyWithImpl<$Res, FormSchema>;
  @useResult
  $Res call({String version, List<FormSection> sections});
}

/// @nodoc
class _$FormSchemaCopyWithImpl<$Res, $Val extends FormSchema>
    implements $FormSchemaCopyWith<$Res> {
  _$FormSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? sections = null}) {
    return _then(
      _value.copyWith(
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            sections: null == sections
                ? _value.sections
                : sections // ignore: cast_nullable_to_non_nullable
                      as List<FormSection>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormSchemaImplCopyWith<$Res>
    implements $FormSchemaCopyWith<$Res> {
  factory _$$FormSchemaImplCopyWith(
    _$FormSchemaImpl value,
    $Res Function(_$FormSchemaImpl) then,
  ) = __$$FormSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, List<FormSection> sections});
}

/// @nodoc
class __$$FormSchemaImplCopyWithImpl<$Res>
    extends _$FormSchemaCopyWithImpl<$Res, _$FormSchemaImpl>
    implements _$$FormSchemaImplCopyWith<$Res> {
  __$$FormSchemaImplCopyWithImpl(
    _$FormSchemaImpl _value,
    $Res Function(_$FormSchemaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? version = null, Object? sections = null}) {
    return _then(
      _$FormSchemaImpl(
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        sections: null == sections
            ? _value._sections
            : sections // ignore: cast_nullable_to_non_nullable
                  as List<FormSection>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormSchemaImpl extends _FormSchema {
  const _$FormSchemaImpl({
    required this.version,
    required final List<FormSection> sections,
  }) : _sections = sections,
       super._();

  factory _$FormSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormSchemaImplFromJson(json);

  @override
  final String version;
  final List<FormSection> _sections;
  @override
  List<FormSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'FormSchema(version: $version, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSchemaImpl &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    version,
    const DeepCollectionEquality().hash(_sections),
  );

  /// Create a copy of FormSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormSchemaImplCopyWith<_$FormSchemaImpl> get copyWith =>
      __$$FormSchemaImplCopyWithImpl<_$FormSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormSchemaImplToJson(this);
  }
}

abstract class _FormSchema extends FormSchema {
  const factory _FormSchema({
    required final String version,
    required final List<FormSection> sections,
  }) = _$FormSchemaImpl;
  const _FormSchema._() : super._();

  factory _FormSchema.fromJson(Map<String, dynamic> json) =
      _$FormSchemaImpl.fromJson;

  @override
  String get version;
  @override
  List<FormSection> get sections;

  /// Create a copy of FormSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSchemaImplCopyWith<_$FormSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormSection _$FormSectionFromJson(Map<String, dynamic> json) {
  return _FormSection.fromJson(json);
}

/// @nodoc
mixin _$FormSection {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// 'header' for single-entry sections, 'repeating_group' for multiple entries
  String get type => throw _privateConstructorUsedError;
  List<DynamicFormField> get fields => throw _privateConstructorUsedError;

  /// Minimum number of entries (for repeating groups)
  int? get minItems => throw _privateConstructorUsedError;

  /// Maximum number of entries (for repeating groups)
  int? get maxItems => throw _privateConstructorUsedError;

  /// Serializes this FormSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormSectionCopyWith<FormSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormSectionCopyWith<$Res> {
  factory $FormSectionCopyWith(
    FormSection value,
    $Res Function(FormSection) then,
  ) = _$FormSectionCopyWithImpl<$Res, FormSection>;
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    List<DynamicFormField> fields,
    int? minItems,
    int? maxItems,
  });
}

/// @nodoc
class _$FormSectionCopyWithImpl<$Res, $Val extends FormSection>
    implements $FormSectionCopyWith<$Res> {
  _$FormSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            fields: null == fields
                ? _value.fields
                : fields // ignore: cast_nullable_to_non_nullable
                      as List<DynamicFormField>,
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
abstract class _$$FormSectionImplCopyWith<$Res>
    implements $FormSectionCopyWith<$Res> {
  factory _$$FormSectionImplCopyWith(
    _$FormSectionImpl value,
    $Res Function(_$FormSectionImpl) then,
  ) = __$$FormSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    List<DynamicFormField> fields,
    int? minItems,
    int? maxItems,
  });
}

/// @nodoc
class __$$FormSectionImplCopyWithImpl<$Res>
    extends _$FormSectionCopyWithImpl<$Res, _$FormSectionImpl>
    implements _$$FormSectionImplCopyWith<$Res> {
  __$$FormSectionImplCopyWithImpl(
    _$FormSectionImpl _value,
    $Res Function(_$FormSectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? fields = null,
    Object? minItems = freezed,
    Object? maxItems = freezed,
  }) {
    return _then(
      _$FormSectionImpl(
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
        fields: null == fields
            ? _value._fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as List<DynamicFormField>,
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
class _$FormSectionImpl extends _FormSection {
  const _$FormSectionImpl({
    required this.id,
    required this.name,
    required this.type,
    required final List<DynamicFormField> fields,
    this.minItems,
    this.maxItems,
  }) : _fields = fields,
       super._();

  factory _$FormSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormSectionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  /// 'header' for single-entry sections, 'repeating_group' for multiple entries
  @override
  final String type;
  final List<DynamicFormField> _fields;
  @override
  List<DynamicFormField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  /// Minimum number of entries (for repeating groups)
  @override
  final int? minItems;

  /// Maximum number of entries (for repeating groups)
  @override
  final int? maxItems;

  @override
  String toString() {
    return 'FormSection(id: $id, name: $name, type: $type, fields: $fields, minItems: $minItems, maxItems: $maxItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
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
    type,
    const DeepCollectionEquality().hash(_fields),
    minItems,
    maxItems,
  );

  /// Create a copy of FormSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormSectionImplCopyWith<_$FormSectionImpl> get copyWith =>
      __$$FormSectionImplCopyWithImpl<_$FormSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormSectionImplToJson(this);
  }
}

abstract class _FormSection extends FormSection {
  const factory _FormSection({
    required final String id,
    required final String name,
    required final String type,
    required final List<DynamicFormField> fields,
    final int? minItems,
    final int? maxItems,
  }) = _$FormSectionImpl;
  const _FormSection._() : super._();

  factory _FormSection.fromJson(Map<String, dynamic> json) =
      _$FormSectionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// 'header' for single-entry sections, 'repeating_group' for multiple entries
  @override
  String get type;
  @override
  List<DynamicFormField> get fields;

  /// Minimum number of entries (for repeating groups)
  @override
  int? get minItems;

  /// Maximum number of entries (for repeating groups)
  @override
  int? get maxItems;

  /// Create a copy of FormSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSectionImplCopyWith<_$FormSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DynamicFormField _$DynamicFormFieldFromJson(Map<String, dynamic> json) {
  return _DynamicFormField.fromJson(json);
}

/// @nodoc
mixin _$DynamicFormField {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Field type: text, number, decimal, dropdown, date, time, gps,
  /// percentage, species_lookup, multiline_text, nested_repeating, photo
  String get type => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;

  /// Dropdown options for 'dropdown' type
  List<String>? get options => throw _privateConstructorUsedError;

  /// Reference to data source (e.g., 'species_lookup' table)
  String? get dataSource => throw _privateConstructorUsedError;

  /// Date/time format string
  String? get format => throw _privateConstructorUsedError;

  /// Default value
  String? get defaultValue => throw _privateConstructorUsedError;

  /// Validation rules
  DynamicValidationRules? get validation => throw _privateConstructorUsedError;

  /// Help text shown to user
  String? get helpText => throw _privateConstructorUsedError;

  /// Nested fields for 'nested_repeating' type
  List<DynamicFormField>? get nestedFields =>
      throw _privateConstructorUsedError;

  /// Min/max items for nested repeating fields
  int? get minItems => throw _privateConstructorUsedError;
  int? get maxItems => throw _privateConstructorUsedError;

  /// Display order
  int? get orderIndex => throw _privateConstructorUsedError;

  /// Serializes this DynamicFormField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicFormField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormFieldCopyWith<DynamicFormField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormFieldCopyWith<$Res> {
  factory $DynamicFormFieldCopyWith(
    DynamicFormField value,
    $Res Function(DynamicFormField) then,
  ) = _$DynamicFormFieldCopyWithImpl<$Res, DynamicFormField>;
  @useResult
  $Res call({
    String id,
    String label,
    String type,
    bool required,
    List<String>? options,
    String? dataSource,
    String? format,
    String? defaultValue,
    DynamicValidationRules? validation,
    String? helpText,
    List<DynamicFormField>? nestedFields,
    int? minItems,
    int? maxItems,
    int? orderIndex,
  });

  $DynamicValidationRulesCopyWith<$Res>? get validation;
}

/// @nodoc
class _$DynamicFormFieldCopyWithImpl<$Res, $Val extends DynamicFormField>
    implements $DynamicFormFieldCopyWith<$Res> {
  _$DynamicFormFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicFormField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? required = null,
    Object? options = freezed,
    Object? dataSource = freezed,
    Object? format = freezed,
    Object? defaultValue = freezed,
    Object? validation = freezed,
    Object? helpText = freezed,
    Object? nestedFields = freezed,
    Object? minItems = freezed,
    Object? maxItems = freezed,
    Object? orderIndex = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            required: null == required
                ? _value.required
                : required // ignore: cast_nullable_to_non_nullable
                      as bool,
            options: freezed == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            dataSource: freezed == dataSource
                ? _value.dataSource
                : dataSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            format: freezed == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultValue: freezed == defaultValue
                ? _value.defaultValue
                : defaultValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            validation: freezed == validation
                ? _value.validation
                : validation // ignore: cast_nullable_to_non_nullable
                      as DynamicValidationRules?,
            helpText: freezed == helpText
                ? _value.helpText
                : helpText // ignore: cast_nullable_to_non_nullable
                      as String?,
            nestedFields: freezed == nestedFields
                ? _value.nestedFields
                : nestedFields // ignore: cast_nullable_to_non_nullable
                      as List<DynamicFormField>?,
            minItems: freezed == minItems
                ? _value.minItems
                : minItems // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxItems: freezed == maxItems
                ? _value.maxItems
                : maxItems // ignore: cast_nullable_to_non_nullable
                      as int?,
            orderIndex: freezed == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of DynamicFormField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DynamicValidationRulesCopyWith<$Res>? get validation {
    if (_value.validation == null) {
      return null;
    }

    return $DynamicValidationRulesCopyWith<$Res>(_value.validation!, (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DynamicFormFieldImplCopyWith<$Res>
    implements $DynamicFormFieldCopyWith<$Res> {
  factory _$$DynamicFormFieldImplCopyWith(
    _$DynamicFormFieldImpl value,
    $Res Function(_$DynamicFormFieldImpl) then,
  ) = __$$DynamicFormFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    String type,
    bool required,
    List<String>? options,
    String? dataSource,
    String? format,
    String? defaultValue,
    DynamicValidationRules? validation,
    String? helpText,
    List<DynamicFormField>? nestedFields,
    int? minItems,
    int? maxItems,
    int? orderIndex,
  });

  @override
  $DynamicValidationRulesCopyWith<$Res>? get validation;
}

/// @nodoc
class __$$DynamicFormFieldImplCopyWithImpl<$Res>
    extends _$DynamicFormFieldCopyWithImpl<$Res, _$DynamicFormFieldImpl>
    implements _$$DynamicFormFieldImplCopyWith<$Res> {
  __$$DynamicFormFieldImplCopyWithImpl(
    _$DynamicFormFieldImpl _value,
    $Res Function(_$DynamicFormFieldImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DynamicFormField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? required = null,
    Object? options = freezed,
    Object? dataSource = freezed,
    Object? format = freezed,
    Object? defaultValue = freezed,
    Object? validation = freezed,
    Object? helpText = freezed,
    Object? nestedFields = freezed,
    Object? minItems = freezed,
    Object? maxItems = freezed,
    Object? orderIndex = freezed,
  }) {
    return _then(
      _$DynamicFormFieldImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        required: null == required
            ? _value.required
            : required // ignore: cast_nullable_to_non_nullable
                  as bool,
        options: freezed == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        dataSource: freezed == dataSource
            ? _value.dataSource
            : dataSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        format: freezed == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultValue: freezed == defaultValue
            ? _value.defaultValue
            : defaultValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        validation: freezed == validation
            ? _value.validation
            : validation // ignore: cast_nullable_to_non_nullable
                  as DynamicValidationRules?,
        helpText: freezed == helpText
            ? _value.helpText
            : helpText // ignore: cast_nullable_to_non_nullable
                  as String?,
        nestedFields: freezed == nestedFields
            ? _value._nestedFields
            : nestedFields // ignore: cast_nullable_to_non_nullable
                  as List<DynamicFormField>?,
        minItems: freezed == minItems
            ? _value.minItems
            : minItems // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxItems: freezed == maxItems
            ? _value.maxItems
            : maxItems // ignore: cast_nullable_to_non_nullable
                  as int?,
        orderIndex: freezed == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DynamicFormFieldImpl extends _DynamicFormField {
  const _$DynamicFormFieldImpl({
    required this.id,
    required this.label,
    required this.type,
    this.required = false,
    final List<String>? options,
    this.dataSource,
    this.format,
    this.defaultValue,
    this.validation,
    this.helpText,
    final List<DynamicFormField>? nestedFields,
    this.minItems,
    this.maxItems,
    this.orderIndex,
  }) : _options = options,
       _nestedFields = nestedFields,
       super._();

  factory _$DynamicFormFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicFormFieldImplFromJson(json);

  @override
  final String id;
  @override
  final String label;

  /// Field type: text, number, decimal, dropdown, date, time, gps,
  /// percentage, species_lookup, multiline_text, nested_repeating, photo
  @override
  final String type;
  @override
  @JsonKey()
  final bool required;

  /// Dropdown options for 'dropdown' type
  final List<String>? _options;

  /// Dropdown options for 'dropdown' type
  @override
  List<String>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Reference to data source (e.g., 'species_lookup' table)
  @override
  final String? dataSource;

  /// Date/time format string
  @override
  final String? format;

  /// Default value
  @override
  final String? defaultValue;

  /// Validation rules
  @override
  final DynamicValidationRules? validation;

  /// Help text shown to user
  @override
  final String? helpText;

  /// Nested fields for 'nested_repeating' type
  final List<DynamicFormField>? _nestedFields;

  /// Nested fields for 'nested_repeating' type
  @override
  List<DynamicFormField>? get nestedFields {
    final value = _nestedFields;
    if (value == null) return null;
    if (_nestedFields is EqualUnmodifiableListView) return _nestedFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Min/max items for nested repeating fields
  @override
  final int? minItems;
  @override
  final int? maxItems;

  /// Display order
  @override
  final int? orderIndex;

  @override
  String toString() {
    return 'DynamicFormField(id: $id, label: $label, type: $type, required: $required, options: $options, dataSource: $dataSource, format: $format, defaultValue: $defaultValue, validation: $validation, helpText: $helpText, nestedFields: $nestedFields, minItems: $minItems, maxItems: $maxItems, orderIndex: $orderIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicFormFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            (identical(other.helpText, helpText) ||
                other.helpText == helpText) &&
            const DeepCollectionEquality().equals(
              other._nestedFields,
              _nestedFields,
            ) &&
            (identical(other.minItems, minItems) ||
                other.minItems == minItems) &&
            (identical(other.maxItems, maxItems) ||
                other.maxItems == maxItems) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    type,
    required,
    const DeepCollectionEquality().hash(_options),
    dataSource,
    format,
    defaultValue,
    validation,
    helpText,
    const DeepCollectionEquality().hash(_nestedFields),
    minItems,
    maxItems,
    orderIndex,
  );

  /// Create a copy of DynamicFormField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormFieldImplCopyWith<_$DynamicFormFieldImpl> get copyWith =>
      __$$DynamicFormFieldImplCopyWithImpl<_$DynamicFormFieldImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicFormFieldImplToJson(this);
  }
}

abstract class _DynamicFormField extends DynamicFormField {
  const factory _DynamicFormField({
    required final String id,
    required final String label,
    required final String type,
    final bool required,
    final List<String>? options,
    final String? dataSource,
    final String? format,
    final String? defaultValue,
    final DynamicValidationRules? validation,
    final String? helpText,
    final List<DynamicFormField>? nestedFields,
    final int? minItems,
    final int? maxItems,
    final int? orderIndex,
  }) = _$DynamicFormFieldImpl;
  const _DynamicFormField._() : super._();

  factory _DynamicFormField.fromJson(Map<String, dynamic> json) =
      _$DynamicFormFieldImpl.fromJson;

  @override
  String get id;
  @override
  String get label;

  /// Field type: text, number, decimal, dropdown, date, time, gps,
  /// percentage, species_lookup, multiline_text, nested_repeating, photo
  @override
  String get type;
  @override
  bool get required;

  /// Dropdown options for 'dropdown' type
  @override
  List<String>? get options;

  /// Reference to data source (e.g., 'species_lookup' table)
  @override
  String? get dataSource;

  /// Date/time format string
  @override
  String? get format;

  /// Default value
  @override
  String? get defaultValue;

  /// Validation rules
  @override
  DynamicValidationRules? get validation;

  /// Help text shown to user
  @override
  String? get helpText;

  /// Nested fields for 'nested_repeating' type
  @override
  List<DynamicFormField>? get nestedFields;

  /// Min/max items for nested repeating fields
  @override
  int? get minItems;
  @override
  int? get maxItems;

  /// Display order
  @override
  int? get orderIndex;

  /// Create a copy of DynamicFormField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormFieldImplCopyWith<_$DynamicFormFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DynamicValidationRules _$DynamicValidationRulesFromJson(
  Map<String, dynamic> json,
) {
  return _DynamicValidationRules.fromJson(json);
}

/// @nodoc
mixin _$DynamicValidationRules {
  int? get minLength => throw _privateConstructorUsedError;
  int? get maxLength => throw _privateConstructorUsedError;
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  String? get pattern => throw _privateConstructorUsedError;
  String? get patternMessage => throw _privateConstructorUsedError;

  /// Serializes this DynamicValidationRules to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicValidationRulesCopyWith<DynamicValidationRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicValidationRulesCopyWith<$Res> {
  factory $DynamicValidationRulesCopyWith(
    DynamicValidationRules value,
    $Res Function(DynamicValidationRules) then,
  ) = _$DynamicValidationRulesCopyWithImpl<$Res, DynamicValidationRules>;
  @useResult
  $Res call({
    int? minLength,
    int? maxLength,
    double? min,
    double? max,
    String? pattern,
    String? patternMessage,
  });
}

/// @nodoc
class _$DynamicValidationRulesCopyWithImpl<
  $Res,
  $Val extends DynamicValidationRules
>
    implements $DynamicValidationRulesCopyWith<$Res> {
  _$DynamicValidationRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? pattern = freezed,
    Object? patternMessage = freezed,
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
            patternMessage: freezed == patternMessage
                ? _value.patternMessage
                : patternMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DynamicValidationRulesImplCopyWith<$Res>
    implements $DynamicValidationRulesCopyWith<$Res> {
  factory _$$DynamicValidationRulesImplCopyWith(
    _$DynamicValidationRulesImpl value,
    $Res Function(_$DynamicValidationRulesImpl) then,
  ) = __$$DynamicValidationRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? minLength,
    int? maxLength,
    double? min,
    double? max,
    String? pattern,
    String? patternMessage,
  });
}

/// @nodoc
class __$$DynamicValidationRulesImplCopyWithImpl<$Res>
    extends
        _$DynamicValidationRulesCopyWithImpl<$Res, _$DynamicValidationRulesImpl>
    implements _$$DynamicValidationRulesImplCopyWith<$Res> {
  __$$DynamicValidationRulesImplCopyWithImpl(
    _$DynamicValidationRulesImpl _value,
    $Res Function(_$DynamicValidationRulesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DynamicValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? pattern = freezed,
    Object? patternMessage = freezed,
  }) {
    return _then(
      _$DynamicValidationRulesImpl(
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
        patternMessage: freezed == patternMessage
            ? _value.patternMessage
            : patternMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DynamicValidationRulesImpl extends _DynamicValidationRules {
  const _$DynamicValidationRulesImpl({
    this.minLength,
    this.maxLength,
    this.min,
    this.max,
    this.pattern,
    this.patternMessage,
  }) : super._();

  factory _$DynamicValidationRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicValidationRulesImplFromJson(json);

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
  final String? patternMessage;

  @override
  String toString() {
    return 'DynamicValidationRules(minLength: $minLength, maxLength: $maxLength, min: $min, max: $max, pattern: $pattern, patternMessage: $patternMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicValidationRulesImpl &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.patternMessage, patternMessage) ||
                other.patternMessage == patternMessage));
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
    patternMessage,
  );

  /// Create a copy of DynamicValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicValidationRulesImplCopyWith<_$DynamicValidationRulesImpl>
  get copyWith =>
      __$$DynamicValidationRulesImplCopyWithImpl<_$DynamicValidationRulesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicValidationRulesImplToJson(this);
  }
}

abstract class _DynamicValidationRules extends DynamicValidationRules {
  const factory _DynamicValidationRules({
    final int? minLength,
    final int? maxLength,
    final double? min,
    final double? max,
    final String? pattern,
    final String? patternMessage,
  }) = _$DynamicValidationRulesImpl;
  const _DynamicValidationRules._() : super._();

  factory _DynamicValidationRules.fromJson(Map<String, dynamic> json) =
      _$DynamicValidationRulesImpl.fromJson;

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
  String? get patternMessage;

  /// Create a copy of DynamicValidationRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicValidationRulesImplCopyWith<_$DynamicValidationRulesImpl>
  get copyWith => throw _privateConstructorUsedError;
}
