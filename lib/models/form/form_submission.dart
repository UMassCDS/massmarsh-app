import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_submission.freezed.dart';
part 'form_submission.g.dart';

/// A form submission containing header data and repeating records
@freezed
class FormSubmission with _$FormSubmission {
  const FormSubmission._();
  
  const factory FormSubmission({
    int? id,
    required String localId,
    int? serverId,
    required int orgId,
    required int templateId,
    int? outingId,
    @Default(1) int formVersion,
    required Map<String, dynamic> headerData,
    @Default([]) List<FormSubmissionRecord> records,
    int? createdByUserId,
    @Default('pending') String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FormSubmission;

  factory FormSubmission.fromJson(Map<String, dynamic> json) =>
      _$FormSubmissionFromJson(json);
}

/// A single record within a repeating group of a form submission
@freezed
class FormSubmissionRecord with _$FormSubmissionRecord {
  const FormSubmissionRecord._();
  
  const factory FormSubmissionRecord({
    int? id,
    required String localId,
    int? submissionId,
    /// The group this record belongs to (e.g., 'plot_data', 'species_data')
    required String groupId,
    /// Index within the group (0-based)
    required int recordIndex,
    /// All field values for this record as JSON
    required Map<String, dynamic> data,
    DateTime? createdAt,
  }) = _FormSubmissionRecord;

  factory FormSubmissionRecord.fromJson(Map<String, dynamic> json) =>
      _$FormSubmissionRecordFromJson(json);
}
