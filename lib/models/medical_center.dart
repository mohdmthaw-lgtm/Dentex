import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'medical_center.freezed.dart';
part 'medical_center.g.dart';

/// medicalCenters/{centerId} — a shared practice housing several
/// independent doctor accounts (see [UserProfile.centerId]). Only patient
/// records are shared across member doctors; orders/debt/loyalty tier stay
/// entirely per-doctor. Created by the admin while approving a 'center'
/// [AccountRequest] — never written by clients directly.
@freezed
abstract class MedicalCenter with _$MedicalCenter {
  const factory MedicalCenter({
    required String id,
    required String name,
    @Default(1) int chairCount,
    @Default(<String>[]) List<String> memberUids,
    // uid -> display name, kept in lockstep with memberUids. Lets the
    // manager-only doctor picker in patient_form_screen.dart show names
    // without a cross-user `users` read, which firestore.rules doesn't
    // grant to non-admin doctors (users/{uid} is admin-or-self only).
    @Default(<String, String>{}) Map<String, String> memberNames,
    required String managerUid,
    @TimestampConverter() DateTime? createdAt,
  }) = _MedicalCenter;

  factory MedicalCenter.fromJson(Map<String, dynamic> json) =>
      _$MedicalCenterFromJson(json);

  factory MedicalCenter.fromDoc(String id, Map<String, dynamic> data) =>
      MedicalCenter.fromJson({...data, 'id': id});
}
