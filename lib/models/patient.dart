import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'patient_stats.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

/// Who a patient record belongs to: a single doctor's own clinic, or a
/// [MedicalCenter] shared by several doctors. See [PatientOwnerType].
@freezed
abstract class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String ownerId,
    @Default(PatientOwnerType.doctor) String ownerType,
    required String name,
    // AES-GCM ciphertext (see FieldEncryptionService) — never plaintext at
    // rest, unlike the rest of this doc's fields.
    @Default('') String phoneEncrypted,
    @NullableTimestampConverter() DateTime? dob,
    @Default('') String gender,
    @Default('') String address,
    @Default('') String allergiesEncrypted,
    @Default('') String chronicConditionsEncrypted,
    required String createdByUid,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @Default(PatientStats.empty) PatientStats stats,
    // Set only when a medical center's manager creates a patient on behalf
    // of a specific member doctor (see patient_form_screen.dart's doctor
    // picker, manager-only) — triggers onPatientCreated's assignment
    // notification. Null for every solo-clinic patient and for a center
    // patient a non-manager doctor creates for themselves.
    String? assignedDoctorUid,
    // Denormalized alongside assignedDoctorUid so the notification (and
    // any future display) never needs a cross-user Firestore read — same
    // reasoning as Order.doctorNameSnapshot.
    String? assignedDoctorNameSnapshot,
  }) = _Patient;

  const Patient._();

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  factory Patient.fromDoc(String id, Map<String, dynamic> data) =>
      Patient.fromJson({...data, 'id': id});

  bool get isCenterOwned => ownerType == PatientOwnerType.center;
}

class PatientOwnerType {
  PatientOwnerType._();

  static const doctor = 'doctor';
  static const center = 'center';
}

/// Top-level `visits` collection (NOT a patients/{id}/visits subcollection
/// — deliberately). Firestore can only prove a `list` query safe against a
/// security rule that depends on `resource.data` when the queried
/// collection is NOT nested inside another document with an unused path
/// wildcard; a get()-on-parent rule doesn't help either, since collection
/// group queries need a *different* parent per matched document, which
/// Firestore's list-safety check won't allow. Confirmed empirically — see
/// firestore.rules' comment on `match /visits/{visitId}`. ownerId/ownerType
/// are still carried directly (not just patientId) so every query can
/// filter on the exact fields the rule checks.
@freezed
abstract class Visit with _$Visit {
  const factory Visit({
    required String id,
    required String ownerId,
    @Default(PatientOwnerType.doctor) String ownerType,
    // Denormalized from the parent patient doc — lets the accounting
    // dashboard's collectionGroup('visits') query count distinct patients
    // seen today without an extra per-visit fetch.
    required String patientId,
    String? toothNumber,
    @Default(TreatmentType.other) String treatmentType,
    @Default('') String description,
    @Default(0) num cost,
    @Default(0) num paidAtVisit,
    // Doctor-set flag: this treatment isn't finished (e.g. a root canal
    // needing another session) — feeds the appointments screen's "متابعات
    // مطلوبة" list (see computeFollowUpCandidates) until a future
    // appointment is booked for this patient.
    @Default(false) bool followUpNeeded,
    @TimestampConverter() DateTime? visitDate,
    required String createdByUid,
    @TimestampConverter() DateTime? createdAt,
  }) = _Visit;

  factory Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);

  factory Visit.fromDoc(String id, Map<String, dynamic> data) =>
      Visit.fromJson({...data, 'id': id});
}

class TreatmentType {
  TreatmentType._();

  static const cleaning = 'cleaning';
  static const filling = 'filling';
  static const extraction = 'extraction';
  static const rootCanal = 'rootCanal';
  static const crown = 'crown';
  static const other = 'other';

  static const all = [cleaning, filling, extraction, rootCanal, crown, other];

  static const labels = {
    cleaning: 'تنظيف',
    filling: 'حشوة',
    extraction: 'خلع',
    rootCanal: 'قناة جذر',
    crown: 'تلبيسة',
    other: 'أخرى',
  };
}

/// Top-level `patientPayments` collection — append-only ledger, same
/// "why top-level, not nested" reasoning as [Visit] above. Named distinctly
/// from orders/{id}/payments (which stays nested — a single, fixed-path
/// subcollection list is fine; only cross-patient listing needed the
/// top-level restructuring).
@freezed
abstract class PatientPayment with _$PatientPayment {
  const factory PatientPayment({
    required String id,
    required String ownerId,
    @Default(PatientOwnerType.doctor) String ownerType,
    required String patientId,
    required num amount,
    @Default('cash') String method,
    required String recordedByUid,
    @TimestampConverter() DateTime? recordedAt,
    @Default('') String note,
  }) = _PatientPayment;

  factory PatientPayment.fromJson(Map<String, dynamic> json) =>
      _$PatientPaymentFromJson(json);

  factory PatientPayment.fromDoc(String id, Map<String, dynamic> data) =>
      PatientPayment.fromJson({...data, 'id': id});
}
