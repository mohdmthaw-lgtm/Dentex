// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Patient {

 String get id; String get ownerId; String get ownerType; String get name; String get phoneEncrypted;@NullableTimestampConverter() DateTime? get dob; String get gender; String get address; String get allergiesEncrypted; String get chronicConditionsEncrypted; String get createdByUid;@TimestampConverter() DateTime? get createdAt;@TimestampConverter() DateTime? get updatedAt; PatientStats get stats; String? get assignedDoctorUid; String? get assignedDoctorNameSnapshot;
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientCopyWith<Patient> get copyWith => _$PatientCopyWithImpl<Patient>(this as Patient, _$identity);

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneEncrypted, phoneEncrypted) || other.phoneEncrypted == phoneEncrypted)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.allergiesEncrypted, allergiesEncrypted) || other.allergiesEncrypted == allergiesEncrypted)&&(identical(other.chronicConditionsEncrypted, chronicConditionsEncrypted) || other.chronicConditionsEncrypted == chronicConditionsEncrypted)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.assignedDoctorUid, assignedDoctorUid) || other.assignedDoctorUid == assignedDoctorUid)&&(identical(other.assignedDoctorNameSnapshot, assignedDoctorNameSnapshot) || other.assignedDoctorNameSnapshot == assignedDoctorNameSnapshot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,name,phoneEncrypted,dob,gender,address,allergiesEncrypted,chronicConditionsEncrypted,createdByUid,createdAt,updatedAt,stats,assignedDoctorUid,assignedDoctorNameSnapshot);

@override
String toString() {
  return 'Patient(id: $id, ownerId: $ownerId, ownerType: $ownerType, name: $name, phoneEncrypted: $phoneEncrypted, dob: $dob, gender: $gender, address: $address, allergiesEncrypted: $allergiesEncrypted, chronicConditionsEncrypted: $chronicConditionsEncrypted, createdByUid: $createdByUid, createdAt: $createdAt, updatedAt: $updatedAt, stats: $stats, assignedDoctorUid: $assignedDoctorUid, assignedDoctorNameSnapshot: $assignedDoctorNameSnapshot)';
}


}

/// @nodoc
abstract mixin class $PatientCopyWith<$Res>  {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) _then) = _$PatientCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String ownerType, String name, String phoneEncrypted,@NullableTimestampConverter() DateTime? dob, String gender, String address, String allergiesEncrypted, String chronicConditionsEncrypted, String createdByUid,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt, PatientStats stats, String? assignedDoctorUid, String? assignedDoctorNameSnapshot
});


$PatientStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$PatientCopyWithImpl<$Res>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._self, this._then);

  final Patient _self;
  final $Res Function(Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? name = null,Object? phoneEncrypted = null,Object? dob = freezed,Object? gender = null,Object? address = null,Object? allergiesEncrypted = null,Object? chronicConditionsEncrypted = null,Object? createdByUid = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? stats = null,Object? assignedDoctorUid = freezed,Object? assignedDoctorNameSnapshot = freezed,}) {
  return _then(Patient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneEncrypted: null == phoneEncrypted ? _self.phoneEncrypted : phoneEncrypted // ignore: cast_nullable_to_non_nullable
as String,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,allergiesEncrypted: null == allergiesEncrypted ? _self.allergiesEncrypted : allergiesEncrypted // ignore: cast_nullable_to_non_nullable
as String,chronicConditionsEncrypted: null == chronicConditionsEncrypted ? _self.chronicConditionsEncrypted : chronicConditionsEncrypted // ignore: cast_nullable_to_non_nullable
as String,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PatientStats,assignedDoctorUid: freezed == assignedDoctorUid ? _self.assignedDoctorUid : assignedDoctorUid // ignore: cast_nullable_to_non_nullable
as String?,assignedDoctorNameSnapshot: freezed == assignedDoctorNameSnapshot ? _self.assignedDoctorNameSnapshot : assignedDoctorNameSnapshot // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientStatsCopyWith<$Res> get stats {
  
  return $PatientStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [Patient].
extension PatientPatterns on Patient {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Patient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Patient value)  $default,){
final _that = this;
switch (_that) {
case _Patient():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Patient value)?  $default,){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String name,  String phoneEncrypted, @NullableTimestampConverter()  DateTime? dob,  String gender,  String address,  String allergiesEncrypted,  String chronicConditionsEncrypted,  String createdByUid, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt,  PatientStats stats,  String? assignedDoctorUid,  String? assignedDoctorNameSnapshot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.name,_that.phoneEncrypted,_that.dob,_that.gender,_that.address,_that.allergiesEncrypted,_that.chronicConditionsEncrypted,_that.createdByUid,_that.createdAt,_that.updatedAt,_that.stats,_that.assignedDoctorUid,_that.assignedDoctorNameSnapshot);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String name,  String phoneEncrypted, @NullableTimestampConverter()  DateTime? dob,  String gender,  String address,  String allergiesEncrypted,  String chronicConditionsEncrypted,  String createdByUid, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt,  PatientStats stats,  String? assignedDoctorUid,  String? assignedDoctorNameSnapshot)  $default,) {final _that = this;
switch (_that) {
case _Patient():
return $default(_that.id,_that.ownerId,_that.ownerType,_that.name,_that.phoneEncrypted,_that.dob,_that.gender,_that.address,_that.allergiesEncrypted,_that.chronicConditionsEncrypted,_that.createdByUid,_that.createdAt,_that.updatedAt,_that.stats,_that.assignedDoctorUid,_that.assignedDoctorNameSnapshot);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String ownerType,  String name,  String phoneEncrypted, @NullableTimestampConverter()  DateTime? dob,  String gender,  String address,  String allergiesEncrypted,  String chronicConditionsEncrypted,  String createdByUid, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt,  PatientStats stats,  String? assignedDoctorUid,  String? assignedDoctorNameSnapshot)?  $default,) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.name,_that.phoneEncrypted,_that.dob,_that.gender,_that.address,_that.allergiesEncrypted,_that.chronicConditionsEncrypted,_that.createdByUid,_that.createdAt,_that.updatedAt,_that.stats,_that.assignedDoctorUid,_that.assignedDoctorNameSnapshot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Patient extends Patient {
  const _Patient({required this.id, required this.ownerId, this.ownerType = PatientOwnerType.doctor, required this.name, this.phoneEncrypted = '', @NullableTimestampConverter() this.dob, this.gender = '', this.address = '', this.allergiesEncrypted = '', this.chronicConditionsEncrypted = '', required this.createdByUid, @TimestampConverter() this.createdAt, @TimestampConverter() this.updatedAt, this.stats = PatientStats.empty, this.assignedDoctorUid, this.assignedDoctorNameSnapshot}): super._();
  factory _Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

@override final  String id;
@override final  String ownerId;
@override@JsonKey() final  String ownerType;
@override final  String name;
@override@JsonKey() final  String phoneEncrypted;
@override@NullableTimestampConverter() final  DateTime? dob;
@override@JsonKey() final  String gender;
@override@JsonKey() final  String address;
@override@JsonKey() final  String allergiesEncrypted;
@override@JsonKey() final  String chronicConditionsEncrypted;
@override final  String createdByUid;
@override@TimestampConverter() final  DateTime? createdAt;
@override@TimestampConverter() final  DateTime? updatedAt;
@override@JsonKey() final  PatientStats stats;
@override final  String? assignedDoctorUid;
@override final  String? assignedDoctorNameSnapshot;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientCopyWith<_Patient> get copyWith => __$PatientCopyWithImpl<_Patient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneEncrypted, phoneEncrypted) || other.phoneEncrypted == phoneEncrypted)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.address, address) || other.address == address)&&(identical(other.allergiesEncrypted, allergiesEncrypted) || other.allergiesEncrypted == allergiesEncrypted)&&(identical(other.chronicConditionsEncrypted, chronicConditionsEncrypted) || other.chronicConditionsEncrypted == chronicConditionsEncrypted)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.assignedDoctorUid, assignedDoctorUid) || other.assignedDoctorUid == assignedDoctorUid)&&(identical(other.assignedDoctorNameSnapshot, assignedDoctorNameSnapshot) || other.assignedDoctorNameSnapshot == assignedDoctorNameSnapshot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,name,phoneEncrypted,dob,gender,address,allergiesEncrypted,chronicConditionsEncrypted,createdByUid,createdAt,updatedAt,stats,assignedDoctorUid,assignedDoctorNameSnapshot);

@override
String toString() {
  return 'Patient(id: $id, ownerId: $ownerId, ownerType: $ownerType, name: $name, phoneEncrypted: $phoneEncrypted, dob: $dob, gender: $gender, address: $address, allergiesEncrypted: $allergiesEncrypted, chronicConditionsEncrypted: $chronicConditionsEncrypted, createdByUid: $createdByUid, createdAt: $createdAt, updatedAt: $updatedAt, stats: $stats, assignedDoctorUid: $assignedDoctorUid, assignedDoctorNameSnapshot: $assignedDoctorNameSnapshot)';
}


}

