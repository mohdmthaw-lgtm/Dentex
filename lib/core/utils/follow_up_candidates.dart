import '../../models/appointment.dart';
import '../../models/patient.dart';

/// One patient whose most recent visit was flagged [Visit.followUpNeeded]
/// and who has no future scheduled appointment yet.
class FollowUpCandidate {
  const FollowUpCandidate({required this.patientId, required this.lastVisit});
  final String patientId;
  final Visit lastVisit;
}

/// [visits] should be every visit across the clinic (unbounded — see
/// PatientRepository.watchVisitsForOwner called with no start/end), and
/// [upcomingAppointments] every future scheduled appointment (see
/// AppointmentRepository.watchUpcomingAppointments). Recomputed fresh on
/// every load, same "don't persist a derived list" approach as
/// computeClinicSummary/computeDoctorTierInfo.
List<FollowUpCandidate> computeFollowUpCandidates(
  List<Visit> visits,
  List<Appointment> upcomingAppointments,
) {
  final latestVisitByPatient = <String, Visit>{};
  for (final visit in visits) {
    if (visit.visitDate == null) continue;
    final current = latestVisitByPatient[visit.patientId];
    if (current == null || visit.visitDate!.isAfter(current.visitDate!)) {
      latestVisitByPatient[visit.patientId] = visit;
    }
  }

  final patientsWithUpcoming = upcomingAppointments
      .where((a) => a.status == AppointmentStatus.scheduled)
      .map((a) => a.patientId)
      .toSet();

  return latestVisitByPatient.entries
      .where((e) => e.value.followUpNeeded && !patientsWithUpcoming.contains(e.key))
      .map((e) => FollowUpCandidate(patientId: e.key, lastVisit: e.value))
      .toList();
}
