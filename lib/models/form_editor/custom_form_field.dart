import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_marsh_app/models/form/form_config.dart';

part 'custom_form_field.freezed.dart';
part 'custom_form_field.g.dart';

@freezed
class CustomFormField with _$CustomFormField {
  const factory CustomFormField({
    int? id,
    required int orgId,
    required String formName, // 'common', 'vegetation', 'hydrology', 'elevation'
    required String fieldId,
    required String fieldLabel,
    required String fieldType,
    @Default(false) bool required,
    ValidationRules? validation,
    List<DropdownOption>? options,
    String? helpText,
    int? orderIndex,
    @Default(true) bool isActive,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomFormField;

  factory CustomFormField.fromJson(Map<String, dynamic> json) =>
      _$CustomFormFieldFromJson(json);
}

@freezed
class FormVersion with _$FormVersion {
  const factory FormVersion({
    int? id,
    required int orgId,
    required String formName,
    required int versionNumber,
    required String configHash,
    int? publishedByUserId,
    DateTime? publishedAt,
    @Default(true) bool isActive,
    String? description,
    DateTime? createdAt,
  }) = _FormVersion;

  factory FormVersion.fromJson(Map<String, dynamic> json) =>
      _$FormVersionFromJson(json);
}
