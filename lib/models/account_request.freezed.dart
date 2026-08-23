// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountRequest {

 String get id; String get name; String get phone; String get password; String get clinicName; String get location; String get notes; String get status;@TimestampConverter() DateTime? get createdAt; String get accountType; String get centerName; int get chairCount; List<AccountRequestDoctor> get doctors;
/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountRequestCopyWith<AccountRequest> get copyWith => _$AccountRequestCopyWithImpl<AccountRequest>(this as AccountRequest, _$identity);

  /// Serializes this AccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.centerName, centerName) || other.centerName == centerName)&&(identical(other.chairCount, chairCount) || other.chairCount == chairCount)&&const DeepCollectionEquality().equals(other.doctors, doctors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,password,clinicName,location,notes,status,createdAt,accountType,centerName,chairCount,const DeepCollectionEquality().hash(doctors));

@override
String toString() {
  return 'AccountRequest(id: $id, name: $name, phone: $phone, password: $password, clinicName: $clinicName, location: $location, notes: $notes, status: $status, createdAt: $createdAt, accountType: $accountType, centerName: $centerName, chairCount: $chairCount, doctors: $doctors)';
}


}

/// @nodoc
abstract mixin class $AccountRequestCopyWith<$Res>  {
  factory $AccountRequestCopyWith(AccountRequest value, $Res Function(AccountRequest) _then) = _$AccountRequestCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone, String password, String clinicName, String location, String notes, String status,@TimestampConverter() DateTime? createdAt, String accountType, String centerName, int chairCount, List<AccountRequestDoctor> doctors
});




}
/// @nodoc
class _$AccountRequestCopyWithImpl<$Res>
    implements $AccountRequestCopyWith<$Res> {
  _$AccountRequestCopyWithImpl(this._self, this._then);

  final AccountRequest _self;
  final $Res Function(AccountRequest) _then;

/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? password = null,Object? clinicName = null,Object? location = null,Object? notes = null,Object? status = null,Object? createdAt = freezed,Object? accountType = null,Object? centerName = null,Object? chairCount = null,Object? doctors = null,}) {
  return _then(AccountRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,clinicName: null == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,centerName: null == centerName ? _self.centerName : centerName // ignore: cast_nullable_to_non_nullable
as String,chairCount: null == chairCount ? _self.chairCount : chairCount // ignore: cast_nullable_to_non_nullable
as int,doctors: null == doctors ? _self.doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<AccountRequestDoctor>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountRequest].
extension AccountRequestPatterns on AccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountRequest value)  $default,){
final _that = this;
switch (_that) {
case _AccountRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String password,  String clinicName,  String location,  String notes,  String status, @TimestampConverter()  DateTime? createdAt,  String accountType,  String centerName,  int chairCount,  List<AccountRequestDoctor> doctors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.password,_that.clinicName,_that.location,_that.notes,_that.status,_that.createdAt,_that.accountType,_that.centerName,_that.chairCount,_that.doctors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String password,  String clinicName,  String location,  String notes,  String status, @TimestampConverter()  DateTime? createdAt,  String accountType,  String centerName,  int chairCount,  List<AccountRequestDoctor> doctors)  $default,) {final _that = this;
switch (_that) {
case _AccountRequest():
return $default(_that.id,_that.name,_that.phone,_that.password,_that.clinicName,_that.location,_that.notes,_that.status,_that.createdAt,_that.accountType,_that.centerName,_that.chairCount,_that.doctors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone,  String password,  String clinicName,  String location,  String notes,  String status, @TimestampConverter()  DateTime? createdAt,  String accountType,  String centerName,  int chairCount,  List<AccountRequestDoctor> doctors)?  $default,) {final _that = this;
switch (_that) {
case _AccountRequest() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.password,_that.clinicName,_that.location,_that.notes,_that.status,_that.createdAt,_that.accountType,_that.centerName,_that.chairCount,_that.doctors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountRequest implements AccountRequest {
  const _AccountRequest({required this.id, required this.name, required this.phone, this.password = '', this.clinicName = '', this.location = '', this.notes = '', this.status = AccountRequestStatus.pending, @TimestampConverter() this.createdAt, this.accountType = AccountRequestType.solo, this.centerName = '', this.chairCount = 1,  List<AccountRequestDoctor> doctors = const <AccountRequestDoctor>[]}): _doctors = doctors;
  factory _AccountRequest.fromJson(Map<String, dynamic> json) => _$AccountRequestFromJson(json);

@override final  String id;
@override final  String name;
@override final  String phone;
@override@JsonKey() final  String password;
@override@JsonKey() final  String clinicName;
@override@JsonKey() final  String location;
@override@JsonKey() final  String notes;
@override@JsonKey() final  String status;
@override@TimestampConverter() final  DateTime? createdAt;
@override@JsonKey() final  String accountType;
@override@JsonKey() final  String centerName;
@override@JsonKey() final  int chairCount;
 final  List<AccountRequestDoctor> _doctors;
@override@JsonKey() List<AccountRequestDoctor> get doctors {
  if (_doctors is EqualUnmodifiableListView) return _doctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctors);
}


/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountRequestCopyWith<_AccountRequest> get copyWith => __$AccountRequestCopyWithImpl<_AccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName)&&(identical(other.location, location) || other.location == location)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.centerName, centerName) || other.centerName == centerName)&&(identical(other.chairCount, chairCount) || other.chairCount == chairCount)&&const DeepCollectionEquality().equals(other._doctors, _doctors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,password,clinicName,location,notes,status,createdAt,accountType,centerName,chairCount,const DeepCollectionEquality().hash(_doctors));

@override
String toString() {
  return 'AccountRequest(id: $id, name: $name, phone: $phone, password: $password, clinicName: $clinicName, location: $location, notes: $notes, status: $status, createdAt: $createdAt, accountType: $accountType, centerName: $centerName, chairCount: $chairCount, doctors: $doctors)';
}


}

