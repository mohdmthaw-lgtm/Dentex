// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Appointment {

 String get id; String get ownerId; String get ownerType; String get patientId; String get patientNameSnapshot;@TimestampConverter() DateTime? get scheduledAt; String get expectedTreatmentType; String get status; String get notes; String get createdByUid;@TimestampConverter() DateTime? get createdAt; String? get assignedDoctorUid; bool get reminderSent;
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentCopyWith<Appointment> get copyWith => _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientNameSnapshot, patientNameSnapshot) || other.patientNameSnapshot == patientNameSnapshot)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.expectedTreatmentType, expectedTreatmentType) || other.expectedTreatmentType == expectedTreatmentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.assignedDoctorUid, assignedDoctorUid) || other.assignedDoctorUid == assignedDoctorUid)&&(identical(other.reminderSent, reminderSent) || other.reminderSent == reminderSent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,patientNameSnapshot,scheduledAt,expectedTreatmentType,status,notes,createdByUid,createdAt,assignedDoctorUid,reminderSent);

@override
String toString() {
  return 'Appointment(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, patientNameSnapshot: $patientNameSnapshot, scheduledAt: $scheduledAt, expectedTreatmentType: $expectedTreatmentType, status: $status, notes: $notes, createdByUid: $createdByUid, createdAt: $createdAt, assignedDoctorUid: $assignedDoctorUid, reminderSent: $reminderSent)';
}


}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res>  {
  factory $AppointmentCopyWith(Appointment value, $Res Function(Appointment) _then) = _$AppointmentCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, String patientNameSnapshot,@TimestampConverter() DateTime? scheduledAt, String expectedTreatmentType, String status, String notes, String createdByUid,@TimestampConverter() DateTime? createdAt, String? assignedDoctorUid, bool reminderSent
});




}
/// @nodoc
class _$AppointmentCopyWithImpl<$Res>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? patientNameSnapshot = null,Object? scheduledAt = freezed,Object? expectedTreatmentType = null,Object? status = null,Object? notes = null,Object? createdByUid = null,Object? createdAt = freezed,Object? assignedDoctorUid = freezed,Object? reminderSent = null,}) {
  return _then(Appointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,patientNameSnapshot: null == patientNameSnapshot ? _self.patientNameSnapshot : patientNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedTreatmentType: null == expectedTreatmentType ? _self.expectedTreatmentType : expectedTreatmentType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedDoctorUid: freezed == assignedDoctorUid ? _self.assignedDoctorUid : assignedDoctorUid // ignore: cast_nullable_to_non_nullable
as String?,reminderSent: null == reminderSent ? _self.reminderSent : reminderSent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Appointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Appointment value)  $default,){
final _that = this;
switch (_that) {
case _Appointment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Appointment value)?  $default,){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  String patientNameSnapshot, @TimestampConverter()  DateTime? scheduledAt,  String expectedTreatmentType,  String status,  String notes,  String createdByUid, @TimestampConverter()  DateTime? createdAt,  String? assignedDoctorUid,  bool reminderSent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.patientNameSnapshot,_that.scheduledAt,_that.expectedTreatmentType,_that.status,_that.notes,_that.createdByUid,_that.createdAt,_that.assignedDoctorUid,_that.reminderSent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  String patientNameSnapshot, @TimestampConverter()  DateTime? scheduledAt,  String expectedTreatmentType,  String status,  String notes,  String createdByUid, @TimestampConverter()  DateTime? createdAt,  String? assignedDoctorUid,  bool reminderSent)  $default,) {final _that = this;
switch (_that) {
case _Appointment():
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.patientNameSnapshot,_that.scheduledAt,_that.expectedTreatmentType,_that.status,_that.notes,_that.createdByUid,_that.createdAt,_that.assignedDoctorUid,_that.reminderSent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String ownerType,  String patientId,  String patientNameSnapshot, @TimestampConverter()  DateTime? scheduledAt,  String expectedTreatmentType,  String status,  String notes,  String createdByUid, @TimestampConverter()  DateTime? createdAt,  String? assignedDoctorUid,  bool reminderSent)?  $default,) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.patientNameSnapshot,_that.scheduledAt,_that.expectedTreatmentType,_that.status,_that.notes,_that.createdByUid,_that.createdAt,_that.assignedDoctorUid,_that.reminderSent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Appointment implements Appointment {
  const _Appointment({required this.id, required this.ownerId, this.ownerType = PatientOwnerType.doctor, required this.patientId, required this.patientNameSnapshot, @TimestampConverter() this.scheduledAt, this.expectedTreatmentType = TreatmentType.other, this.status = AppointmentStatus.scheduled, this.notes = '', required this.createdByUid, @TimestampConverter() this.createdAt, this.assignedDoctorUid, this.reminderSent = false});
  factory _Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

@override final  String id;
@override final  String ownerId;
@override@JsonKey() final  String ownerType;
@override final  String patientId;
@override final  String patientNameSnapshot;
@override@TimestampConverter() final  DateTime? scheduledAt;
@override@JsonKey() final  String expectedTreatmentType;
@override@JsonKey() final  String status;
@override@JsonKey() final  String notes;
@override final  String createdByUid;
@override@TimestampConverter() final  DateTime? createdAt;
@override final  String? assignedDoctorUid;
@override@JsonKey() final  bool reminderSent;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentCopyWith<_Appointment> get copyWith => __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientNameSnapshot, patientNameSnapshot) || other.patientNameSnapshot == patientNameSnapshot)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.expectedTreatmentType, expectedTreatmentType) || other.expectedTreatmentType == expectedTreatmentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.assignedDoctorUid, assignedDoctorUid) || other.assignedDoctorUid == assignedDoctorUid)&&(identical(other.reminderSent, reminderSent) || other.reminderSent == reminderSent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,patientNameSnapshot,scheduledAt,expectedTreatmentType,status,notes,createdByUid,createdAt,assignedDoctorUid,reminderSent);

@override
String toString() {
  return 'Appointment(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, patientNameSnapshot: $patientNameSnapshot, scheduledAt: $scheduledAt, expectedTreatmentType: $expectedTreatmentType, status: $status, notes: $notes, createdByUid: $createdByUid, createdAt: $createdAt, assignedDoctorUid: $assignedDoctorUid, reminderSent: $reminderSent)';
}


}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res> implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(_Appointment value, $Res Function(_Appointment) _then) = __$AppointmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, String patientNameSnapshot,@TimestampConverter() DateTime? scheduledAt, String expectedTreatmentType, String status, String notes, String createdByUid,@TimestampConverter() DateTime? createdAt, String? assignedDoctorUid, bool reminderSent
});




}
/// @nodoc
class __$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? patientNameSnapshot = null,Object? scheduledAt = freezed,Object? expectedTreatmentType = null,Object? status = null,Object? notes = null,Object? createdByUid = null,Object? createdAt = freezed,Object? assignedDoctorUid = freezed,Object? reminderSent = null,}) {
  return _then(_Appointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,patientNameSnapshot: null == patientNameSnapshot ? _self.patientNameSnapshot : patientNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedTreatmentType: null == expectedTreatmentType ? _self.expectedTreatmentType : expectedTreatmentType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedDoctorUid: freezed == assignedDoctorUid ? _self.assignedDoctorUid : assignedDoctorUid // ignore: cast_nullable_to_non_nullable
as String?,reminderSent: null == reminderSent ? _self.reminderSent : reminderSent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
