// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormTemplateImpl _$$FormTemplateImplFromJson(Map<String, dynamic> json) =>
    _$FormTemplateImpl(
      id: (json['id'] as num?)?.toInt(),
      templateCode: json['templateCode'] as String,
      templateName: json['templateName'] as String,
      description: json['description'] as String?,
      monitoringType: json['monitoringType'] as String,
      schema: FormSchema.fromJson(json['schema'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FormTemplateImplToJson(_$FormTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'templateCode': instance.templateCode,
      'templateName': instance.templateName,
      'description': instance.description,
      'monitoringType': instance.monitoringType,
      'schema': instance.schema,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$FormSchemaImpl _$$FormSchemaImplFromJson(Map<String, dynamic> json) =>
    _$FormSchemaImpl(
      version: json['version'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => FormSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FormSchemaImplToJson(_$FormSchemaImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'sections': instance.sections,
    };

_$FormSectionImpl _$$FormSectionImplFromJson(Map<String, dynamic> json) =>
    _$FormSectionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => DynamicFormField.fromJson(e as Map<String, dynamic>))
          .toList(),
      minItems: (json['minItems'] as num?)?.toInt(),
      maxItems: (json['maxItems'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FormSectionImplToJson(_$FormSectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'fields': instance.fields,
      'minItems': instance.minItems,
      'maxItems': instance.maxItems,
    };

_$DynamicFormFieldImpl _$$DynamicFormFieldImplFromJson(
  Map<String, dynamic> json,
) => _$DynamicFormFieldImpl(
  id: json['id'] as String,
  label: json['label'] as String,
  type: json['type'] as String,
  required: json['required'] as bool? ?? false,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  dataSource: json['dataSource'] as String?,
  format: json['format'] as String?,
  defaultValue: json['defaultValue'] as String?,
  validation: json['validation'] == null
      ? null
      : DynamicValidationRules.fromJson(
          json['validation'] as Map<String, dynamic>,
        ),
  helpText: json['helpText'] as String?,
  nestedFields: (json['nestedFields'] as List<dynamic>?)
      ?.map((e) => DynamicFormField.fromJson(e as Map<String, dynamic>))
      .toList(),
  minItems: (json['minItems'] as num?)?.toInt(),
  maxItems: (json['maxItems'] as num?)?.toInt(),
  orderIndex: (json['orderIndex'] as num?)?.toInt(),
);

Map<String, dynamic> _$$DynamicFormFieldImplToJson(
  _$DynamicFormFieldImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'type': instance.type,
  'required': instance.required,
  'options': instance.options,
  'dataSource': instance.dataSource,
  'format': instance.format,
  'defaultValue': instance.defaultValue,
  'validation': instance.validation,
  'helpText': instance.helpText,
  'nestedFields': instance.nestedFields,
  'minItems': instance.minItems,
  'maxItems': instance.maxItems,
  'orderIndex': instance.orderIndex,
};

_$DynamicValidationRulesImpl _$$DynamicValidationRulesImplFromJson(
  Map<String, dynamic> json,
) => _$DynamicValidationRulesImpl(
  minLength: (json['minLength'] as num?)?.toInt(),
  maxLength: (json['maxLength'] as num?)?.toInt(),
  min: (json['min'] as num?)?.toDouble(),
  max: (json['max'] as num?)?.toDouble(),
  pattern: json['pattern'] as String?,
  patternMessage: json['patternMessage'] as String?,
);

Map<String, dynamic> _$$DynamicValidationRulesImplToJson(
  _$DynamicValidationRulesImpl instance,
) => <String, dynamic>{
  'minLength': instance.minLength,
  'maxLength': instance.maxLength,
  'min': instance.min,
  'max': instance.max,
  'pattern': instance.pattern,
  'patternMessage': instance.patternMessage,
};