/// @nodoc
abstract mixin class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) _then) = __$PatientCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String ownerType, String name, String phoneEncrypted,@NullableTimestampConverter() DateTime? dob, String gender, String address, String allergiesEncrypted, String chronicConditionsEncrypted, String createdByUid,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt, PatientStats stats, String? assignedDoctorUid, String? assignedDoctorNameSnapshot
});


@override $PatientStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(this._self, this._then);

  final _Patient _self;
  final $Res Function(_Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? name = null,Object? phoneEncrypted = null,Object? dob = freezed,Object? gender = null,Object? address = null,Object? allergiesEncrypted = null,Object? chronicConditionsEncrypted = null,Object? createdByUid = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? stats = null,Object? assignedDoctorUid = freezed,Object? assignedDoctorNameSnapshot = freezed,}) {
  return _then(_Patient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneEncrypted: null == phoneEncrypted ? _self.phoneEncrypted : phoneEncrypted // ignore: cast_nullable_to_non_nullable
as String,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,allergiesEncrypted: null == allergiesEncrypted ? _self.allergiesEncrypted : allergiesEncrypted // ignore: cast_nullable_to_non_nullable
as String,chronicConditionsEncrypted: null == chronicConditionsEncrypted ? _self.chronicConditionsEncrypted : chronicConditionsEncrypted // ignore: cast_nullable_to_non_nullable
as String,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PatientStats,assignedDoctorUid: freezed == assignedDoctorUid ? _self.assignedDoctorUid : assignedDoctorUid // ignore: cast_nullable_to_non_nullable
as String?,assignedDoctorNameSnapshot: freezed == assignedDoctorNameSnapshot ? _self.assignedDoctorNameSnapshot : assignedDoctorNameSnapshot // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatientStatsCopyWith<$Res> get stats {
  
  return $PatientStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$Visit {

 String get id; String get ownerId; String get ownerType; String get patientId; String? get toothNumber; String get treatmentType; String get description; num get cost; num get paidAtVisit; bool get followUpNeeded;@TimestampConverter() DateTime? get visitDate; String get createdByUid;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of Visit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitCopyWith<Visit> get copyWith => _$VisitCopyWithImpl<Visit>(this as Visit, _$identity);

  /// Serializes this Visit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Visit&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.toothNumber, toothNumber) || other.toothNumber == toothNumber)&&(identical(other.treatmentType, treatmentType) || other.treatmentType == treatmentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.paidAtVisit, paidAtVisit) || other.paidAtVisit == paidAtVisit)&&(identical(other.followUpNeeded, followUpNeeded) || other.followUpNeeded == followUpNeeded)&&(identical(other.visitDate, visitDate) || other.visitDate == visitDate)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,toothNumber,treatmentType,description,cost,paidAtVisit,followUpNeeded,visitDate,createdByUid,createdAt);

@override
String toString() {
  return 'Visit(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, toothNumber: $toothNumber, treatmentType: $treatmentType, description: $description, cost: $cost, paidAtVisit: $paidAtVisit, followUpNeeded: $followUpNeeded, visitDate: $visitDate, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $VisitCopyWith<$Res>  {
  factory $VisitCopyWith(Visit value, $Res Function(Visit) _then) = _$VisitCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, String? toothNumber, String treatmentType, String description, num cost, num paidAtVisit, bool followUpNeeded,@TimestampConverter() DateTime? visitDate, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$VisitCopyWithImpl<$Res>
    implements $VisitCopyWith<$Res> {
  _$VisitCopyWithImpl(this._self, this._then);

  final Visit _self;
  final $Res Function(Visit) _then;

/// Create a copy of Visit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? toothNumber = freezed,Object? treatmentType = null,Object? description = null,Object? cost = null,Object? paidAtVisit = null,Object? followUpNeeded = null,Object? visitDate = freezed,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(Visit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,toothNumber: freezed == toothNumber ? _self.toothNumber : toothNumber // ignore: cast_nullable_to_non_nullable
as String?,treatmentType: null == treatmentType ? _self.treatmentType : treatmentType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as num,paidAtVisit: null == paidAtVisit ? _self.paidAtVisit : paidAtVisit // ignore: cast_nullable_to_non_nullable
as num,followUpNeeded: null == followUpNeeded ? _self.followUpNeeded : followUpNeeded // ignore: cast_nullable_to_non_nullable
as bool,visitDate: freezed == visitDate ? _self.visitDate : visitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Visit].
extension VisitPatterns on Visit {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Visit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Visit() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Visit value)  $default,){
final _that = this;
switch (_that) {
case _Visit():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Visit value)?  $default,){
final _that = this;
switch (_that) {
case _Visit() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  String? toothNumber,  String treatmentType,  String description,  num cost,  num paidAtVisit,  bool followUpNeeded, @TimestampConverter()  DateTime? visitDate,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Visit() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.toothNumber,_that.treatmentType,_that.description,_that.cost,_that.paidAtVisit,_that.followUpNeeded,_that.visitDate,_that.createdByUid,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  String? toothNumber,  String treatmentType,  String description,  num cost,  num paidAtVisit,  bool followUpNeeded, @TimestampConverter()  DateTime? visitDate,  String createdByUid, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Visit():
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.toothNumber,_that.treatmentType,_that.description,_that.cost,_that.paidAtVisit,_that.followUpNeeded,_that.visitDate,_that.createdByUid,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String ownerType,  String patientId,  String? toothNumber,  String treatmentType,  String description,  num cost,  num paidAtVisit,  bool followUpNeeded, @TimestampConverter()  DateTime? visitDate,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Visit() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.toothNumber,_that.treatmentType,_that.description,_that.cost,_that.paidAtVisit,_that.followUpNeeded,_that.visitDate,_that.createdByUid,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Visit implements Visit {
  const _Visit({required this.id, required this.ownerId, this.ownerType = PatientOwnerType.doctor, required this.patientId, this.toothNumber, this.treatmentType = TreatmentType.other, this.description = '', this.cost = 0, this.paidAtVisit = 0, this.followUpNeeded = false, @TimestampConverter() this.visitDate, required this.createdByUid, @TimestampConverter() this.createdAt});
  factory _Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);

@override final  String id;
@override final  String ownerId;
@override@JsonKey() final  String ownerType;
@override final  String patientId;
@override final  String? toothNumber;
@override@JsonKey() final  String treatmentType;
@override@JsonKey() final  String description;
@override@JsonKey() final  num cost;
@override@JsonKey() final  num paidAtVisit;
@override@JsonKey() final  bool followUpNeeded;
@override@TimestampConverter() final  DateTime? visitDate;
@override final  String createdByUid;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of Visit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitCopyWith<_Visit> get copyWith => __$VisitCopyWithImpl<_Visit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Visit&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.toothNumber, toothNumber) || other.toothNumber == toothNumber)&&(identical(other.treatmentType, treatmentType) || other.treatmentType == treatmentType)&&(identical(other.description, description) || other.description == description)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.paidAtVisit, paidAtVisit) || other.paidAtVisit == paidAtVisit)&&(identical(other.followUpNeeded, followUpNeeded) || other.followUpNeeded == followUpNeeded)&&(identical(other.visitDate, visitDate) || other.visitDate == visitDate)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,toothNumber,treatmentType,description,cost,paidAtVisit,followUpNeeded,visitDate,createdByUid,createdAt);

