// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tooth_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToothPhoto {

 String get id; String get ownerId; String get ownerType; String get patientId; String get toothNumber; String get visitId; String get category; String get storageUrl; String get storagePath; String get uploadedByUid;@TimestampConverter() DateTime? get uploadedAt;
/// Create a copy of ToothPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToothPhotoCopyWith<ToothPhoto> get copyWith => _$ToothPhotoCopyWithImpl<ToothPhoto>(this as ToothPhoto, _$identity);

  /// Serializes this ToothPhoto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToothPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.toothNumber, toothNumber) || other.toothNumber == toothNumber)&&(identical(other.visitId, visitId) || other.visitId == visitId)&&(identical(other.category, category) || other.category == category)&&(identical(other.storageUrl, storageUrl) || other.storageUrl == storageUrl)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.uploadedByUid, uploadedByUid) || other.uploadedByUid == uploadedByUid)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,toothNumber,visitId,category,storageUrl,storagePath,uploadedByUid,uploadedAt);

@override
String toString() {
  return 'ToothPhoto(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, toothNumber: $toothNumber, visitId: $visitId, category: $category, storageUrl: $storageUrl, storagePath: $storagePath, uploadedByUid: $uploadedByUid, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class $ToothPhotoCopyWith<$Res>  {
  factory $ToothPhotoCopyWith(ToothPhoto value, $Res Function(ToothPhoto) _then) = _$ToothPhotoCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, String toothNumber, String visitId, String category, String storageUrl, String storagePath, String uploadedByUid,@TimestampConverter() DateTime? uploadedAt
});




}
/// @nodoc
class _$ToothPhotoCopyWithImpl<$Res>
    implements $ToothPhotoCopyWith<$Res> {
  _$ToothPhotoCopyWithImpl(this._self, this._then);

  final ToothPhoto _self;
  final $Res Function(ToothPhoto) _then;

/// Create a copy of ToothPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? toothNumber = null,Object? visitId = null,Object? category = null,Object? storageUrl = null,Object? storagePath = null,Object? uploadedByUid = null,Object? uploadedAt = freezed,}) {
  return _then(ToothPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,toothNumber: null == toothNumber ? _self.toothNumber : toothNumber // ignore: cast_nullable_to_non_nullable
as String,visitId: null == visitId ? _self.visitId : visitId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,storageUrl: null == storageUrl ? _self.storageUrl : storageUrl // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,uploadedByUid: null == uploadedByUid ? _self.uploadedByUid : uploadedByUid // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ToothPhoto].
extension ToothPhotoPatterns on ToothPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToothPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToothPhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToothPhoto value)  $default,){
final _that = this;
switch (_that) {
case _ToothPhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToothPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _ToothPhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  String toothNumber,  String visitId,  String category,  String storageUrl,  String storagePath,  String uploadedByUid, @TimestampConverter()  DateTime? uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToothPhoto() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.toothNumber,_that.visitId,_that.category,_that.storageUrl,_that.storagePath,_that.uploadedByUid,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String patientId,  String toothNumber,  String visitId,  String category,  String storageUrl,  String storagePath,  String uploadedByUid, @TimestampConverter()  DateTime? uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _ToothPhoto():
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.toothNumber,_that.visitId,_that.category,_that.storageUrl,_that.storagePath,_that.uploadedByUid,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String ownerType,  String patientId,  String toothNumber,  String visitId,  String category,  String storageUrl,  String storagePath,  String uploadedByUid, @TimestampConverter()  DateTime? uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _ToothPhoto() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.patientId,_that.toothNumber,_that.visitId,_that.category,_that.storageUrl,_that.storagePath,_that.uploadedByUid,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToothPhoto implements ToothPhoto {
  const _ToothPhoto({required this.id, required this.ownerId, this.ownerType = PatientOwnerType.doctor, required this.patientId, required this.toothNumber, required this.visitId, this.category = ToothPhotoCategory.before, required this.storageUrl, required this.storagePath, required this.uploadedByUid, @TimestampConverter() this.uploadedAt});
  factory _ToothPhoto.fromJson(Map<String, dynamic> json) => _$ToothPhotoFromJson(json);

@override final  String id;
@override final  String ownerId;
@override@JsonKey() final  String ownerType;
@override final  String patientId;
@override final  String toothNumber;
@override final  String visitId;
@override@JsonKey() final  String category;
@override final  String storageUrl;
@override final  String storagePath;
@override final  String uploadedByUid;
@override@TimestampConverter() final  DateTime? uploadedAt;

/// Create a copy of ToothPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToothPhotoCopyWith<_ToothPhoto> get copyWith => __$ToothPhotoCopyWithImpl<_ToothPhoto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToothPhotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToothPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.toothNumber, toothNumber) || other.toothNumber == toothNumber)&&(identical(other.visitId, visitId) || other.visitId == visitId)&&(identical(other.category, category) || other.category == category)&&(identical(other.storageUrl, storageUrl) || other.storageUrl == storageUrl)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.uploadedByUid, uploadedByUid) || other.uploadedByUid == uploadedByUid)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,patientId,toothNumber,visitId,category,storageUrl,storagePath,uploadedByUid,uploadedAt);

@override
String toString() {
  return 'ToothPhoto(id: $id, ownerId: $ownerId, ownerType: $ownerType, patientId: $patientId, toothNumber: $toothNumber, visitId: $visitId, category: $category, storageUrl: $storageUrl, storagePath: $storagePath, uploadedByUid: $uploadedByUid, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$ToothPhotoCopyWith<$Res> implements $ToothPhotoCopyWith<$Res> {
  factory _$ToothPhotoCopyWith(_ToothPhoto value, $Res Function(_ToothPhoto) _then) = __$ToothPhotoCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String ownerType, String patientId, String toothNumber, String visitId, String category, String storageUrl, String storagePath, String uploadedByUid,@TimestampConverter() DateTime? uploadedAt
});




}
/// @nodoc
class __$ToothPhotoCopyWithImpl<$Res>
    implements _$ToothPhotoCopyWith<$Res> {
  __$ToothPhotoCopyWithImpl(this._self, this._then);

  final _ToothPhoto _self;
  final $Res Function(_ToothPhoto) _then;

/// Create a copy of ToothPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? patientId = null,Object? toothNumber = null,Object? visitId = null,Object? category = null,Object? storageUrl = null,Object? storagePath = null,Object? uploadedByUid = null,Object? uploadedAt = freezed,}) {
  return _then(_ToothPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,toothNumber: null == toothNumber ? _self.toothNumber : toothNumber // ignore: cast_nullable_to_non_nullable
as String,visitId: null == visitId ? _self.visitId : visitId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,storageUrl: null == storageUrl ? _self.storageUrl : storageUrl // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,uploadedByUid: null == uploadedByUid ? _self.uploadedByUid : uploadedByUid // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
