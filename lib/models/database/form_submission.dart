import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_submission.freezed.dart';
part 'form_submission.g.dart';

@freezed
class FormSubmission with _$FormSubmission {
  const factory FormSubmission({
    required int? id,
    required int orgId,
    required String formType, // 'common', 'vegetation', 'hydrology', 'elevation'
    required Map<String, dynamic> data,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool synced,
    DateTime? syncedAt,
  }) = _FormSubmission;

  factory FormSubmission.fromJson(Map<String, dynamic> json) =>
      _$FormSubmissionFromJson(json);
}