/// @nodoc
abstract mixin class _$AccountRequestCopyWith<$Res> implements $AccountRequestCopyWith<$Res> {
  factory _$AccountRequestCopyWith(_AccountRequest value, $Res Function(_AccountRequest) _then) = __$AccountRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone, String password, String clinicName, String location, String notes, String status,@TimestampConverter() DateTime? createdAt, String accountType, String centerName, int chairCount, List<AccountRequestDoctor> doctors
});




}
/// @nodoc
class __$AccountRequestCopyWithImpl<$Res>
    implements _$AccountRequestCopyWith<$Res> {
  __$AccountRequestCopyWithImpl(this._self, this._then);

  final _AccountRequest _self;
  final $Res Function(_AccountRequest) _then;

/// Create a copy of AccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? password = null,Object? clinicName = null,Object? location = null,Object? notes = null,Object? status = null,Object? createdAt = freezed,Object? accountType = null,Object? centerName = null,Object? chairCount = null,Object? doctors = null,}) {
  return _then(_AccountRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,clinicName: null == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,centerName: null == centerName ? _self.centerName : centerName // ignore: cast_nullable_to_non_nullable
as String,chairCount: null == chairCount ? _self.chairCount : chairCount // ignore: cast_nullable_to_non_nullable
as int,doctors: null == doctors ? _self._doctors : doctors // ignore: cast_nullable_to_non_nullable
as List<AccountRequestDoctor>,
  ));
}


}


/// @nodoc
mixin _$AccountRequestDoctor {

 String get name; String get phone; String get password; bool get isManager;
/// Create a copy of AccountRequestDoctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountRequestDoctorCopyWith<AccountRequestDoctor> get copyWith => _$AccountRequestDoctorCopyWithImpl<AccountRequestDoctor>(this as AccountRequestDoctor, _$identity);

  /// Serializes this AccountRequestDoctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountRequestDoctor&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.isManager, isManager) || other.isManager == isManager));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,password,isManager);

@override
String toString() {
  return 'AccountRequestDoctor(name: $name, phone: $phone, password: $password, isManager: $isManager)';
}


}

/// @nodoc
abstract mixin class $AccountRequestDoctorCopyWith<$Res>  {
  factory $AccountRequestDoctorCopyWith(AccountRequestDoctor value, $Res Function(AccountRequestDoctor) _then) = _$AccountRequestDoctorCopyWithImpl;
@useResult
$Res call({
 String name, String phone, String password, bool isManager
});




}
/// @nodoc
class _$AccountRequestDoctorCopyWithImpl<$Res>
    implements $AccountRequestDoctorCopyWith<$Res> {
  _$AccountRequestDoctorCopyWithImpl(this._self, this._then);

  final AccountRequestDoctor _self;
  final $Res Function(AccountRequestDoctor) _then;

/// Create a copy of AccountRequestDoctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = null,Object? password = null,Object? isManager = null,}) {
  return _then(AccountRequestDoctor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountRequestDoctor].
extension AccountRequestDoctorPatterns on AccountRequestDoctor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountRequestDoctor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountRequestDoctor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountRequestDoctor value)  $default,){
final _that = this;
switch (_that) {
case _AccountRequestDoctor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountRequestDoctor value)?  $default,){
final _that = this;
switch (_that) {
case _AccountRequestDoctor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phone,  String password,  bool isManager)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountRequestDoctor() when $default != null:
return $default(_that.name,_that.phone,_that.password,_that.isManager);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phone,  String password,  bool isManager)  $default,) {final _that = this;
switch (_that) {
case _AccountRequestDoctor():
return $default(_that.name,_that.phone,_that.password,_that.isManager);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phone,  String password,  bool isManager)?  $default,) {final _that = this;
switch (_that) {
case _AccountRequestDoctor() when $default != null:
return $default(_that.name,_that.phone,_that.password,_that.isManager);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountRequestDoctor implements AccountRequestDoctor {
  const _AccountRequestDoctor({required this.name, required this.phone, required this.password, this.isManager = false});
  factory _AccountRequestDoctor.fromJson(Map<String, dynamic> json) => _$AccountRequestDoctorFromJson(json);

@override final  String name;
@override final  String phone;
@override final  String password;
@override@JsonKey() final  bool isManager;

/// Create a copy of AccountRequestDoctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountRequestDoctorCopyWith<_AccountRequestDoctor> get copyWith => __$AccountRequestDoctorCopyWithImpl<_AccountRequestDoctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountRequestDoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountRequestDoctor&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.isManager, isManager) || other.isManager == isManager));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,password,isManager);

@override
String toString() {
  return 'AccountRequestDoctor(name: $name, phone: $phone, password: $password, isManager: $isManager)';
}


}

/// @nodoc
abstract mixin class _$AccountRequestDoctorCopyWith<$Res> implements $AccountRequestDoctorCopyWith<$Res> {
  factory _$AccountRequestDoctorCopyWith(_AccountRequestDoctor value, $Res Function(_AccountRequestDoctor) _then) = __$AccountRequestDoctorCopyWithImpl;
@override @useResult
$Res call({
 String name, String phone, String password, bool isManager
});




}
/// @nodoc
class __$AccountRequestDoctorCopyWithImpl<$Res>
    implements _$AccountRequestDoctorCopyWith<$Res> {
  __$AccountRequestDoctorCopyWithImpl(this._self, this._then);

  final _AccountRequestDoctor _self;
  final $Res Function(_AccountRequestDoctor) _then;

/// Create a copy of AccountRequestDoctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? password = null,Object? isManager = null,}) {
  return _then(_AccountRequestDoctor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
