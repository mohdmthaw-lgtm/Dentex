import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'doctor_stats.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String role, // AppRoles.admin | AppRoles.doctor
    required String phone,
    required String authEmail,
    required String name,
    @Default('') String clinicName,
    @Default('') String location,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(<String>[]) List<String> fcmTokens,
    @Default(DoctorStats.empty) DoctorStats stats,
    // Tier-upgrade detection cursor only — NOT the doctor's current tier.
    // The current tier is always recomputed live from this year's orders
    // (see computeDoctorTierInfo); these two fields exist solely so the
    // onOrderCreated Cloud Function can tell "upgraded within this year"
    // apart from "a new year silently reset everyone to silver".
    @Default('silver') String lastSeenTier,
    @Default(0) int lastSeenTierYear,
    // Set when an admin (not the doctor) chose this account's password —
    // e.g. the walk-in order flow — so the doctor is forced to a
    // change-password screen on first login and ends up the sole holder of
    // their real password. See createDoctorAccount Cloud Function.
    @Default(false) bool mustChangePassword,
    // 'solo' | 'center' — see MedicalCenter. Defaults to 'solo' for every
    // pre-existing doctor doc (no backfill migration needed). Orders, debt,
    // and loyalty tier are always per-doctor regardless of accountType; only
    // patient records (lib/models/patient.dart) are shared when centerId is
    // set.
    @Default('solo') String accountType,
    String? centerId,
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.fromDoc(String id, Map<String, dynamic> data) =>
      UserProfile.fromJson({...data, 'uid': id});

  bool get isAdmin => role == 'admin';
  bool get isDoctor => role == 'doctor';
  bool get isCenterMember => centerId != null;

  /// The key patient records are scoped by (see PatientOwnerType) — a
  /// centerId when this doctor belongs to a medical center (patients are
  /// shared with every other member), otherwise this doctor's own uid.
  String get clinicOwnerId => centerId ?? uid;
  String get clinicOwnerType => isCenterMember ? 'center' : 'doctor';
}
