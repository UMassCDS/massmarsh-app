// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormSubmissionImpl _$$FormSubmissionImplFromJson(Map<String, dynamic> json) =>
    _$FormSubmissionImpl(
      id: (json['id'] as num?)?.toInt(),
      orgId: (json['orgId'] as num).toInt(),
      formType: json['formType'] as String,
      data: json['data'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      synced: json['synced'] as bool? ?? false,
      syncedAt: json['syncedAt'] == null
          ? null
          : DateTime.parse(json['syncedAt'] as String),
    );

Map<String, dynamic> _$$FormSubmissionImplToJson(
  _$FormSubmissionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'orgId': instance.orgId,
  'formType': instance.formType,
  'data': instance.data,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'synced': instance.synced,
  'syncedAt': instance.syncedAt?.toIso8601String(),
};
