import 'package:freezed_annotation/freezed_annotation.dart';
import 'form_template.dart';

part 'org_form_template.freezed.dart';
part 'org_form_template.g.dart';

/// Links an organization to a form template with optional customizations
@freezed
class OrgFormTemplate with _$OrgFormTemplate {
  const OrgFormTemplate._();
  
  const factory OrgFormTemplate({
    int? id,
    required int orgId,
    required int templateId,
    /// Organization-specific customizations (field visibility, label overrides, etc.)
    Map<String, dynamic>? customizations,
    @Default(true) bool isEnabled,
    DateTime? enabledAt,
    /// The base template (joined data, not stored in this table)
    FormTemplate? template,
  }) = _OrgFormTemplate;

  factory OrgFormTemplate.fromJson(Map<String, dynamic> json) =>
      _$OrgFormTemplateFromJson(json);
}

/// Customization options that can be applied per-organization
@freezed
class TemplateCustomization with _$TemplateCustomization {
  const TemplateCustomization._();
  
  const factory TemplateCustomization({
    /// Fields to hide (list of field IDs)
    @Default([]) List<String> hiddenFields,
    /// Label overrides (field ID -> new label)
    @Default({}) Map<String, String> labelOverrides,
    /// Default value overrides (field ID -> default value)
    @Default({}) Map<String, String> defaultOverrides,
    /// Required field overrides (field ID -> required status)
    @Default({}) Map<String, bool> requiredOverrides,
  }) = _TemplateCustomization;

  factory TemplateCustomization.fromJson(Map<String, dynamic> json) =>
      _$TemplateCustomizationFromJson(json);
}
