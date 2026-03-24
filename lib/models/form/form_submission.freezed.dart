// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FormSubmission _$FormSubmissionFromJson(Map<String, dynamic> json) {
  return _FormSubmission.fromJson(json);
}

/// @nodoc
mixin _$FormSubmission {
  int? get id => throw _privateConstructorUsedError;
  String get localId => throw _privateConstructorUsedError;
  int? get serverId => throw _privateConstructorUsedError;
  int get orgId => throw _privateConstructorUsedError;
  int get templateId => throw _privateConstructorUsedError;
  int? get outingId => throw _privateConstructorUsedError;
  int get formVersion => throw _privateConstructorUsedError;
  Map<String, dynamic> get headerData => throw _privateConstructorUsedError;
  List<FormSubmissionRecord> get records => throw _privateConstructorUsedError;
  int? get createdByUserId => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FormSubmission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormSubmissionCopyWith<FormSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormSubmissionCopyWith<$Res> {
  factory $FormSubmissionCopyWith(
    FormSubmission value,
    $Res Function(FormSubmission) then,
  ) = _$FormSubmissionCopyWithImpl<$Res, FormSubmission>;
  @useResult
  $Res call({
    int? id,
    String localId,
    int? serverId,
    int orgId,
    int templateId,
    int? outingId,
    int formVersion,
    Map<String, dynamic> headerData,
    List<FormSubmissionRecord> records,
    int? createdByUserId,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$FormSubmissionCopyWithImpl<$Res, $Val extends FormSubmission>
    implements $FormSubmissionCopyWith<$Res> {
  _$FormSubmissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = null,
    Object? serverId = freezed,
    Object? orgId = null,
    Object? templateId = null,
    Object? outingId = freezed,
    Object? formVersion = null,
    Object? headerData = null,
    Object? records = null,
    Object? createdByUserId = freezed,
    Object? syncStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            localId: null == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String,
            serverId: freezed == serverId
                ? _value.serverId
                : serverId // ignore: cast_nullable_to_non_nullable
                      as int?,
            orgId: null == orgId
                ? _value.orgId
                : orgId // ignore: cast_nullable_to_non_nullable
                      as int,
            templateId: null == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                      as int,
            outingId: freezed == outingId
                ? _value.outingId
                : outingId // ignore: cast_nullable_to_non_nullable
                      as int?,
            formVersion: null == formVersion
                ? _value.formVersion
                : formVersion // ignore: cast_nullable_to_non_nullable
                      as int,
            headerData: null == headerData
                ? _value.headerData
                : headerData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            records: null == records
                ? _value.records
                : records // ignore: cast_nullable_to_non_nullable
                      as List<FormSubmissionRecord>,
            createdByUserId: freezed == createdByUserId
                ? _value.createdByUserId
                : createdByUserId // ignore: cast_nullable_to_non_nullable
                      as int?,
            syncStatus: null == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormSubmissionImplCopyWith<$Res>
    implements $FormSubmissionCopyWith<$Res> {
  factory _$$FormSubmissionImplCopyWith(
    _$FormSubmissionImpl value,
    $Res Function(_$FormSubmissionImpl) then,
  ) = __$$FormSubmissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String localId,
    int? serverId,
    int orgId,
    int templateId,
    int? outingId,
    int formVersion,
    Map<String, dynamic> headerData,
    List<FormSubmissionRecord> records,
    int? createdByUserId,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$FormSubmissionImplCopyWithImpl<$Res>
    extends _$FormSubmissionCopyWithImpl<$Res, _$FormSubmissionImpl>
    implements _$$FormSubmissionImplCopyWith<$Res> {
  __$$FormSubmissionImplCopyWithImpl(
    _$FormSubmissionImpl _value,
    $Res Function(_$FormSubmissionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = null,
    Object? serverId = freezed,
    Object? orgId = null,
    Object? templateId = null,
    Object? outingId = freezed,
    Object? formVersion = null,
    Object? headerData = null,
    Object? records = null,
    Object? createdByUserId = freezed,
    Object? syncStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$FormSubmissionImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as int?,
        orgId: null == orgId
            ? _value.orgId
            : orgId // ignore: cast_nullable_to_non_nullable
                  as int,
        templateId: null == templateId
            ? _value.templateId
            : templateId // ignore: cast_nullable_to_non_nullable
                  as int,
        outingId: freezed == outingId
            ? _value.outingId
            : outingId // ignore: cast_nullable_to_non_nullable
                  as int?,
        formVersion: null == formVersion
            ? _value.formVersion
            : formVersion // ignore: cast_nullable_to_non_nullable
                  as int,
        headerData: null == headerData
            ? _value._headerData
            : headerData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        records: null == records
            ? _value._records
            : records // ignore: cast_nullable_to_non_nullable
                  as List<FormSubmissionRecord>,
        createdByUserId: freezed == createdByUserId
            ? _value.createdByUserId
            : createdByUserId // ignore: cast_nullable_to_non_nullable
                  as int?,
        syncStatus: null == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormSubmissionImpl extends _FormSubmission {
  const _$FormSubmissionImpl({
    this.id,
    required this.localId,
    this.serverId,
    required this.orgId,
    required this.templateId,
    this.outingId,
    this.formVersion = 1,
    required final Map<String, dynamic> headerData,
    final List<FormSubmissionRecord> records = const [],
    this.createdByUserId,
    this.syncStatus = 'pending',
    this.createdAt,
    this.updatedAt,
  }) : _headerData = headerData,
       _records = records,
       super._();

  factory _$FormSubmissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormSubmissionImplFromJson(json);

  @override
  final int? id;
  @override
  final String localId;
  @override
  final int? serverId;
  @override
  final int orgId;
  @override
  final int templateId;
  @override
  final int? outingId;
  @override
  @JsonKey()
  final int formVersion;
  final Map<String, dynamic> _headerData;
  @override
  Map<String, dynamic> get headerData {
    if (_headerData is EqualUnmodifiableMapView) return _headerData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headerData);
  }

  final List<FormSubmissionRecord> _records;
  @override
  @JsonKey()
  List<FormSubmissionRecord> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  final int? createdByUserId;
  @override
  @JsonKey()
  final String syncStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'FormSubmission(id: $id, localId: $localId, serverId: $serverId, orgId: $orgId, templateId: $templateId, outingId: $outingId, formVersion: $formVersion, headerData: $headerData, records: $records, createdByUserId: $createdByUserId, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSubmissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.outingId, outingId) ||
                other.outingId == outingId) &&
            (identical(other.formVersion, formVersion) ||
                other.formVersion == formVersion) &&
            const DeepCollectionEquality().equals(
              other._headerData,
              _headerData,
            ) &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    localId,
    serverId,
    orgId,
    templateId,
    outingId,
    formVersion,
    const DeepCollectionEquality().hash(_headerData),
    const DeepCollectionEquality().hash(_records),
    createdByUserId,
    syncStatus,
    createdAt,
    updatedAt,
  );

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormSubmissionImplCopyWith<_$FormSubmissionImpl> get copyWith =>
      __$$FormSubmissionImplCopyWithImpl<_$FormSubmissionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FormSubmissionImplToJson(this);
  }
}

abstract class _FormSubmission extends FormSubmission {
  const factory _FormSubmission({
    final int? id,
    required final String localId,
    final int? serverId,
    required final int orgId,
    required final int templateId,
    final int? outingId,
    final int formVersion,
    required final Map<String, dynamic> headerData,
    final List<FormSubmissionRecord> records,
    final int? createdByUserId,
    final String syncStatus,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$FormSubmissionImpl;
  const _FormSubmission._() : super._();

  factory _FormSubmission.fromJson(Map<String, dynamic> json) =
      _$FormSubmissionImpl.fromJson;

  @override
  int? get id;
  @override
  String get localId;
  @override
  int? get serverId;
  @override
  int get orgId;
  @override
  int get templateId;
  @override
  int? get outingId;
  @override
  int get formVersion;
  @override
  Map<String, dynamic> get headerData;
  @override
  List<FormSubmissionRecord> get records;
  @override
  int? get createdByUserId;
  @override
  String get syncStatus;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSubmissionImplCopyWith<_$FormSubmissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormSubmissionRecord _$FormSubmissionRecordFromJson(Map<String, dynamic> json) {
  return _FormSubmissionRecord.fromJson(json);
}

/// @nodoc
mixin _$FormSubmissionRecord {
  int? get id => throw _privateConstructorUsedError;
  String get localId => throw _privateConstructorUsedError;
  int? get submissionId => throw _privateConstructorUsedError;

  /// The group this record belongs to (e.g., 'plot_data', 'species_data')
  String get groupId => throw _privateConstructorUsedError;

  /// Index within the group (0-based)
  int get recordIndex => throw _privateConstructorUsedError;

  /// All field values for this record as JSON
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FormSubmissionRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormSubmissionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormSubmissionRecordCopyWith<FormSubmissionRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormSubmissionRecordCopyWith<$Res> {
  factory $FormSubmissionRecordCopyWith(
    FormSubmissionRecord value,
    $Res Function(FormSubmissionRecord) then,
  ) = _$FormSubmissionRecordCopyWithImpl<$Res, FormSubmissionRecord>;
  @useResult
  $Res call({
    int? id,
    String localId,
    int? submissionId,
    String groupId,
    int recordIndex,
    Map<String, dynamic> data,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$FormSubmissionRecordCopyWithImpl<
  $Res,
  $Val extends FormSubmissionRecord
>
    implements $FormSubmissionRecordCopyWith<$Res> {
  _$FormSubmissionRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormSubmissionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = null,
    Object? submissionId = freezed,
    Object? groupId = null,
    Object? recordIndex = null,
    Object? data = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            localId: null == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String,
            submissionId: freezed == submissionId
                ? _value.submissionId
                : submissionId // ignore: cast_nullable_to_non_nullable
                      as int?,
            groupId: null == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                      as String,
            recordIndex: null == recordIndex
                ? _value.recordIndex
                : recordIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormSubmissionRecordImplCopyWith<$Res>
    implements $FormSubmissionRecordCopyWith<$Res> {
  factory _$$FormSubmissionRecordImplCopyWith(
    _$FormSubmissionRecordImpl value,
    $Res Function(_$FormSubmissionRecordImpl) then,
  ) = __$$FormSubmissionRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String localId,
    int? submissionId,
    String groupId,
    int recordIndex,
    Map<String, dynamic> data,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$FormSubmissionRecordImplCopyWithImpl<$Res>
    extends _$FormSubmissionRecordCopyWithImpl<$Res, _$FormSubmissionRecordImpl>
    implements _$$FormSubmissionRecordImplCopyWith<$Res> {
  __$$FormSubmissionRecordImplCopyWithImpl(
    _$FormSubmissionRecordImpl _value,
    $Res Function(_$FormSubmissionRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormSubmissionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = null,
    Object? submissionId = freezed,
    Object? groupId = null,
    Object? recordIndex = null,
    Object? data = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$FormSubmissionRecordImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        submissionId: freezed == submissionId
            ? _value.submissionId
            : submissionId // ignore: cast_nullable_to_non_nullable
                  as int?,
        groupId: null == groupId
            ? _value.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        recordIndex: null == recordIndex
            ? _value.recordIndex
            : recordIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormSubmissionRecordImpl extends _FormSubmissionRecord {
  const _$FormSubmissionRecordImpl({
    this.id,
    required this.localId,
    this.submissionId,
    required this.groupId,
    required this.recordIndex,
    required final Map<String, dynamic> data,
    this.createdAt,
  }) : _data = data,
       super._();

  factory _$FormSubmissionRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormSubmissionRecordImplFromJson(json);

  @override
  final int? id;
  @override
  final String localId;
  @override
  final int? submissionId;

  /// The group this record belongs to (e.g., 'plot_data', 'species_data')
  @override
  final String groupId;

  /// Index within the group (0-based)
  @override
  final int recordIndex;

  /// All field values for this record as JSON
  final Map<String, dynamic> _data;

  /// All field values for this record as JSON
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FormSubmissionRecord(id: $id, localId: $localId, submissionId: $submissionId, groupId: $groupId, recordIndex: $recordIndex, data: $data, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSubmissionRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.submissionId, submissionId) ||
                other.submissionId == submissionId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.recordIndex, recordIndex) ||
                other.recordIndex == recordIndex) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    localId,
    submissionId,
    groupId,
    recordIndex,
    const DeepCollectionEquality().hash(_data),
    createdAt,
  );

  /// Create a copy of FormSubmissionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormSubmissionRecordImplCopyWith<_$FormSubmissionRecordImpl>
  get copyWith =>
      __$$FormSubmissionRecordImplCopyWithImpl<_$FormSubmissionRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FormSubmissionRecordImplToJson(this);
  }
}

abstract class _FormSubmissionRecord extends FormSubmissionRecord {
  const factory _FormSubmissionRecord({
    final int? id,
    required final String localId,
    final int? submissionId,
    required final String groupId,
    required final int recordIndex,
    required final Map<String, dynamic> data,
    final DateTime? createdAt,
  }) = _$FormSubmissionRecordImpl;
  const _FormSubmissionRecord._() : super._();

  factory _FormSubmissionRecord.fromJson(Map<String, dynamic> json) =
      _$FormSubmissionRecordImpl.fromJson;

  @override
  int? get id;
  @override
  String get localId;
  @override
  int? get submissionId;

  /// The group this record belongs to (e.g., 'plot_data', 'species_data')
  @override
  String get groupId;

  /// Index within the group (0-based)
  @override
  int get recordIndex;

  /// All field values for this record as JSON
  @override
  Map<String, dynamic> get data;
  @override
  DateTime? get createdAt;

  /// Create a copy of FormSubmissionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSubmissionRecordImplCopyWith<_$FormSubmissionRecordImpl>
  get copyWith => throw _privateConstructorUsedError;
}
