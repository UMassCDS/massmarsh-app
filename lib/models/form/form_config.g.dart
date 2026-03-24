// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormConfigImpl _$$FormConfigImplFromJson(Map<String, dynamic> json) =>
    _$FormConfigImpl(
      orgId: (json['orgId'] as num).toInt(),
      configVersion: json['configVersion'] as String,
      configHash: json['configHash'] as String,
      commonForm: CommonFormConfig.fromJson(
        json['commonForm'] as Map<String, dynamic>,
      ),
      vegetationForm: VegetationFormConfig.fromJson(
        json['vegetationForm'] as Map<String, dynamic>,
      ),
      hydrologyForm: HydrologyFormConfig.fromJson(
        json['hydrologyForm'] as Map<String, dynamic>,
      ),
      elevationForm: ElevationFormConfig.fromJson(
        json['elevationForm'] as Map<String, dynamic>,
      ),
      downloadedAt: DateTime.parse(json['downloadedAt'] as String),
      lastValidatedAt: json['lastValidatedAt'] == null
          ? null
          : DateTime.parse(json['lastValidatedAt'] as String),
    );

Map<String, dynamic> _$$FormConfigImplToJson(_$FormConfigImpl instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'configVersion': instance.configVersion,
      'configHash': instance.configHash,
      'commonForm': instance.commonForm,
      'vegetationForm': instance.vegetationForm,
      'hydrologyForm': instance.hydrologyForm,
      'elevationForm': instance.elevationForm,
      'downloadedAt': instance.downloadedAt.toIso8601String(),
      'lastValidatedAt': instance.lastValidatedAt?.toIso8601String(),
    };

_$CommonFormConfigImpl _$$CommonFormConfigImplFromJson(
  Map<String, dynamic> json,
) => _$CommonFormConfigImpl(
  version: json['version'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FormFieldDef.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CommonFormConfigImplToJson(
  _$CommonFormConfigImpl instance,
) => <String, dynamic>{'version': instance.version, 'fields': instance.fields};

_$VegetationFormConfigImpl _$$VegetationFormConfigImplFromJson(
  Map<String, dynamic> json,
) => _$VegetationFormConfigImpl(
  version: json['version'] as String,
  repeatingGroup: RepeatingGroupDef.fromJson(
    json['repeatingGroup'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$VegetationFormConfigImplToJson(
  _$VegetationFormConfigImpl instance,
) => <String, dynamic>{
  'version': instance.version,
  'repeatingGroup': instance.repeatingGroup,
};

_$HydrologyFormConfigImpl _$$HydrologyFormConfigImplFromJson(
  Map<String, dynamic> json,
) => _$HydrologyFormConfigImpl(
  version: json['version'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FormFieldDef.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$HydrologyFormConfigImplToJson(
  _$HydrologyFormConfigImpl instance,
) => <String, dynamic>{'version': instance.version, 'fields': instance.fields};

_$ElevationFormConfigImpl _$$ElevationFormConfigImplFromJson(
  Map<String, dynamic> json,
) => _$ElevationFormConfigImpl(
  version: json['version'] as String,
  repeatingGroup: RepeatingGroupDef.fromJson(
    json['repeatingGroup'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$ElevationFormConfigImplToJson(
  _$ElevationFormConfigImpl instance,
) => <String, dynamic>{
  'version': instance.version,
  'repeatingGroup': instance.repeatingGroup,
};

_$RepeatingGroupDefImpl _$$RepeatingGroupDefImplFromJson(
  Map<String, dynamic> json,
) => _$RepeatingGroupDefImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FormFieldDef.fromJson(e as Map<String, dynamic>))
      .toList(),
  minItems: (json['minItems'] as num?)?.toInt(),
  maxItems: (json['maxItems'] as num?)?.toInt(),
);

Map<String, dynamic> _$$RepeatingGroupDefImplToJson(
  _$RepeatingGroupDefImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'fields': instance.fields,
  'minItems': instance.minItems,
  'maxItems': instance.maxItems,
};

_$FormFieldDefImpl _$$FormFieldDefImplFromJson(Map<String, dynamic> json) =>
    _$FormFieldDefImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      required: json['required'] as bool? ?? false,
      validation: json['validation'] == null
          ? null
          : ValidationRules.fromJson(
              json['validation'] as Map<String, dynamic>,
            ),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => DropdownOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSource: json['dataSource'] as String?,
      nestedFields: (json['nestedFields'] as List<dynamic>?)
          ?.map((e) => FormFieldDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      minItems: (json['minItems'] as num?)?.toInt(),
      maxItems: (json['maxItems'] as num?)?.toInt(),
      section: json['section'] as String?,
      helpText: json['helpText'] as String?,
    );

Map<String, dynamic> _$$FormFieldDefImplToJson(_$FormFieldDefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'required': instance.required,
      'validation': instance.validation,
      'options': instance.options,
      'dataSource': instance.dataSource,
      'nestedFields': instance.nestedFields,
      'minItems': instance.minItems,
      'maxItems': instance.maxItems,
      'section': instance.section,
      'helpText': instance.helpText,
    };

_$ValidationRulesImpl _$$ValidationRulesImplFromJson(
  Map<String, dynamic> json,
) => _$ValidationRulesImpl(
  minLength: (json['minLength'] as num?)?.toInt(),
  maxLength: (json['maxLength'] as num?)?.toInt(),
  min: (json['min'] as num?)?.toDouble(),
  max: (json['max'] as num?)?.toDouble(),
  pattern: json['pattern'] as String?,
  maxSizeKb: (json['maxSizeKb'] as num?)?.toInt(),
  formats: (json['formats'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$ValidationRulesImplToJson(
  _$ValidationRulesImpl instance,
) => <String, dynamic>{
  'minLength': instance.minLength,
  'maxLength': instance.maxLength,
  'min': instance.min,
  'max': instance.max,
  'pattern': instance.pattern,
  'maxSizeKb': instance.maxSizeKb,
  'formats': instance.formats,
};

_$DropdownOptionImpl _$$DropdownOptionImplFromJson(Map<String, dynamic> json) =>
    _$DropdownOptionImpl(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$DropdownOptionImplToJson(
  _$DropdownOptionImpl instance,
) => <String, dynamic>{'value': instance.value, 'label': instance.label};
