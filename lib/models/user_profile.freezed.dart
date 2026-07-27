// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get uid => throw _privateConstructorUsedError;
  String get role =>
      throw _privateConstructorUsedError; // AppRoles.admin | AppRoles.doctor
  String get phone => throw _privateConstructorUsedError;
  String get authEmail => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get clinicName => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String> get fcmTokens => throw _privateConstructorUsedError;
  DoctorStats get stats =>
      throw _privateConstructorUsedError; // Tier-upgrade detection cursor only — NOT the doctor's current tier.
// The current tier is always recomputed live from this year's orders
// (see computeDoctorTierInfo); these two fields exist solely so the
// onOrderCreated Cloud Function can tell "upgraded within this year"
// apart from "a new year silently reset everyone to silver".
  String get lastSeenTier => throw _privateConstructorUsedError;
  int get lastSeenTierYear => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String uid,
      String role,
      String phone,
      String authEmail,
      String name,
      String clinicName,
      String location,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      List<String> fcmTokens,
      DoctorStats stats,
      String lastSeenTier,
      int lastSeenTierYear});

  $DoctorStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? role = null,
    Object? phone = null,
    Object? authEmail = null,
    Object? name = null,
    Object? clinicName = null,
    Object? location = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? fcmTokens = null,
    Object? stats = null,
    Object? lastSeenTier = null,
    Object? lastSeenTierYear = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      authEmail: null == authEmail
          ? _value.authEmail
          : authEmail // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      clinicName: null == clinicName
          ? _value.clinicName
          : clinicName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fcmTokens: null == fcmTokens
          ? _value.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DoctorStats,
      lastSeenTier: null == lastSeenTier
          ? _value.lastSeenTier
          : lastSeenTier // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeenTierYear: null == lastSeenTierYear
          ? _value.lastSeenTierYear
          : lastSeenTierYear // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorStatsCopyWith<$Res> get stats {
    return $DoctorStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String role,
      String phone,
      String authEmail,
      String name,
      String clinicName,
      String location,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      List<String> fcmTokens,
      DoctorStats stats,
      String lastSeenTier,
      int lastSeenTierYear});

  @override
  $DoctorStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? role = null,
    Object? phone = null,
    Object? authEmail = null,
    Object? name = null,
    Object? clinicName = null,
    Object? location = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? fcmTokens = null,
    Object? stats = null,
    Object? lastSeenTier = null,
    Object? lastSeenTierYear = null,
  }) {
    return _then(_$UserProfileImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      authEmail: null == authEmail
          ? _value.authEmail
          : authEmail // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      clinicName: null == clinicName
          ? _value.clinicName
          : clinicName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fcmTokens: null == fcmTokens
          ? _value._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DoctorStats,
      lastSeenTier: null == lastSeenTier
          ? _value.lastSeenTier
          : lastSeenTier // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeenTierYear: null == lastSeenTierYear
          ? _value.lastSeenTierYear
          : lastSeenTierYear // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl extends _UserProfile {
  const _$UserProfileImpl(
      {required this.uid,
      required this.role,
      required this.phone,
      required this.authEmail,
      required this.name,
      this.clinicName = '',
      this.location = '',
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      final List<String> fcmTokens = const <String>[],
      this.stats = DoctorStats.empty,
      this.lastSeenTier = 'silver',
      this.lastSeenTierYear = 0})
      : _fcmTokens = fcmTokens,
        super._();

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String uid;
  @override
  final String role;
// AppRoles.admin | AppRoles.doctor
  @override
  final String phone;
  @override
  final String authEmail;
  @override
  final String name;
  @override
  @JsonKey()
  final String clinicName;
  @override
  @JsonKey()
  final String location;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  final List<String> _fcmTokens;
  @override
  @JsonKey()
  List<String> get fcmTokens {
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fcmTokens);
  }

  @override
  @JsonKey()
  final DoctorStats stats;
// Tier-upgrade detection cursor only — NOT the doctor's current tier.
// The current tier is always recomputed live from this year's orders
// (see computeDoctorTierInfo); these two fields exist solely so the
// onOrderCreated Cloud Function can tell "upgraded within this year"
// apart from "a new year silently reset everyone to silver".
  @override
  @JsonKey()
  final String lastSeenTier;
  @override
  @JsonKey()
  final int lastSeenTierYear;

  @override
  String toString() {
    return 'UserProfile(uid: $uid, role: $role, phone: $phone, authEmail: $authEmail, name: $name, clinicName: $clinicName, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, fcmTokens: $fcmTokens, stats: $stats, lastSeenTier: $lastSeenTier, lastSeenTierYear: $lastSeenTierYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.authEmail, authEmail) ||
                other.authEmail == authEmail) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._fcmTokens, _fcmTokens) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.lastSeenTier, lastSeenTier) ||
                other.lastSeenTier == lastSeenTier) &&
            (identical(other.lastSeenTierYear, lastSeenTierYear) ||
                other.lastSeenTierYear == lastSeenTierYear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      role,
      phone,
      authEmail,
      name,
      clinicName,
      location,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_fcmTokens),
      stats,
      lastSeenTier,
      lastSeenTierYear);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile extends UserProfile {
  const factory _UserProfile(
      {required final String uid,
      required final String role,
      required final String phone,
      required final String authEmail,
      required final String name,
      final String clinicName,
      final String location,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt,
      final List<String> fcmTokens,
      final DoctorStats stats,
      final String lastSeenTier,
      final int lastSeenTierYear}) = _$UserProfileImpl;
  const _UserProfile._() : super._();

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get uid;
  @override
  String get role; // AppRoles.admin | AppRoles.doctor
  @override
  String get phone;
  @override
  String get authEmail;
  @override
  String get name;
  @override
  String get clinicName;
  @override
  String get location;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  List<String> get fcmTokens;
  @override
  DoctorStats
      get stats; // Tier-upgrade detection cursor only — NOT the doctor's current tier.
// The current tier is always recomputed live from this year's orders
// (see computeDoctorTierInfo); these two fields exist solely so the
// onOrderCreated Cloud Function can tell "upgraded within this year"
// apart from "a new year silently reset everyone to silver".
  @override
  String get lastSeenTier;
  @override
  int get lastSeenTierYear;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
