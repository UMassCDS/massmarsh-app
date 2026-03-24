// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_form_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomFormFieldImpl _$$CustomFormFieldImplFromJson(
  Map<String, dynamic> json,
) => _$CustomFormFieldImpl(
  id: (json['id'] as num?)?.toInt(),
  orgId: (json['orgId'] as num).toInt(),
  formName: json['formName'] as String,
  fieldId: json['fieldId'] as String,
  fieldLabel: json['fieldLabel'] as String,
  fieldType: json['fieldType'] as String,
  required: json['required'] as bool? ?? false,
  validation: json['validation'] == null
      ? null
      : ValidationRules.fromJson(json['validation'] as Map<String, dynamic>),
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => DropdownOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  helpText: json['helpText'] as String?,
  orderIndex: (json['orderIndex'] as num?)?.toInt(),
  isActive: json['isActive'] as bool? ?? true,
  createdByUserId: (json['createdByUserId'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$CustomFormFieldImplToJson(
  _$CustomFormFieldImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'orgId': instance.orgId,
  'formName': instance.formName,
  'fieldId': instance.fieldId,
  'fieldLabel': instance.fieldLabel,
  'fieldType': instance.fieldType,
  'required': instance.required,
  'validation': instance.validation,
  'options': instance.options,
  'helpText': instance.helpText,
  'orderIndex': instance.orderIndex,
  'isActive': instance.isActive,
  'createdByUserId': instance.createdByUserId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_$FormVersionImpl _$$FormVersionImplFromJson(Map<String, dynamic> json) =>
    _$FormVersionImpl(
      id: (json['id'] as num?)?.toInt(),
      orgId: (json['orgId'] as num).toInt(),
      formName: json['formName'] as String,
      versionNumber: (json['versionNumber'] as num).toInt(),
      configHash: json['configHash'] as String,
      publishedByUserId: (json['publishedByUserId'] as num?)?.toInt(),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      isActive: json['isActive'] as bool? ?? true,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FormVersionImplToJson(_$FormVersionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orgId': instance.orgId,
      'formName': instance.formName,
      'versionNumber': instance.versionNumber,
      'configHash': instance.configHash,
      'publishedByUserId': instance.publishedByUserId,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
