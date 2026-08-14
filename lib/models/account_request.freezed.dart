// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountRequest _$AccountRequestFromJson(Map<String, dynamic> json) {
  return _AccountRequest.fromJson(json);
}

/// @nodoc
mixin _$AccountRequest {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone =>
      throw _privateConstructorUsedError; // Chosen by the doctor themselves at request time (not the admin) —
// used as-is when the admin approves and createDoctorAccount runs, then
// cleared from this doc (see AccountRequestRepository.markApproved).
// Only ever readable by an admin (see firestore.rules); a prospective
// doctor can create their own request doc but never read any request
// back, including their own.
  String get password => throw _privateConstructorUsedError;
  String get clinicName => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AccountRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountRequestCopyWith<AccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountRequestCopyWith<$Res> {
  factory $AccountRequestCopyWith(
          AccountRequest value, $Res Function(AccountRequest) then) =
      _$AccountRequestCopyWithImpl<$Res, AccountRequest>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String password,
      String clinicName,
      String location,
      String notes,
      String status,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$AccountRequestCopyWithImpl<$Res, $Val extends AccountRequest>
    implements $AccountRequestCopyWith<$Res> {
  _$AccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? password = null,
    Object? clinicName = null,
    Object? location = null,
    Object? notes = null,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      clinicName: null == clinicName
          ? _value.clinicName
          : clinicName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountRequestImplCopyWith<$Res>
    implements $AccountRequestCopyWith<$Res> {
  factory _$$AccountRequestImplCopyWith(_$AccountRequestImpl value,
          $Res Function(_$AccountRequestImpl) then) =
      __$$AccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String password,
      String clinicName,
      String location,
      String notes,
      String status,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$AccountRequestImplCopyWithImpl<$Res>
    extends _$AccountRequestCopyWithImpl<$Res, _$AccountRequestImpl>
    implements _$$AccountRequestImplCopyWith<$Res> {
  __$$AccountRequestImplCopyWithImpl(
      _$AccountRequestImpl _value, $Res Function(_$AccountRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? password = null,
    Object? clinicName = null,
    Object? location = null,
    Object? notes = null,
    Object? status = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$AccountRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      clinicName: null == clinicName
          ? _value.clinicName
          : clinicName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountRequestImpl implements _AccountRequest {
  const _$AccountRequestImpl(
      {required this.id,
      required this.name,
      required this.phone,
      this.password = '',
      this.clinicName = '',
      this.location = '',
      this.notes = '',
      this.status = AccountRequestStatus.pending,
      @TimestampConverter() this.createdAt});

  factory _$AccountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
// Chosen by the doctor themselves at request time (not the admin) —
// used as-is when the admin approves and createDoctorAccount runs, then
// cleared from this doc (see AccountRequestRepository.markApproved).
// Only ever readable by an admin (see firestore.rules); a prospective
// doctor can create their own request doc but never read any request
// back, including their own.
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String clinicName;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final String status;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AccountRequest(id: $id, name: $name, phone: $phone, password: $password, clinicName: $clinicName, location: $location, notes: $notes, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, password,
      clinicName, location, notes, status, createdAt);

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountRequestImplCopyWith<_$AccountRequestImpl> get copyWith =>
      __$$AccountRequestImplCopyWithImpl<_$AccountRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountRequestImplToJson(
      this,
    );
  }
}

abstract class _AccountRequest implements AccountRequest {
  const factory _AccountRequest(
      {required final String id,
      required final String name,
      required final String phone,
      final String password,
      final String clinicName,
      final String location,
      final String notes,
      final String status,
      @TimestampConverter() final DateTime? createdAt}) = _$AccountRequestImpl;

  factory _AccountRequest.fromJson(Map<String, dynamic> json) =
      _$AccountRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String
      get phone; // Chosen by the doctor themselves at request time (not the admin) —
// used as-is when the admin approves and createDoctorAccount runs, then
// cleared from this doc (see AccountRequestRepository.markApproved).
// Only ever readable by an admin (see firestore.rules); a prospective
// doctor can create their own request doc but never read any request
// back, including their own.
  @override
  String get password;
  @override
  String get clinicName;
  @override
  String get location;
  @override
  String get notes;
  @override
  String get status;
  @override
  @TimestampConverter()
  DateTime? get createdAt;

  /// Create a copy of AccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountRequestImplCopyWith<_$AccountRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
