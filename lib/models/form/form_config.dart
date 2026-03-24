import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_config.freezed.dart';
part 'form_config.g.dart';

@freezed
class FormConfig with _$FormConfig {
  const factory FormConfig({
    required int orgId,
    required String configVersion,
    required String configHash,
    required CommonFormConfig commonForm,
    required VegetationFormConfig vegetationForm,
    required HydrologyFormConfig hydrologyForm,
    required ElevationFormConfig elevationForm,
    required DateTime downloadedAt,
    DateTime? lastValidatedAt,
  }) = _FormConfig;

  factory FormConfig.fromJson(Map<String, dynamic> json) =>
      _$FormConfigFromJson(json);
}

@freezed
class CommonFormConfig with _$CommonFormConfig {
  const factory CommonFormConfig({
    required String version,
    required List<FormFieldDef> fields,
  }) = _CommonFormConfig;

  factory CommonFormConfig.fromJson(Map<String, dynamic> json) =>
      _$CommonFormConfigFromJson(json);
}

@freezed
class VegetationFormConfig with _$VegetationFormConfig {
  const factory VegetationFormConfig({
    required String version,
    required RepeatingGroupDef repeatingGroup,
  }) = _VegetationFormConfig;

  factory VegetationFormConfig.fromJson(Map<String, dynamic> json) =>
      _$VegetationFormConfigFromJson(json);
}

@freezed
class HydrologyFormConfig with _$HydrologyFormConfig {
  const factory HydrologyFormConfig({
    required String version,
    required List<FormFieldDef> fields,
  }) = _HydrologyFormConfig;

  factory HydrologyFormConfig.fromJson(Map<String, dynamic> json) =>
      _$HydrologyFormConfigFromJson(json);
}

@freezed
class ElevationFormConfig with _$ElevationFormConfig {
  const factory ElevationFormConfig({
    required String version,
    required RepeatingGroupDef repeatingGroup,
  }) = _ElevationFormConfig;

  factory ElevationFormConfig.fromJson(Map<String, dynamic> json) =>
      _$ElevationFormConfigFromJson(json);
}

@freezed
class RepeatingGroupDef with _$RepeatingGroupDef {
  const factory RepeatingGroupDef({
    required String id,
    required String name,
    required List<FormFieldDef> fields,
    int? minItems,
    int? maxItems,
  }) = _RepeatingGroupDef;

  factory RepeatingGroupDef.fromJson(Map<String, dynamic> json) =>
      _$RepeatingGroupDefFromJson(json);
}

@freezed
class FormFieldDef with _$FormFieldDef {
  const factory FormFieldDef({
    required String id,
    required String name,
    required String type,
    @Default(false) bool required,
    ValidationRules? validation,
    List<DropdownOption>? options,
    String? dataSource,
    List<FormFieldDef>? nestedFields,
    int? minItems,
    int? maxItems,
    String? section,
    String? helpText,
  }) = _FormFieldDef;

  factory FormFieldDef.fromJson(Map<String, dynamic> json) =>
      _$FormFieldDefFromJson(json);
}

@freezed
class ValidationRules with _$ValidationRules {
  const factory ValidationRules({
    int? minLength,
    int? maxLength,
    double? min,
    double? max,
    String? pattern,
    int? maxSizeKb,
    List<String>? formats,
  }) = _ValidationRules;

  factory ValidationRules.fromJson(Map<String, dynamic> json) =>
      _$ValidationRulesFromJson(json);
}

@freezed
class DropdownOption with _$DropdownOption {
  const factory DropdownOption({
    required String value,
    required String label,
  }) = _DropdownOption;

  factory DropdownOption.fromJson(Map<String, dynamic> json) =>
      _$DropdownOptionFromJson(json);
}
