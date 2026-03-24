// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_form_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrgFormTemplateImpl _$$OrgFormTemplateImplFromJson(
  Map<String, dynamic> json,
) => _$OrgFormTemplateImpl(
  id: (json['id'] as num?)?.toInt(),
  orgId: (json['orgId'] as num).toInt(),
  templateId: (json['templateId'] as num).toInt(),
  customizations: json['customizations'] as Map<String, dynamic>?,
  isEnabled: json['isEnabled'] as bool? ?? true,
  enabledAt: json['enabledAt'] == null
      ? null
      : DateTime.parse(json['enabledAt'] as String),
  template: json['template'] == null
      ? null
      : FormTemplate.fromJson(json['template'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$OrgFormTemplateImplToJson(
  _$OrgFormTemplateImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'orgId': instance.orgId,
  'templateId': instance.templateId,
  'customizations': instance.customizations,
  'isEnabled': instance.isEnabled,
  'enabledAt': instance.enabledAt?.toIso8601String(),
  'template': instance.template,
};

_$TemplateCustomizationImpl _$$TemplateCustomizationImplFromJson(
  Map<String, dynamic> json,
) => _$TemplateCustomizationImpl(
  hiddenFields:
      (json['hiddenFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  labelOverrides:
      (json['labelOverrides'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  defaultOverrides:
      (json['defaultOverrides'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  requiredOverrides:
      (json['requiredOverrides'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ) ??
      const {},
);

Map<String, dynamic> _$$TemplateCustomizationImplToJson(
  _$TemplateCustomizationImpl instance,
) => <String, dynamic>{
  'hiddenFields': instance.hiddenFields,
  'labelOverrides': instance.labelOverrides,
  'defaultOverrides': instance.defaultOverrides,
  'requiredOverrides': instance.requiredOverrides,
};
