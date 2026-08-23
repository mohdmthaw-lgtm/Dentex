// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get uid; String get role; String get phone; String get authEmail; String get name; String get clinicName; String get location;@TimestampConverter() DateTime? get createdAt;@TimestampConverter() DateTime? get updatedAt; List<String> get fcmTokens; DoctorStats get stats; String get lastSeenTier; int get lastSeenTierYear; bool get mustChangePassword; String get accountType; String? get centerId;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.authEmail, authEmail) || other.authEmail == authEmail)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.location, location) || other.location == location)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.fcmTokens, fcmTokens)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.lastSeenTier, lastSeenTier) || other.lastSeenTier == lastSeenTier)&&(identical(other.lastSeenTierYear, lastSeenTierYear) || other.lastSeenTierYear == lastSeenTierYear)&&(identical(other.mustChangePassword, mustChangePassword) || other.mustChangePassword == mustChangePassword)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.centerId, centerId) || other.centerId == centerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,role,phone,authEmail,name,clinicName,location,createdAt,updatedAt,const DeepCollectionEquality().hash(fcmTokens),stats,lastSeenTier,lastSeenTierYear,mustChangePassword,accountType,centerId);

@override
String toString() {
  return 'UserProfile(uid: $uid, role: $role, phone: $phone, authEmail: $authEmail, name: $name, clinicName: $clinicName, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, fcmTokens: $fcmTokens, stats: $stats, lastSeenTier: $lastSeenTier, lastSeenTierYear: $lastSeenTierYear, mustChangePassword: $mustChangePassword, accountType: $accountType, centerId: $centerId)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String uid, String role, String phone, String authEmail, String name, String clinicName, String location,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt, List<String> fcmTokens, DoctorStats stats, String lastSeenTier, int lastSeenTierYear, bool mustChangePassword, String accountType, String? centerId
});


$DoctorStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? role = null,Object? phone = null,Object? authEmail = null,Object? name = null,Object? clinicName = null,Object? location = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? fcmTokens = null,Object? stats = null,Object? lastSeenTier = null,Object? lastSeenTierYear = null,Object? mustChangePassword = null,Object? accountType = null,Object? centerId = freezed,}) {
  return _then(UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,authEmail: null == authEmail ? _self.authEmail : authEmail // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicName: null == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fcmTokens: null == fcmTokens ? _self.fcmTokens : fcmTokens // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DoctorStats,lastSeenTier: null == lastSeenTier ? _self.lastSeenTier : lastSeenTier // ignore: cast_nullable_to_non_nullable
as String,lastSeenTierYear: null == lastSeenTierYear ? _self.lastSeenTierYear : lastSeenTierYear // ignore: cast_nullable_to_non_nullable
as int,mustChangePassword: null == mustChangePassword ? _self.mustChangePassword : mustChangePassword // ignore: cast_nullable_to_non_nullable
as bool,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,centerId: freezed == centerId ? _self.centerId : centerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorStatsCopyWith<$Res> get stats {
  
  return $DoctorStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String role,  String phone,  String authEmail,  String name,  String clinicName,  String location, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt,  List<String> fcmTokens,  DoctorStats stats,  String lastSeenTier,  int lastSeenTierYear,  bool mustChangePassword,  String accountType,  String? centerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.role,_that.phone,_that.authEmail,_that.name,_that.clinicName,_that.location,_that.createdAt,_that.updatedAt,_that.fcmTokens,_that.stats,_that.lastSeenTier,_that.lastSeenTierYear,_that.mustChangePassword,_that.accountType,_that.centerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String role,  String phone,  String authEmail,  String name,  String clinicName,  String location, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt,  List<String> fcmTokens,  DoctorStats stats,  String lastSeenTier,  int lastSeenTierYear,  bool mustChangePassword,  String accountType,  String? centerId)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.uid,_that.role,_that.phone,_that.authEmail,_that.name,_that.clinicName,_that.location,_that.createdAt,_that.updatedAt,_that.fcmTokens,_that.stats,_that.lastSeenTier,_that.lastSeenTierYear,_that.mustChangePassword,_that.accountType,_that.centerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String role,  String phone,  String authEmail,  String name,  String clinicName,  String location, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt,  List<String> fcmTokens,  DoctorStats stats,  String lastSeenTier,  int lastSeenTierYear,  bool mustChangePassword,  String accountType,  String? centerId)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.role,_that.phone,_that.authEmail,_that.name,_that.clinicName,_that.location,_that.createdAt,_that.updatedAt,_that.fcmTokens,_that.stats,_that.lastSeenTier,_that.lastSeenTierYear,_that.mustChangePassword,_that.accountType,_that.centerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile extends UserProfile {
  const _UserProfile({required this.uid, required this.role, required this.phone, required this.authEmail, required this.name, this.clinicName = '', this.location = '', @TimestampConverter() this.createdAt, @TimestampConverter() this.updatedAt,  List<String> fcmTokens = const <String>[], this.stats = DoctorStats.empty, this.lastSeenTier = 'silver', this.lastSeenTierYear = 0, this.mustChangePassword = false, this.accountType = 'solo', this.centerId}): _fcmTokens = fcmTokens,super._();
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String uid;
@override final  String role;
@override final  String phone;
@override final  String authEmail;
@override final  String name;
@override@JsonKey() final  String clinicName;
@override@JsonKey() final  String location;
@override@TimestampConverter() final  DateTime? createdAt;
@override@TimestampConverter() final  DateTime? updatedAt;
 final  List<String> _fcmTokens;
@override@JsonKey() List<String> get fcmTokens {
  if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fcmTokens);
}

@override@JsonKey() final  DoctorStats stats;
@override@JsonKey() final  String lastSeenTier;
@override@JsonKey() final  int lastSeenTierYear;
@override@JsonKey() final  bool mustChangePassword;
@override@JsonKey() final  String accountType;
@override final  String? centerId;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.authEmail, authEmail) || other.authEmail == authEmail)&&(identical(other.name, name) || other.name == name)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.location, location) || other.location == location)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._fcmTokens, _fcmTokens)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.lastSeenTier, lastSeenTier) || other.lastSeenTier == lastSeenTier)&&(identical(other.lastSeenTierYear, lastSeenTierYear) || other.lastSeenTierYear == lastSeenTierYear)&&(identical(other.mustChangePassword, mustChangePassword) || other.mustChangePassword == mustChangePassword)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.centerId, centerId) || other.centerId == centerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,role,phone,authEmail,name,clinicName,location,createdAt,updatedAt,const DeepCollectionEquality().hash(_fcmTokens),stats,lastSeenTier,lastSeenTierYear,mustChangePassword,accountType,centerId);

@override
String toString() {
  return 'UserProfile(uid: $uid, role: $role, phone: $phone, authEmail: $authEmail, name: $name, clinicName: $clinicName, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, fcmTokens: $fcmTokens, stats: $stats, lastSeenTier: $lastSeenTier, lastSeenTierYear: $lastSeenTierYear, mustChangePassword: $mustChangePassword, accountType: $accountType, centerId: $centerId)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String uid, String role, String phone, String authEmail, String name, String clinicName, String location,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt, List<String> fcmTokens, DoctorStats stats, String lastSeenTier, int lastSeenTierYear, bool mustChangePassword, String accountType, String? centerId
});


@override $DoctorStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? role = null,Object? phone = null,Object? authEmail = null,Object? name = null,Object? clinicName = null,Object? location = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? fcmTokens = null,Object? stats = null,Object? lastSeenTier = null,Object? lastSeenTierYear = null,Object? mustChangePassword = null,Object? accountType = null,Object? centerId = freezed,}) {
  return _then(_UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,authEmail: null == authEmail ? _self.authEmail : authEmail // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clinicName: null == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fcmTokens: null == fcmTokens ? _self._fcmTokens : fcmTokens // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DoctorStats,lastSeenTier: null == lastSeenTier ? _self.lastSeenTier : lastSeenTier // ignore: cast_nullable_to_non_nullable
as String,lastSeenTierYear: null == lastSeenTierYear ? _self.lastSeenTierYear : lastSeenTierYear // ignore: cast_nullable_to_non_nullable
as int,mustChangePassword: null == mustChangePassword ? _self.mustChangePassword : mustChangePassword // ignore: cast_nullable_to_non_nullable
as bool,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,centerId: freezed == centerId ? _self.centerId : centerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorStatsCopyWith<$Res> get stats {
  
  return $DoctorStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
