import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'patient.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

/// appointments/{appointmentId} — a top-level collection (like [Patient],
/// not nested under it) so day/week range queries over `scheduledAt` don't
/// need a collectionGroup query. `patientNameSnapshot` is denormalized so
/// the appointments screen's weekly timeline never needs an extra
/// per-appointment patient fetch just to render a name.
@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    required String id,
    required String ownerId,
    @Default(PatientOwnerType.doctor) String ownerType,
    required String patientId,
    required String patientNameSnapshot,
    // Nullable in the type system (matches every other timestamp field in
    // this codebase — createdAt/visitDate/recordedAt/etc. are all
    // DateTime?) even though it's always written: @TimestampConverter()
    // paired with a non-nullable `required DateTime` field silently drops
    // the converter during codegen with this freezed/json_serializable
    // version combo (confirmed the hard way — it fell back to
    // DateTime.parse(json[...] as String), which throws on a real
    // Firestore Timestamp). AppointmentRepository always supplies a real
    // value, so call sites use scheduledAt! where they already know that.
    @TimestampConverter() DateTime? scheduledAt,
    @Default(TreatmentType.other) String expectedTreatmentType,
    @Default(AppointmentStatus.scheduled) String status,
    @Default('') String notes,
    required String createdByUid,
    @TimestampConverter() DateTime? createdAt,
    // Which center member this appointment is for — set when booked
    // through the patient's own assignedDoctorUid (see Patient's doc
    // comment), null for solo clinics (ownerId already is the doctor) and
    // for unassigned/shared center appointments. sendDailyAppointmentDigest
    // / sendAppointmentReminders notify this doctor specifically when set,
    // falling back to every center member when it's null.
    String? assignedDoctorUid,
    // Cloud-Function-owned: flips to true the moment
    // sendAppointmentReminders fires the 30-minutes-before push, so a
    // 5-minute polling window can never double-send. Reset to false by
    // AppointmentRepository.reschedule so a moved appointment gets its own
    // reminder again.
    @Default(false) bool reminderSent,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  factory Appointment.fromDoc(String id, Map<String, dynamic> data) =>
      Appointment.fromJson({...data, 'id': id});
}

class AppointmentStatus {
  AppointmentStatus._();

  static const scheduled = 'scheduled';
  static const completed = 'completed';
  static const cancelled = 'cancelled';
  static const noShow = 'no_show';
}
