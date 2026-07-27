import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'doctor_stats.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
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
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.fromDoc(String id, Map<String, dynamic> data) =>
      UserProfile.fromJson({...data, 'uid': id});

  bool get isAdmin => role == 'admin';
  bool get isDoctor => role == 'doctor';
}
