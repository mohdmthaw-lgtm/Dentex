import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../core/security/field_encryption.dart';
import '../../models/patient.dart';

/// Patient creation/mutation mirrors [OrderRepository]: the client only
/// ever writes the initiating patient/visit/payment document with the
/// derived stats left untouched (or zeroed), and the onVisitCreated /
/// onPatientPaymentCreated Cloud Functions triggers reconcile
/// [Patient.stats] and clinicStats/{ownerId} via FieldValue.increment —
/// never a client read-modify-write race.
///
/// `phoneEncrypted`/`allergiesEncrypted`/`chronicConditionsEncrypted` are
/// encrypted here (not by the UI layer) via [FieldEncryptionService], so
/// every call site gets the same guarantee automatically.
///
/// `visits` and `patientPayments` are top-level collections, not
/// patients/{id} subcollections — see [Visit]'s doc comment for why:
/// Firestore can't prove a `list` query safe against a rule that depends
/// on `resource.data` of a nested subcollection's own documents, with or
/// without a get()-on-parent rule, so cross-patient listing (the
/// accounting dashboard, transactions log) needs them flattened.
class PatientRepository {
  PatientRepository({
    FirebaseFirestore? firestore,
    FieldEncryptionService? encryption,
  })  : _db = firestore ?? FirebaseFirestore.instance,
        _encryption = encryption ?? const FieldEncryptionService();

  final FirebaseFirestore _db;
  final FieldEncryptionService _encryption;

  CollectionReference<Map<String, dynamic>> get _patients =>
      _db.collection(FirestorePaths.patients);
  CollectionReference<Map<String, dynamic>> get _visits =>
      _db.collection(FirestorePaths.visits);
  CollectionReference<Map<String, dynamic>> get _patientPayments =>
      _db.collection(FirestorePaths.patientPayments);

  Future<Patient> _decryptSensitiveFields(Patient patient) async {
    return patient.copyWith(
      phoneEncrypted: await _encryption.decryptField(patient.phoneEncrypted),
      allergiesEncrypted:
          await _encryption.decryptField(patient.allergiesEncrypted),
      chronicConditionsEncrypted:
          await _encryption.decryptField(patient.chronicConditionsEncrypted),
    );
  }

