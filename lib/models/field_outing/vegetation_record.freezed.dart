// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vegetation_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VegetationRecord _$VegetationRecordFromJson(Map<String, dynamic> json) {
  return _VegetationRecord.fromJson(json);
}

/// @nodoc
mixin _$VegetationRecord {
  int? get id => throw _privateConstructorUsedError;
  String? get localId => throw _privateConstructorUsedError;
  int? get serverId => throw _privateConstructorUsedError;
  int get outingId => throw _privateConstructorUsedError;
  String get transectId => throw _privateConstructorUsedError;
  int get plotNumber => throw _privateConstructorUsedError;
  String get habitatType => throw _privateConstructorUsedError;
  double get distanceAlongTransectM => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get elevationM => throw _privateConstructorUsedError;
  double? get accuracyM => throw _privateConstructorUsedError;
  double get canopyHeightM => throw _privateConstructorUsedError;
  double get thatchHeightM => throw _privateConstructorUsedError;
  List<SpeciesObservation> get speciesObservations =>
      throw _privateConstructorUsedError;
  String? get photoLocalPath => throw _privateConstructorUsedError;
  String? get photoFilename => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get protocolCode => throw _privateConstructorUsedError;
  String? get subclass => throw _privateConstructorUsedError;
  String? get rtkPointNumber => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VegetationRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VegetationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VegetationRecordCopyWith<VegetationRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VegetationRecordCopyWith<$Res> {
  factory $VegetationRecordCopyWith(
    VegetationRecord value,
    $Res Function(VegetationRecord) then,
  ) = _$VegetationRecordCopyWithImpl<$Res, VegetationRecord>;
  @useResult
  $Res call({
    int? id,
    String? localId,
    int? serverId,
    int outingId,
    String transectId,
    int plotNumber,
    String habitatType,
    double distanceAlongTransectM,
    double latitude,
    double longitude,
    double? elevationM,
    double? accuracyM,
    double canopyHeightM,
    double thatchHeightM,
    List<SpeciesObservation> speciesObservations,
    String? photoLocalPath,
    String? photoFilename,
    String? notes,
    String? protocolCode,
    String? subclass,
    String? rtkPointNumber,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$VegetationRecordCopyWithImpl<$Res, $Val extends VegetationRecord>
    implements $VegetationRecordCopyWith<$Res> {
  _$VegetationRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VegetationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? serverId = freezed,
    Object? outingId = null,
    Object? transectId = null,
    Object? plotNumber = null,
    Object? habitatType = null,
    Object? distanceAlongTransectM = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? elevationM = freezed,
    Object? accuracyM = freezed,
    Object? canopyHeightM = null,
    Object? thatchHeightM = null,
    Object? speciesObservations = null,
    Object? photoLocalPath = freezed,
    Object? photoFilename = freezed,
    Object? notes = freezed,
    Object? protocolCode = freezed,
    Object? subclass = freezed,
    Object? rtkPointNumber = freezed,
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
            transectId: null == transectId
                ? _value.transectId
                : transectId // ignore: cast_nullable_to_non_nullable
                      as String,
            plotNumber: null == plotNumber
                ? _value.plotNumber
                : plotNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            habitatType: null == habitatType
                ? _value.habitatType
                : habitatType // ignore: cast_nullable_to_non_nullable
                      as String,
            distanceAlongTransectM: null == distanceAlongTransectM
                ? _value.distanceAlongTransectM
                : distanceAlongTransectM // ignore: cast_nullable_to_non_nullable
                      as double,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            elevationM: freezed == elevationM
                ? _value.elevationM
                : elevationM // ignore: cast_nullable_to_non_nullable
                      as double?,
            accuracyM: freezed == accuracyM
                ? _value.accuracyM
                : accuracyM // ignore: cast_nullable_to_non_nullable
                      as double?,
            canopyHeightM: null == canopyHeightM
                ? _value.canopyHeightM
                : canopyHeightM // ignore: cast_nullable_to_non_nullable
                      as double,
            thatchHeightM: null == thatchHeightM
                ? _value.thatchHeightM
                : thatchHeightM // ignore: cast_nullable_to_non_nullable
                      as double,
            speciesObservations: null == speciesObservations
                ? _value.speciesObservations
                : speciesObservations // ignore: cast_nullable_to_non_nullable
                      as List<SpeciesObservation>,
            photoLocalPath: freezed == photoLocalPath
                ? _value.photoLocalPath
                : photoLocalPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoFilename: freezed == photoFilename
                ? _value.photoFilename
                : photoFilename // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            protocolCode: freezed == protocolCode
                ? _value.protocolCode
                : protocolCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            subclass: freezed == subclass
                ? _value.subclass
                : subclass // ignore: cast_nullable_to_non_nullable
                      as String?,
            rtkPointNumber: freezed == rtkPointNumber
                ? _value.rtkPointNumber
                : rtkPointNumber // ignore: cast_nullable_to_non_nullable
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
abstract class _$$VegetationRecordImplCopyWith<$Res>
    implements $VegetationRecordCopyWith<$Res> {
  factory _$$VegetationRecordImplCopyWith(
    _$VegetationRecordImpl value,
    $Res Function(_$VegetationRecordImpl) then,
  ) = __$$VegetationRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? localId,
    int? serverId,
    int outingId,
    String transectId,
    int plotNumber,
    String habitatType,
    double distanceAlongTransectM,
    double latitude,
    double longitude,
    double? elevationM,
    double? accuracyM,
    double canopyHeightM,
    double thatchHeightM,
    List<SpeciesObservation> speciesObservations,
    String? photoLocalPath,
    String? photoFilename,
    String? notes,
    String? protocolCode,
    String? subclass,
    String? rtkPointNumber,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$VegetationRecordImplCopyWithImpl<$Res>
    extends _$VegetationRecordCopyWithImpl<$Res, _$VegetationRecordImpl>
    implements _$$VegetationRecordImplCopyWith<$Res> {
  __$$VegetationRecordImplCopyWithImpl(
    _$VegetationRecordImpl _value,
    $Res Function(_$VegetationRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VegetationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? serverId = freezed,
    Object? outingId = null,
    Object? transectId = null,
    Object? plotNumber = null,
    Object? habitatType = null,
    Object? distanceAlongTransectM = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? elevationM = freezed,
    Object? accuracyM = freezed,
    Object? canopyHeightM = null,
    Object? thatchHeightM = null,
    Object? speciesObservations = null,
    Object? photoLocalPath = freezed,
    Object? photoFilename = freezed,
    Object? notes = freezed,
    Object? protocolCode = freezed,
    Object? subclass = freezed,
    Object? rtkPointNumber = freezed,
    Object? syncStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VegetationRecordImpl(
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
        transectId: null == transectId
            ? _value.transectId
            : transectId // ignore: cast_nullable_to_non_nullable
                  as String,
        plotNumber: null == plotNumber
            ? _value.plotNumber
            : plotNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        habitatType: null == habitatType
            ? _value.habitatType
            : habitatType // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceAlongTransectM: null == distanceAlongTransectM
            ? _value.distanceAlongTransectM
            : distanceAlongTransectM // ignore: cast_nullable_to_non_nullable
                  as double,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        elevationM: freezed == elevationM
            ? _value.elevationM
            : elevationM // ignore: cast_nullable_to_non_nullable
                  as double?,
        accuracyM: freezed == accuracyM
            ? _value.accuracyM
            : accuracyM // ignore: cast_nullable_to_non_nullable
                  as double?,
        canopyHeightM: null == canopyHeightM
            ? _value.canopyHeightM
            : canopyHeightM // ignore: cast_nullable_to_non_nullable
                  as double,
        thatchHeightM: null == thatchHeightM
            ? _value.thatchHeightM
            : thatchHeightM // ignore: cast_nullable_to_non_nullable
                  as double,
        speciesObservations: null == speciesObservations
            ? _value._speciesObservations
            : speciesObservations // ignore: cast_nullable_to_non_nullable
                  as List<SpeciesObservation>,
        photoLocalPath: freezed == photoLocalPath
            ? _value.photoLocalPath
            : photoLocalPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoFilename: freezed == photoFilename
            ? _value.photoFilename
            : photoFilename // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        protocolCode: freezed == protocolCode
            ? _value.protocolCode
            : protocolCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        subclass: freezed == subclass
            ? _value.subclass
            : subclass // ignore: cast_nullable_to_non_nullable
                  as String?,
        rtkPointNumber: freezed == rtkPointNumber
            ? _value.rtkPointNumber
            : rtkPointNumber // ignore: cast_nullable_to_non_nullable
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
class _$VegetationRecordImpl implements _VegetationRecord {
  const _$VegetationRecordImpl({
    this.id,
    this.localId,
    this.serverId,
    required this.outingId,
    this.transectId = '',
    required this.plotNumber,
    this.habitatType = '',
    this.distanceAlongTransectM = 0.0,
    required this.latitude,
    required this.longitude,
    this.elevationM,
    this.accuracyM,
    this.canopyHeightM = 0.0,
    this.thatchHeightM = 0.0,
    required final List<SpeciesObservation> speciesObservations,
    this.photoLocalPath,
    this.photoFilename,
    this.notes,
    this.protocolCode,
    this.subclass,
    this.rtkPointNumber,
    this.syncStatus = 'pending',
    this.createdAt,
    this.updatedAt,
  }) : _speciesObservations = speciesObservations;

  factory _$VegetationRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VegetationRecordImplFromJson(json);

  @override
  final int? id;
  @override
  final String? localId;
  @override
  final int? serverId;
  @override
  final int outingId;
  @override
  @JsonKey()
  final String transectId;
  @override
  final int plotNumber;
  @override
  @JsonKey()
  final String habitatType;
  @override
  @JsonKey()
  final double distanceAlongTransectM;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? elevationM;
  @override
  final double? accuracyM;
  @override
  @JsonKey()
  final double canopyHeightM;
  @override
  @JsonKey()
  final double thatchHeightM;
  final List<SpeciesObservation> _speciesObservations;
  @override
  List<SpeciesObservation> get speciesObservations {
    if (_speciesObservations is EqualUnmodifiableListView)
      return _speciesObservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_speciesObservations);
  }

  @override
  final String? photoLocalPath;
  @override
  final String? photoFilename;
  @override
  final String? notes;
  @override
  final String? protocolCode;
  @override
  final String? subclass;
  @override
  final String? rtkPointNumber;
  @override
  @JsonKey()
  final String syncStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VegetationRecord(id: $id, localId: $localId, serverId: $serverId, outingId: $outingId, transectId: $transectId, plotNumber: $plotNumber, habitatType: $habitatType, distanceAlongTransectM: $distanceAlongTransectM, latitude: $latitude, longitude: $longitude, elevationM: $elevationM, accuracyM: $accuracyM, canopyHeightM: $canopyHeightM, thatchHeightM: $thatchHeightM, speciesObservations: $speciesObservations, photoLocalPath: $photoLocalPath, photoFilename: $photoFilename, notes: $notes, protocolCode: $protocolCode, subclass: $subclass, rtkPointNumber: $rtkPointNumber, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VegetationRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.outingId, outingId) ||
                other.outingId == outingId) &&
            (identical(other.transectId, transectId) ||
                other.transectId == transectId) &&
            (identical(other.plotNumber, plotNumber) ||
                other.plotNumber == plotNumber) &&
            (identical(other.habitatType, habitatType) ||
                other.habitatType == habitatType) &&
            (identical(other.distanceAlongTransectM, distanceAlongTransectM) ||
                other.distanceAlongTransectM == distanceAlongTransectM) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.elevationM, elevationM) ||
                other.elevationM == elevationM) &&
            (identical(other.accuracyM, accuracyM) ||
                other.accuracyM == accuracyM) &&
            (identical(other.canopyHeightM, canopyHeightM) ||
                other.canopyHeightM == canopyHeightM) &&
            (identical(other.thatchHeightM, thatchHeightM) ||
                other.thatchHeightM == thatchHeightM) &&
            const DeepCollectionEquality().equals(
              other._speciesObservations,
              _speciesObservations,
            ) &&
            (identical(other.photoLocalPath, photoLocalPath) ||
                other.photoLocalPath == photoLocalPath) &&
            (identical(other.photoFilename, photoFilename) ||
                other.photoFilename == photoFilename) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.protocolCode, protocolCode) ||
                other.protocolCode == protocolCode) &&
            (identical(other.subclass, subclass) ||
                other.subclass == subclass) &&
            (identical(other.rtkPointNumber, rtkPointNumber) ||
                other.rtkPointNumber == rtkPointNumber) &&
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
    transectId,
    plotNumber,
    habitatType,
    distanceAlongTransectM,
    latitude,
    longitude,
    elevationM,
    accuracyM,
    canopyHeightM,
    thatchHeightM,
    const DeepCollectionEquality().hash(_speciesObservations),
    photoLocalPath,
    photoFilename,
    notes,
    protocolCode,
    subclass,
    rtkPointNumber,
    syncStatus,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of VegetationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VegetationRecordImplCopyWith<_$VegetationRecordImpl> get copyWith =>
      __$$VegetationRecordImplCopyWithImpl<_$VegetationRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VegetationRecordImplToJson(this);
  }
}

abstract class _VegetationRecord implements VegetationRecord {
  const factory _VegetationRecord({
    final int? id,
    final String? localId,
    final int? serverId,
    required final int outingId,
    final String transectId,
    required final int plotNumber,
    final String habitatType,
    final double distanceAlongTransectM,
    required final double latitude,
    required final double longitude,
    final double? elevationM,
    final double? accuracyM,
    final double canopyHeightM,
    final double thatchHeightM,
    required final List<SpeciesObservation> speciesObservations,
    final String? photoLocalPath,
    final String? photoFilename,
    final String? notes,
    final String? protocolCode,
    final String? subclass,
    final String? rtkPointNumber,
    final String syncStatus,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$VegetationRecordImpl;

  factory _VegetationRecord.fromJson(Map<String, dynamic> json) =
      _$VegetationRecordImpl.fromJson;

  @override
  int? get id;
  @override
  String? get localId;
  @override
  int? get serverId;
  @override
  int get outingId;
  @override
  String get transectId;
  @override
  int get plotNumber;
  @override
  String get habitatType;
  @override
  double get distanceAlongTransectM;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get elevationM;
  @override
  double? get accuracyM;
  @override
  double get canopyHeightM;
  @override
  double get thatchHeightM;
  @override
  List<SpeciesObservation> get speciesObservations;
  @override
  String? get photoLocalPath;
  @override
  String? get photoFilename;
  @override
  String? get notes;
  @override
  String? get protocolCode;
  @override
  String? get subclass;
  @override
  String? get rtkPointNumber;
  @override
  String get syncStatus;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of VegetationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VegetationRecordImplCopyWith<_$VegetationRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpeciesObservation _$SpeciesObservationFromJson(Map<String, dynamic> json) {
  return _SpeciesObservation.fromJson(json);
}

/// @nodoc
mixin _$SpeciesObservation {
  String? get id => throw _privateConstructorUsedError;
  String get speciesCode => throw _privateConstructorUsedError;
  int get percentageCover => throw _privateConstructorUsedError;

  /// Serializes this SpeciesObservation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpeciesObservation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpeciesObservationCopyWith<SpeciesObservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeciesObservationCopyWith<$Res> {
  factory $SpeciesObservationCopyWith(
    SpeciesObservation value,
    $Res Function(SpeciesObservation) then,
  ) = _$SpeciesObservationCopyWithImpl<$Res, SpeciesObservation>;
  @useResult
  $Res call({String? id, String speciesCode, int percentageCover});
}

/// @nodoc
class _$SpeciesObservationCopyWithImpl<$Res, $Val extends SpeciesObservation>
    implements $SpeciesObservationCopyWith<$Res> {
  _$SpeciesObservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeciesObservation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? speciesCode = null,
    Object? percentageCover = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            speciesCode: null == speciesCode
                ? _value.speciesCode
                : speciesCode // ignore: cast_nullable_to_non_nullable
                      as String,
            percentageCover: null == percentageCover
                ? _value.percentageCover
                : percentageCover // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpeciesObservationImplCopyWith<$Res>
    implements $SpeciesObservationCopyWith<$Res> {
  factory _$$SpeciesObservationImplCopyWith(
    _$SpeciesObservationImpl value,
    $Res Function(_$SpeciesObservationImpl) then,
  ) = __$$SpeciesObservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String speciesCode, int percentageCover});
}

/// @nodoc
class __$$SpeciesObservationImplCopyWithImpl<$Res>
    extends _$SpeciesObservationCopyWithImpl<$Res, _$SpeciesObservationImpl>
    implements _$$SpeciesObservationImplCopyWith<$Res> {
  __$$SpeciesObservationImplCopyWithImpl(
    _$SpeciesObservationImpl _value,
    $Res Function(_$SpeciesObservationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpeciesObservation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? speciesCode = null,
    Object? percentageCover = null,
  }) {
    return _then(
      _$SpeciesObservationImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        speciesCode: null == speciesCode
            ? _value.speciesCode
            : speciesCode // ignore: cast_nullable_to_non_nullable
                  as String,
        percentageCover: null == percentageCover
            ? _value.percentageCover
            : percentageCover // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpeciesObservationImpl implements _SpeciesObservation {
  const _$SpeciesObservationImpl({
    this.id,
    required this.speciesCode,
    required this.percentageCover,
  });

  factory _$SpeciesObservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpeciesObservationImplFromJson(json);

  @override
  final String? id;
  @override
  final String speciesCode;
  @override
  final int percentageCover;

  @override
  String toString() {
    return 'SpeciesObservation(id: $id, speciesCode: $speciesCode, percentageCover: $percentageCover)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeciesObservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.speciesCode, speciesCode) ||
                other.speciesCode == speciesCode) &&
            (identical(other.percentageCover, percentageCover) ||
                other.percentageCover == percentageCover));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, speciesCode, percentageCover);

  /// Create a copy of SpeciesObservation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeciesObservationImplCopyWith<_$SpeciesObservationImpl> get copyWith =>
      __$$SpeciesObservationImplCopyWithImpl<_$SpeciesObservationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SpeciesObservationImplToJson(this);
  }
}

abstract class _SpeciesObservation implements SpeciesObservation {
  const factory _SpeciesObservation({
    final String? id,
    required final String speciesCode,
    required final int percentageCover,
  }) = _$SpeciesObservationImpl;

  factory _SpeciesObservation.fromJson(Map<String, dynamic> json) =
      _$SpeciesObservationImpl.fromJson;

  @override
  String? get id;
  @override
  String get speciesCode;
  @override
  int get percentageCover;

  /// Create a copy of SpeciesObservation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeciesObservationImplCopyWith<_$SpeciesObservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