@override
String toString() {
  return 'Visit(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, toothNumber: $toothNumber, treatmentType: $treatmentType, description: $description, cost: $cost, paidAtVisit: $paidAtVisit, followUpNeeded: $followUpNeeded, visitDate: $visitDate, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$VisitCopyWith<$Res> implements $VisitCopyWith<$Res> {
  factory _$VisitCopyWith(_Visit value, $Res Function(_Visit) _then) = __$VisitCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, String? toothNumber, String treatmentType, String description, num cost, num paidAtVisit, bool followUpNeeded,@TimestampConverter() DateTime? visitDate, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$VisitCopyWithImpl<$Res>
    implements _$VisitCopyWith<$Res> {
  __$VisitCopyWithImpl(this._self, this._then);

  final _Visit _self;
  final $Res Function(_Visit) _then;

/// Create a copy of Visit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? toothNumber = freezed,Object? treatmentType = null,Object? description = null,Object? cost = null,Object? paidAtVisit = null,Object? followUpNeeded = null,Object? visitDate = freezed,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(_Visit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,toothNumber: freezed == toothNumber ? _self.toothNumber : toothNumber // ignore: cast_nullable_to_non_nullable
as String?,treatmentType: null == treatmentType ? _self.treatmentType : treatmentType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as num,paidAtVisit: null == paidAtVisit ? _self.paidAtVisit : paidAtVisit // ignore: cast_nullable_to_non_nullable
as num,followUpNeeded: null == followUpNeeded ? _self.followUpNeeded : followUpNeeded // ignore: cast_nullable_to_non_nullable
as bool,visitDate: freezed == visitDate ? _self.visitDate : visitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PatientPayment {

 String get id; String get ownerId; String get ownerType; String get patientId; num get amount; String get method; String get recordedByUid;@TimestampConverter() DateTime? get recordedAt; String get note;
/// Create a copy of PatientPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientPaymentCopyWith<PatientPayment> get copyWith => _$PatientPaymentCopyWithImpl<PatientPayment>(this as PatientPayment, _$identity);

  /// Serializes this PatientPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.recordedByUid, recordedByUid) || other.recordedByUid == recordedByUid)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,amount,method,recordedByUid,recordedAt,note);

@override
String toString() {
  return 'PatientPayment(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, amount: $amount, method: $method, recordedByUid: $recordedByUid, recordedAt: $recordedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class $PatientPaymentCopyWith<$Res>  {
  factory $PatientPaymentCopyWith(PatientPayment value, $Res Function(PatientPayment) _then) = _$PatientPaymentCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, num amount, String method, String recordedByUid,@TimestampConverter() DateTime? recordedAt, String note
});




}
/// @nodoc
class _$PatientPaymentCopyWithImpl<$Res>
    implements $PatientPaymentCopyWith<$Res> {
  _$PatientPaymentCopyWithImpl(this._self, this._then);

  final PatientPayment _self;
  final $Res Function(PatientPayment) _then;

/// Create a copy of PatientPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? amount = null,Object? method = null,Object? recordedByUid = null,Object? recordedAt = freezed,Object? note = null,}) {
  return _then(PatientPayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,recordedByUid: null == recordedByUid ? _self.recordedByUid : recordedByUid // ignore: cast_nullable_to_non_nullable
as String,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientPayment].
extension PatientPaymentPatterns on PatientPayment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientPayment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientPayment value)  $default,){
final _that = this;
switch (_that) {
case _PatientPayment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientPayment value)?  $default,){
final _that = this;
switch (_that) {
case _PatientPayment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientPayment() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)  $default,) {final _that = this;
switch (_that) {
case _PatientPayment():
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String ownerType,  String patientId,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)?  $default,) {final _that = this;
switch (_that) {
case _PatientPayment() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientPayment implements PatientPayment {
  const _PatientPayment({required this.id, required this.ownerId, this.ownerType = PatientOwnerType.doctor, required this.patientId, required this.amount, this.method = 'cash', required this.recordedByUid, @TimestampConverter() this.recordedAt, this.note = ''});
  factory _PatientPayment.fromJson(Map<String, dynamic> json) => _$PatientPaymentFromJson(json);

@override final  String id;
@override final  String ownerId;
@override@JsonKey() final  String ownerType;
@override final  String patientId;
@override final  num amount;
@override@JsonKey() final  String method;
@override final  String recordedByUid;
@override@TimestampConverter() final  DateTime? recordedAt;
@override@JsonKey() final  String note;

/// Create a copy of PatientPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientPaymentCopyWith<_PatientPayment> get copyWith => __$PatientPaymentCopyWithImpl<_PatientPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.recordedByUid, recordedByUid) || other.recordedByUid == recordedByUid)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,amount,method,recordedByUid,recordedAt,note);

@override
String toString() {
  return 'PatientPayment(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, amount: $amount, method: $method, recordedByUid: $recordedByUid, recordedAt: $recordedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PatientPaymentCopyWith<$Res> implements $PatientPaymentCopyWith<$Res> {
  factory _$PatientPaymentCopyWith(_PatientPayment value, $Res Function(_PatientPayment) _then) = __$PatientPaymentCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, num amount, String method, String recordedByUid,@TimestampConverter() DateTime? recordedAt, String note
});




}
/// @nodoc
class __$PatientPaymentCopyWithImpl<$Res>
    implements _$PatientPaymentCopyWith<$Res> {
  __$PatientPaymentCopyWithImpl(this._self, this._then);

  final _PatientPayment _self;
  final $Res Function(_PatientPayment) _then;

/// Create a copy of PatientPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? amount = null,Object? method = null,Object? recordedByUid = null,Object? recordedAt = freezed,Object? note = null,}) {
  return _then(_PatientPayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,recordedByUid: null == recordedByUid ? _self.recordedByUid : recordedByUid // ignore: cast_nullable_to_non_nullable
as String,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
