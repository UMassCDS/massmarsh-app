import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_template.freezed.dart';
part 'form_template.g.dart';

/// Base form template that organizations can enable and customize
@freezed
class FormTemplate with _$FormTemplate {
  const FormTemplate._();
  
  const factory FormTemplate({
    int? id,
    required String templateCode,
    required String templateName,
    String? description,
    required String monitoringType,
    required FormSchema schema,
    @Default(true) bool isActive,
    DateTime? createdAt,
  }) = _FormTemplate;

  factory FormTemplate.fromJson(Map<String, dynamic> json) =>
      _$FormTemplateFromJson(json);
}

/// Schema definition for a form template
@freezed
class FormSchema with _$FormSchema {
  const FormSchema._();
  
  const factory FormSchema({
    required String version,
    required List<FormSection> sections,
  }) = _FormSchema;

  factory FormSchema.fromJson(Map<String, dynamic> json) =>
      _$FormSchemaFromJson(json);
}

/// A section within a form (header or repeating group)
@freezed
class FormSection with _$FormSection {
  const FormSection._();
  
  const factory FormSection({
    required String id,
    required String name,
    /// 'header' for single-entry sections, 'repeating_group' for multiple entries
    required String type,
    required List<DynamicFormField> fields,
    /// Minimum number of entries (for repeating groups)
    int? minItems,
    /// Maximum number of entries (for repeating groups)
    int? maxItems,
  }) = _FormSection;

  factory FormSection.fromJson(Map<String, dynamic> json) =>
      _$FormSectionFromJson(json);
}

/// Dynamic field definition that can represent any form field type
@freezed
class DynamicFormField with _$DynamicFormField {
  const DynamicFormField._();
  
  const factory DynamicFormField({
    required String id,
    required String label,
    /// Field type: text, number, decimal, dropdown, date, time, gps,
    /// percentage, species_lookup, multiline_text, nested_repeating, photo
    required String type,
    @Default(false) bool required,
    /// Dropdown options for 'dropdown' type
    List<String>? options,
    /// Reference to data source (e.g., 'species_lookup' table)
    String? dataSource,
    /// Date/time format string
    String? format,
    /// Default value
    String? defaultValue,
    /// Validation rules
    DynamicValidationRules? validation,
    /// Help text shown to user
    String? helpText,
    /// Nested fields for 'nested_repeating' type
    List<DynamicFormField>? nestedFields,
    /// Min/max items for nested repeating fields
    int? minItems,
    int? maxItems,
    /// Display order
    int? orderIndex,
  }) = _DynamicFormField;

  factory DynamicFormField.fromJson(Map<String, dynamic> json) =>
      _$DynamicFormFieldFromJson(json);
}

/// Validation rules for dynamic form fields
@freezed
class DynamicValidationRules with _$DynamicValidationRules {
  const DynamicValidationRules._();
  
  const factory DynamicValidationRules({
    int? minLength,
    int? maxLength,
    double? min,
    double? max,
    String? pattern,
    String? patternMessage,
  }) = _DynamicValidationRules;

  factory DynamicValidationRules.fromJson(Map<String, dynamic> json) =>
      _$DynamicValidationRulesFromJson(json);
}
