// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hydrology_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HydrologyRecord _$HydrologyRecordFromJson(Map<String, dynamic> json) {
  return _HydrologyRecord.fromJson(json);
}

/// @nodoc
mixin _$HydrologyRecord {
  int? get id => throw _privateConstructorUsedError;
  String? get localId => throw _privateConstructorUsedError;
  int? get serverId => throw _privateConstructorUsedError;
  int get outingId => throw _privateConstructorUsedError;
  String? get areaTreatment => throw _privateConstructorUsedError;
  String? get wlrType => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;
  String get elevationWaypointType =>
      throw _privateConstructorUsedError; // RTK or GTS
  int get waypointNumber => throw _privateConstructorUsedError;
  int get rtkElevationNavd88M => throw _privateConstructorUsedError;
  String? get timeWaterElevationTaken => throw _privateConstructorUsedError;
  double? get waterAboveBelowNutM => throw _privateConstructorUsedError;
  double? get wellRimToWaterM => throw _privateConstructorUsedError;
  double? get wellRimToMarshM => throw _privateConstructorUsedError;
  double? get wellRimToSensorM => throw _privateConstructorUsedError;
  double? get wellLengthM => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HydrologyRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HydrologyRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HydrologyRecordCopyWith<HydrologyRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HydrologyRecordCopyWith<$Res> {
  factory $HydrologyRecordCopyWith(
    HydrologyRecord value,
    $Res Function(HydrologyRecord) then,
  ) = _$HydrologyRecordCopyWithImpl<$Res, HydrologyRecord>;
  @useResult
  $Res call({
    int? id,
    String? localId,
    int? serverId,
    int outingId,
    String? areaTreatment,
    String? wlrType,
    String? serialNumber,
    String elevationWaypointType,
    int waypointNumber,
    int rtkElevationNavd88M,
    String? timeWaterElevationTaken,
    double? waterAboveBelowNutM,
    double? wellRimToWaterM,
    double? wellRimToMarshM,
    double? wellRimToSensorM,
    double? wellLengthM,
    String? notes,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$HydrologyRecordCopyWithImpl<$Res, $Val extends HydrologyRecord>
    implements $HydrologyRecordCopyWith<$Res> {
  _$HydrologyRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HydrologyRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? serverId = freezed,
    Object? outingId = null,
    Object? areaTreatment = freezed,
    Object? wlrType = freezed,
    Object? serialNumber = freezed,
    Object? elevationWaypointType = null,
    Object? waypointNumber = null,
    Object? rtkElevationNavd88M = null,
    Object? timeWaterElevationTaken = freezed,
    Object? waterAboveBelowNutM = freezed,
    Object? wellRimToWaterM = freezed,
    Object? wellRimToMarshM = freezed,
    Object? wellRimToSensorM = freezed,
    Object? wellLengthM = freezed,
    Object? notes = freezed,
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
            localId: freezed == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String?,
            serverId: freezed == serverId
                ? _value.serverId
                : serverId // ignore: cast_nullable_to_non_nullable
                      as int?,
            outingId: null == outingId
                ? _value.outingId
                : outingId // ignore: cast_nullable_to_non_nullable
                      as int,
            areaTreatment: freezed == areaTreatment
                ? _value.areaTreatment
                : areaTreatment // ignore: cast_nullable_to_non_nullable
                      as String?,
            wlrType: freezed == wlrType
                ? _value.wlrType
                : wlrType // ignore: cast_nullable_to_non_nullable
                      as String?,
            serialNumber: freezed == serialNumber
                ? _value.serialNumber
                : serialNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            elevationWaypointType: null == elevationWaypointType
                ? _value.elevationWaypointType
                : elevationWaypointType // ignore: cast_nullable_to_non_nullable
                      as String,
            waypointNumber: null == waypointNumber
                ? _value.waypointNumber
                : waypointNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            rtkElevationNavd88M: null == rtkElevationNavd88M
                ? _value.rtkElevationNavd88M
                : rtkElevationNavd88M // ignore: cast_nullable_to_non_nullable
                      as int,
            timeWaterElevationTaken: freezed == timeWaterElevationTaken
                ? _value.timeWaterElevationTaken
                : timeWaterElevationTaken // ignore: cast_nullable_to_non_nullable
                      as String?,
            waterAboveBelowNutM: freezed == waterAboveBelowNutM
                ? _value.waterAboveBelowNutM
                : waterAboveBelowNutM // ignore: cast_nullable_to_non_nullable
                      as double?,
            wellRimToWaterM: freezed == wellRimToWaterM
                ? _value.wellRimToWaterM
                : wellRimToWaterM // ignore: cast_nullable_to_non_nullable
                      as double?,
            wellRimToMarshM: freezed == wellRimToMarshM
                ? _value.wellRimToMarshM
                : wellRimToMarshM // ignore: cast_nullable_to_non_nullable
                      as double?,
            wellRimToSensorM: freezed == wellRimToSensorM
                ? _value.wellRimToSensorM
                : wellRimToSensorM // ignore: cast_nullable_to_non_nullable
                      as double?,
            wellLengthM: freezed == wellLengthM
                ? _value.wellLengthM
                : wellLengthM // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$HydrologyRecordImplCopyWith<$Res>
    implements $HydrologyRecordCopyWith<$Res> {
  factory _$$HydrologyRecordImplCopyWith(
    _$HydrologyRecordImpl value,
    $Res Function(_$HydrologyRecordImpl) then,
  ) = __$$HydrologyRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? localId,
    int? serverId,
    int outingId,
    String? areaTreatment,
    String? wlrType,
    String? serialNumber,
    String elevationWaypointType,
    int waypointNumber,
    int rtkElevationNavd88M,
    String? timeWaterElevationTaken,
    double? waterAboveBelowNutM,
    double? wellRimToWaterM,
    double? wellRimToMarshM,
    double? wellRimToSensorM,
    double? wellLengthM,
    String? notes,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$HydrologyRecordImplCopyWithImpl<$Res>
    extends _$HydrologyRecordCopyWithImpl<$Res, _$HydrologyRecordImpl>
    implements _$$HydrologyRecordImplCopyWith<$Res> {
  __$$HydrologyRecordImplCopyWithImpl(
    _$HydrologyRecordImpl _value,
    $Res Function(_$HydrologyRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HydrologyRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? serverId = freezed,
    Object? outingId = null,
    Object? areaTreatment = freezed,
    Object? wlrType = freezed,
    Object? serialNumber = freezed,
    Object? elevationWaypointType = null,
    Object? waypointNumber = null,
    Object? rtkElevationNavd88M = null,
    Object? timeWaterElevationTaken = freezed,
    Object? waterAboveBelowNutM = freezed,
    Object? wellRimToWaterM = freezed,
    Object? wellRimToMarshM = freezed,
    Object? wellRimToSensorM = freezed,
    Object? wellLengthM = freezed,
    Object? notes = freezed,
    Object? syncStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$HydrologyRecordImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        localId: freezed == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String?,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as int?,
        outingId: null == outingId
            ? _value.outingId
            : outingId // ignore: cast_nullable_to_non_nullable
                  as int,
        areaTreatment: freezed == areaTreatment
            ? _value.areaTreatment
            : areaTreatment // ignore: cast_nullable_to_non_nullable
                  as String?,
        wlrType: freezed == wlrType
            ? _value.wlrType
            : wlrType // ignore: cast_nullable_to_non_nullable
                  as String?,
        serialNumber: freezed == serialNumber
            ? _value.serialNumber
            : serialNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        elevationWaypointType: null == elevationWaypointType
            ? _value.elevationWaypointType
            : elevationWaypointType // ignore: cast_nullable_to_non_nullable
                  as String,
        waypointNumber: null == waypointNumber
            ? _value.waypointNumber
            : waypointNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        rtkElevationNavd88M: null == rtkElevationNavd88M
            ? _value.rtkElevationNavd88M
            : rtkElevationNavd88M // ignore: cast_nullable_to_non_nullable
                  as int,
        timeWaterElevationTaken: freezed == timeWaterElevationTaken
            ? _value.timeWaterElevationTaken
            : timeWaterElevationTaken // ignore: cast_nullable_to_non_nullable
                  as String?,
        waterAboveBelowNutM: freezed == waterAboveBelowNutM
            ? _value.waterAboveBelowNutM
            : waterAboveBelowNutM // ignore: cast_nullable_to_non_nullable
                  as double?,
        wellRimToWaterM: freezed == wellRimToWaterM
            ? _value.wellRimToWaterM
            : wellRimToWaterM // ignore: cast_nullable_to_non_nullable
                  as double?,
        wellRimToMarshM: freezed == wellRimToMarshM
            ? _value.wellRimToMarshM
            : wellRimToMarshM // ignore: cast_nullable_to_non_nullable
                  as double?,
        wellRimToSensorM: freezed == wellRimToSensorM
            ? _value.wellRimToSensorM
            : wellRimToSensorM // ignore: cast_nullable_to_non_nullable
                  as double?,
        wellLengthM: freezed == wellLengthM
            ? _value.wellLengthM
            : wellLengthM // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$HydrologyRecordImpl implements _HydrologyRecord {
  const _$HydrologyRecordImpl({
    this.id,
    this.localId,
    this.serverId,
    required this.outingId,
    this.areaTreatment,
    this.wlrType,
    this.serialNumber,
    required this.elevationWaypointType,
    required this.waypointNumber,
    required this.rtkElevationNavd88M,
    this.timeWaterElevationTaken,
    this.waterAboveBelowNutM,
    this.wellRimToWaterM,
    this.wellRimToMarshM,
    this.wellRimToSensorM,
    this.wellLengthM,
    this.notes,
    this.syncStatus = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  factory _$HydrologyRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$HydrologyRecordImplFromJson(json);

  @override
  final int? id;
  @override
  final String? localId;
  @override
  final int? serverId;
  @override
  final int outingId;
  @override
  final String? areaTreatment;
  @override
  final String? wlrType;
  @override
  final String? serialNumber;
  @override
  final String elevationWaypointType;
  // RTK or GTS
  @override
  final int waypointNumber;
  @override
  final int rtkElevationNavd88M;
  @override
  final String? timeWaterElevationTaken;
  @override
  final double? waterAboveBelowNutM;
  @override
  final double? wellRimToWaterM;
  @override
  final double? wellRimToMarshM;
  @override
  final double? wellRimToSensorM;
  @override
  final double? wellLengthM;
  @override
  final String? notes;
  @override
  @JsonKey()
  final String syncStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'HydrologyRecord(id: $id, localId: $localId, serverId: $serverId, outingId: $outingId, areaTreatment: $areaTreatment, wlrType: $wlrType, serialNumber: $serialNumber, elevationWaypointType: $elevationWaypointType, waypointNumber: $waypointNumber, rtkElevationNavd88M: $rtkElevationNavd88M, timeWaterElevationTaken: $timeWaterElevationTaken, waterAboveBelowNutM: $waterAboveBelowNutM, wellRimToWaterM: $wellRimToWaterM, wellRimToMarshM: $wellRimToMarshM, wellRimToSensorM: $wellRimToSensorM, wellLengthM: $wellLengthM, notes: $notes, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HydrologyRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.outingId, outingId) ||
                other.outingId == outingId) &&
            (identical(other.areaTreatment, areaTreatment) ||
                other.areaTreatment == areaTreatment) &&
            (identical(other.wlrType, wlrType) || other.wlrType == wlrType) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.elevationWaypointType, elevationWaypointType) ||
                other.elevationWaypointType == elevationWaypointType) &&
            (identical(other.waypointNumber, waypointNumber) ||
                other.waypointNumber == waypointNumber) &&
            (identical(other.rtkElevationNavd88M, rtkElevationNavd88M) ||
                other.rtkElevationNavd88M == rtkElevationNavd88M) &&
            (identical(
                  other.timeWaterElevationTaken,
                  timeWaterElevationTaken,
                ) ||
                other.timeWaterElevationTaken == timeWaterElevationTaken) &&
            (identical(other.waterAboveBelowNutM, waterAboveBelowNutM) ||
                other.waterAboveBelowNutM == waterAboveBelowNutM) &&
            (identical(other.wellRimToWaterM, wellRimToWaterM) ||
                other.wellRimToWaterM == wellRimToWaterM) &&
            (identical(other.wellRimToMarshM, wellRimToMarshM) ||
                other.wellRimToMarshM == wellRimToMarshM) &&
            (identical(other.wellRimToSensorM, wellRimToSensorM) ||
                other.wellRimToSensorM == wellRimToSensorM) &&
            (identical(other.wellLengthM, wellLengthM) ||
                other.wellLengthM == wellLengthM) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    localId,
    serverId,
    outingId,
    areaTreatment,
    wlrType,
    serialNumber,
    elevationWaypointType,
    waypointNumber,
    rtkElevationNavd88M,
    timeWaterElevationTaken,
    waterAboveBelowNutM,
    wellRimToWaterM,
    wellRimToMarshM,
    wellRimToSensorM,
    wellLengthM,
    notes,
    syncStatus,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of HydrologyRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HydrologyRecordImplCopyWith<_$HydrologyRecordImpl> get copyWith =>
      __$$HydrologyRecordImplCopyWithImpl<_$HydrologyRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HydrologyRecordImplToJson(this);
  }
}

abstract class _HydrologyRecord implements HydrologyRecord {
  const factory _HydrologyRecord({
    final int? id,
    final String? localId,
    final int? serverId,
    required final int outingId,
    final String? areaTreatment,
    final String? wlrType,
    final String? serialNumber,
    required final String elevationWaypointType,
    required final int waypointNumber,
    required final int rtkElevationNavd88M,
    final String? timeWaterElevationTaken,
    final double? waterAboveBelowNutM,
    final double? wellRimToWaterM,
    final double? wellRimToMarshM,
    final double? wellRimToSensorM,
    final double? wellLengthM,
    final String? notes,
    final String syncStatus,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$HydrologyRecordImpl;

  factory _HydrologyRecord.fromJson(Map<String, dynamic> json) =
      _$HydrologyRecordImpl.fromJson;

  @override
  int? get id;
  @override
  String? get localId;
  @override
  int? get serverId;
  @override
  int get outingId;
  @override
  String? get areaTreatment;
  @override
  String? get wlrType;
  @override
  String? get serialNumber;
  @override
  String get elevationWaypointType; // RTK or GTS
  @override
  int get waypointNumber;
  @override
  int get rtkElevationNavd88M;
  @override
  String? get timeWaterElevationTaken;
  @override
  double? get waterAboveBelowNutM;
  @override
  double? get wellRimToWaterM;
  @override
  double? get wellRimToMarshM;
  @override
  double? get wellRimToSensorM;
  @override
  double? get wellLengthM;
  @override
  String? get notes;
  @override
  String get syncStatus;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of HydrologyRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HydrologyRecordImplCopyWith<_$HydrologyRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
