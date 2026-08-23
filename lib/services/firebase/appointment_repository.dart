import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/appointment.dart';
import '../../models/patient.dart';

/// Pure CRUD, unlike [PatientRepository] — appointments don't feed any
/// denormalized aggregate, so there's no Cloud Functions trigger involved.
class AppointmentRepository {
  AppointmentRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _appointments =>
      _db.collection(FirestorePaths.appointments);

  /// [start, end) range over `scheduledAt` — the weekly strip/timeline
  /// screen passes a week's bounds; the "آخر موعد اليوم" card and daily
  /// view pass a single day's.
  /// [ownerType] is filtered explicitly, not just present on the returned
  /// docs — see PatientRepository.watchPatientsForOwner's doc comment for
  /// why a `list` query needs it in the query itself, not only in the rule.
  Stream<List<Appointment>> watchAppointmentsForOwner(
    String ownerId,
    String ownerType, {
    required DateTime start,
    required DateTime end,
  }) {
    return _appointments
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType)
        .where('scheduledAt', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('scheduledAt', isLessThan: Timestamp.fromDate(end))
        .orderBy('scheduledAt')
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => Appointment.fromDoc(d.id, d.data())).toList());
  }

  /// Every future scheduled appointment for [ownerId], unbounded — used to
  /// work out which patients already have something booked (see
  /// computeFollowUpCandidates), independent of which week/day is on
  /// screen.
  Stream<List<Appointment>> watchUpcomingAppointments(String ownerId, String ownerType) {
    return _appointments
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType)
        .where('scheduledAt', isGreaterThanOrEqualTo: Timestamp.now())
        .orderBy('scheduledAt')
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => Appointment.fromDoc(d.id, d.data())).toList());
  }

  Future<String> createAppointment({
    required String ownerId,
    required String ownerType,
    required String patientId,
    required String patientNameSnapshot,
    required DateTime scheduledAt,
    String expectedTreatmentType = TreatmentType.other,
    String notes = '',
    required String createdByUid,
    String? assignedDoctorUid,
  }) async {
    final ref = _appointments.doc();
    await ref.set({
      'ownerId': ownerId,
      'ownerType': ownerType,
      'patientId': patientId,
      'patientNameSnapshot': patientNameSnapshot,
      'scheduledAt': Timestamp.fromDate(scheduledAt),
      'expectedTreatmentType': expectedTreatmentType,
      'status': AppointmentStatus.scheduled,
      'notes': notes,
      'createdByUid': createdByUid,
      'createdAt': FieldValue.serverTimestamp(),
      'assignedDoctorUid': assignedDoctorUid,
      'reminderSent': false,
    });
    return ref.id;
  }

  Future<void> updateStatus(String appointmentId, String status) {
    return _appointments.doc(appointmentId).update({'status': status});
  }

  /// "تأجيل الموعد" — moves an existing appointment to a new date/time
  /// without touching its status (still 'scheduled').
  Future<void> reschedule(String appointmentId, DateTime newScheduledAt) {
    // reminderSent resets too — otherwise an appointment moved after its
    // 30-minute reminder already fired would silently never remind again
    // for the new time (sendAppointmentReminders skips reminderSent==true).
    return _appointments.doc(appointmentId).update({
      'scheduledAt': Timestamp.fromDate(newScheduledAt),
      'reminderSent': false,
    });
  }
}