  /// Watches every patient owned by [ownerId] (a doctorId for a solo
  /// clinic, a centerId for a medical center — see [PatientOwnerType]),
  /// with sensitive fields already decrypted for display. Search/filtering
  /// happens client-side over this list (see patients_list_screen.dart) —
  /// encrypted fields aren't queryable, and a single clinic's patient list
  /// is small enough for this to be cheap.
  ///
  /// [ownerType] is filtered explicitly (not just present on the returned
  /// docs) because Firestore rejects a `list` query outright unless it can
  /// *statically prove* every possible matching document satisfies
  /// canAccessOwner — and since that rule's truth depends on ownerType,
  /// leaving it out of the query makes the whole query unprovable, not
  /// just quietly filtered. Every list query below needs the same
  /// treatment.
  Stream<List<Patient>> watchPatientsForOwner(String ownerId, String ownerType) {
    return _patients
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType)
        .orderBy('name')
        .snapshots()
        .asyncMap((snap) async {
      final patients =
          snap.docs.map((d) => Patient.fromDoc(d.id, d.data())).toList();
      return Future.wait(patients.map(_decryptSensitiveFields));
    });
  }

  Stream<Patient?> watchPatient(String patientId) {
    return _patients.doc(patientId).snapshots().asyncMap((doc) async {
      if (!doc.exists) return null;
      return _decryptSensitiveFields(Patient.fromDoc(doc.id, doc.data()!));
    });
  }

  /// A pre-generated doc id, reserved but not yet written — lets the
  /// caller create an appointment referencing this patientId *before* the
  /// patient doc itself exists (see patient_form_screen.dart's manager
  /// doctor-assignment flow), so onPatientCreated's notification trigger
  /// can find that appointment already committed instead of racing it.
  String reservePatientId() => _patients.doc().id;

  Future<String> createPatient({
    String? id,
    required String ownerId,
    required String ownerType,
    required String name,
    required String phone,
    DateTime? dob,
    String gender = '',
    String address = '',
    String allergies = '',
    String chronicConditions = '',
    required String createdByUid,
    String? assignedDoctorUid,
    String? assignedDoctorNameSnapshot,
  }) async {
    final ref = id == null ? _patients.doc() : _patients.doc(id);
    await ref.set({
      'ownerId': ownerId,
      'ownerType': ownerType,
      'name': name,
      'phoneEncrypted': await _encryption.encryptField(phone),
      'dob': dob == null ? null : Timestamp.fromDate(dob),
      'gender': gender,
      'address': address,
      'allergiesEncrypted': await _encryption.encryptField(allergies),
      'chronicConditionsEncrypted':
          await _encryption.encryptField(chronicConditions),
      'createdByUid': createdByUid,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'stats': {'totalPaid': 0, 'totalDebt': 0},
      'assignedDoctorUid': assignedDoctorUid,
      'assignedDoctorNameSnapshot': assignedDoctorNameSnapshot,
    });
    return ref.id;
  }

  Future<void> updatePatient({
    required String patientId,
    required String name,
    required String phone,
    DateTime? dob,
    String gender = '',
    String address = '',
    String allergies = '',
    String chronicConditions = '',
  }) async {
    await _patients.doc(patientId).update({
      'name': name,
      'phoneEncrypted': await _encryption.encryptField(phone),
      'dob': dob == null ? null : Timestamp.fromDate(dob),
      'gender': gender,
      'address': address,
      'allergiesEncrypted': await _encryption.encryptField(allergies),
      'chronicConditionsEncrypted':
          await _encryption.encryptField(chronicConditions),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Visit>> watchVisits(String patientId, String ownerId, String ownerType) {
    return _visits
        .where('patientId', isEqualTo: patientId)
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType)
        .orderBy('visitDate', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => Visit.fromDoc(d.id, d.data())).toList());
  }

  Future<void> recordVisit({
    required String patientId,
    required String ownerId,
    required String ownerType,
    String? toothNumber,
    required String treatmentType,
    String description = '',
    required num cost,
    required num paidAtVisit,
    bool followUpNeeded = false,
    required String createdByUid,
    DateTime? visitDate,
  }) async {
    final visitRef = _visits.doc();
    await visitRef.set({
      'ownerId': ownerId,
      'ownerType': ownerType,
      'patientId': patientId,
      'toothNumber': toothNumber,
      'treatmentType': treatmentType,
      'description': description,
      'cost': cost,
      'paidAtVisit': paidAtVisit,
      'followUpNeeded': followUpNeeded,
      'visitDate': visitDate == null
          ? FieldValue.serverTimestamp()
          : Timestamp.fromDate(visitDate),
      'createdByUid': createdByUid,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<PatientPayment>> watchPayments(
      String patientId, String ownerId, String ownerType) {
    return _patientPayments
        .where('patientId', isEqualTo: patientId)
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType)
        .orderBy('recordedAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => PatientPayment.fromDoc(d.id, d.data()))
            .toList());
  }

  Future<void> recordPayment({
    required String patientId,
    required String ownerId,
    required String ownerType,
    required num amount,
    required String recordedByUid,
    String method = 'cash',
    String note = '',
  }) {
    final paymentRef = _patientPayments.doc();
    return paymentRef.set({
      'ownerId': ownerId,
      'ownerType': ownerType,
      'patientId': patientId,
      'amount': amount,
      'method': method,
      'recordedByUid': recordedByUid,
      'recordedAt': FieldValue.serverTimestamp(),
      'note': note,
    });
  }

  /// Every visit across every patient owned by [ownerId] within
  /// [start, end) — powers the accounting dashboard ("income this month",
  /// "patients today", via computeClinicSummary) and the transactions
  /// screen.
  Stream<List<Visit>> watchVisitsForOwner(
    String ownerId,
    String ownerType, {
    DateTime? start,
    DateTime? end,
  }) {
    Query<Map<String, dynamic>> query = _visits
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType);
    if (start != null) {
      query = query.where('visitDate', isGreaterThanOrEqualTo: Timestamp.fromDate(start));
    }
    if (end != null) {
      query = query.where('visitDate', isLessThan: Timestamp.fromDate(end));
    }
    return query
        .orderBy('visitDate', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => Visit.fromDoc(d.id, d.data())).toList());
  }

  /// Same idea as [watchVisitsForOwner] but over every patient payment —
  /// together the two feed computeClinicSummary and the transactions log.
  Stream<List<PatientPayment>> watchPaymentsForOwner(
    String ownerId,
    String ownerType, {
    DateTime? start,
    DateTime? end,
  }) {
    Query<Map<String, dynamic>> query = _patientPayments
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType);
    if (start != null) {
      query = query.where('recordedAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start));
    }
    if (end != null) {
      query = query.where('recordedAt', isLessThan: Timestamp.fromDate(end));
    }
    return query
        .orderBy('recordedAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => PatientPayment.fromDoc(d.id, d.data())).toList());
  }

  /// Every patient across [ownerId] with an outstanding balance, for the
  /// debts screen — sorted by amount owed (highest first).
  Stream<List<Patient>> watchDebtors(String ownerId, String ownerType) {
    return watchPatientsForOwner(ownerId, ownerType).map((patients) {
      final debtors =
          patients.where((p) => p.stats.totalDebt > 0).toList();
      debtors.sort((a, b) => b.stats.totalDebt.compareTo(a.stats.totalDebt));
      return debtors;
    });
  }
}
