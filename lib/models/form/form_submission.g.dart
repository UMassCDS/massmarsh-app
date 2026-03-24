// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormSubmissionImpl _$$FormSubmissionImplFromJson(Map<String, dynamic> json) =>
    _$FormSubmissionImpl(
      id: (json['id'] as num?)?.toInt(),
      localId: json['localId'] as String,
      serverId: (json['serverId'] as num?)?.toInt(),
      orgId: (json['orgId'] as num).toInt(),
      templateId: (json['templateId'] as num).toInt(),
      outingId: (json['outingId'] as num?)?.toInt(),
      formVersion: (json['formVersion'] as num?)?.toInt() ?? 1,
      headerData: json['headerData'] as Map<String, dynamic>,
      records:
          (json['records'] as List<dynamic>?)
              ?.map(
                (e) => FormSubmissionRecord.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdByUserId: (json['createdByUserId'] as num?)?.toInt(),
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FormSubmissionImplToJson(
  _$FormSubmissionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'serverId': instance.serverId,
  'orgId': instance.orgId,
  'templateId': instance.templateId,
  'outingId': instance.outingId,
  'formVersion': instance.formVersion,
  'headerData': instance.headerData,
  'records': instance.records,
  'createdByUserId': instance.createdByUserId,
  'syncStatus': instance.syncStatus,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_$FormSubmissionRecordImpl _$$FormSubmissionRecordImplFromJson(
  Map<String, dynamic> json,
) => _$FormSubmissionRecordImpl(
  id: (json['id'] as num?)?.toInt(),
  localId: json['localId'] as String,
  submissionId: (json['submissionId'] as num?)?.toInt(),
  groupId: json['groupId'] as String,
  recordIndex: (json['recordIndex'] as num).toInt(),
  data: json['data'] as Map<String, dynamic>,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$FormSubmissionRecordImplToJson(
  _$FormSubmissionRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'submissionId': instance.submissionId,
  'groupId': instance.groupId,
  'recordIndex': instance.recordIndex,
  'data': instance.data,
  'createdAt': instance.createdAt?.toIso8601String(),
};
