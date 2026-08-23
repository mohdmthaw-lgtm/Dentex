import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/follow_up_candidates.dart';
import '../../../models/appointment.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../patients/add_visit_screen.dart';
import 'add_appointment_screen.dart';

final _timeFormat = DateFormat.jm('ar');
final _dayLabelFormat = DateFormat.E('ar');
final _fullDateFormat = DateFormat.yMMMd('ar');
// Darker variant of the appointments section's accent (AppTheme.info),
// same role primaryDark plays for the app-wide teal.
final Color _infoDark = Color.lerp(AppTheme.info, Colors.black, 0.25)!;

enum _ViewMode { day, week }

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// /doctor/appointments — day/week toggle, a 7-day strip centered on
/// today, a prominent "آخر موعد اليوم" card (so a doctor checking late at
/// night can immediately see when tomorrow — or today, if still open —
/// wraps up), the selected range's timeline, and a "متابعات مطلوبة" list
/// (see computeFollowUpCandidates).
class AppointmentsScreen extends ConsumerStatefulWidget {
  const AppointmentsScreen({super.key, required this.profile});

  final UserProfile profile;

  @override
  ConsumerState<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends ConsumerState<AppointmentsScreen> {
  _ViewMode _mode = _ViewMode.day;
  DateTime _selectedDay = _dateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final ownerId = widget.profile.clinicOwnerId;
    final ownerType = widget.profile.clinicOwnerType;
    final repo = ref.watch(appointmentRepositoryProvider);
    final today = _dateOnly(DateTime.now());
    final weekStart = today.subtract(const Duration(days: 3));
    final weekEnd = weekStart.add(const Duration(days: 7));

    return Scaffold(
      appBar: AppBar(title: const Text('مواعيدي')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pickPatientAndAdd(context),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Appointment>>(
        stream: repo.watchAppointmentsForOwner(ownerId, ownerType, start: weekStart, end: weekEnd),
        builder: (context, weekSnap) {
          // scheduledAt is nullable in the model (see Appointment's doc
          // comment) but AppointmentRepository always writes a real value —
          // drop anything that somehow doesn't have one rather than crash.
          final weekAppointments =
              (weekSnap.data ?? []).where((a) => a.scheduledAt != null).toList();
          final todayAppointments = weekAppointments
              .where((a) => _dateOnly(a.scheduledAt!) == today)
              .toList()
            ..sort((a, b) => a.scheduledAt!.compareTo(b.scheduledAt!));

          final visibleAppointments = (_mode == _ViewMode.day
              ? weekAppointments.where((a) => _dateOnly(a.scheduledAt!) == _selectedDay)
              : weekAppointments)
              .toList()
            ..sort((a, b) => a.scheduledAt!.compareTo(b.scheduledAt!));

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SegmentedButton<_ViewMode>(
                segments: const [
                  ButtonSegment(value: _ViewMode.day, label: Text('يوم')),
                  ButtonSegment(value: _ViewMode.week, label: Text('أسبوع')),
                ],
                selected: {_mode},
                onSelectionChanged: (s) => setState(() => _mode = s.first),
              ),
              const SizedBox(height: 16),
              _WeekStrip(
                weekStart: weekStart,
                selectedDay: _selectedDay,
                appointmentDays: weekAppointments.map((a) => _dateOnly(a.scheduledAt!)).toSet(),
                onDayTap: (day) => setState(() {
                  _selectedDay = day;
                  _mode = _ViewMode.day;
                }),
              ),
              const SizedBox(height: 16),
              _LastAppointmentTodayCard(appointments: todayAppointments),
              const SizedBox(height: 20),
              Text(
                _mode == _ViewMode.day ? _fullDateFormat.format(_selectedDay) : 'هذا الأسبوع',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              if (visibleAppointments.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: Text('لا توجد مواعيد')),
                )
              else
                ...visibleAppointments.map((a) => _AppointmentTile(
                      appointment: a,
                      showDate: _mode == _ViewMode.week,
                      onTap: () => _showAppointmentActions(context, a),
                    )),
              const SizedBox(height: 24),
              Text('متابعات مطلوبة', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              _FollowUpSection(profile: widget.profile),
            ],
          );
        },
      ),
    );
  }

  Future<void> _pickPatientAndAdd(BuildContext context) async {
    final patients = await ref
        .read(patientRepositoryProvider)
        .watchPatientsForOwner(widget.profile.clinicOwnerId, widget.profile.clinicOwnerType)
        .first;
    if (!context.mounted) return;
    final selected = await showModalBottomSheet<Patient>(
      context: context,
      isScrollControlled: true,
      builder: (c) => _PatientPickerSheet(patients: patients),
    );
    if (selected == null || !context.mounted) return;
    context.push(
      '/doctor/appointments/new',
      extra: AddAppointmentArgs(
        profile: widget.profile,
        patientId: selected.id,
        patientName: selected.name,
      ),
    );
  }

  Future<void> _showAppointmentActions(BuildContext context, Appointment appointment) async {
    final repo = ref.read(appointmentRepositoryProvider);
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.event_outlined),
              title: Text(appointment.patientNameSnapshot),
              subtitle: Text(_timeFormat.format(appointment.scheduledAt!)),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.check_circle_outline, color: AppTheme.success),
              title: const Text('تسجيل الحضور والدفع'),
              subtitle: const Text('يفتح شاشة تسجيل زيارة، ويكمل الموعد تلقائيًا'),
              onTap: () => Navigator.pop(c, 'attend'),
            ),
            ListTile(
              leading: const Icon(Icons.event_repeat_outlined, color: AppTheme.info),
              title: const Text('تأجيل الموعد'),
              onTap: () => Navigator.pop(c, 'reschedule'),
            ),
            ListTile(
              leading: const Icon(Icons.person_off_outlined, color: AppTheme.warning),
              title: const Text('المريض لم يحضر'),
              onTap: () => Navigator.pop(c, 'no_show'),
            ),
            ListTile(
              leading: const Icon(Icons.cancel_outlined, color: AppTheme.danger),
              title: const Text('إلغاء الموعد'),
              onTap: () => Navigator.pop(c, 'cancel'),
            ),
            ListTile(
              leading: const Icon(Icons.folder_open_outlined),
              title: const Text('عرض ملف المريض'),
              onTap: () => Navigator.pop(c, 'patient'),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || action == null) return;

    switch (action) {
      case 'attend':
        context.push(
          '/doctor/patients/${appointment.patientId}/visits/new',
          extra: AddVisitArgs(profile: widget.profile, appointmentId: appointment.id),
        );
        break;
      case 'reschedule':
        await _reschedule(context, appointment);
        break;
      case 'no_show':
        await repo.updateStatus(appointment.id, AppointmentStatus.noShow);
        break;
      case 'cancel':
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (c) => AlertDialog(
            title: const Text('إلغاء الموعد'),
            content: Text('هل تريد إلغاء موعد ${appointment.patientNameSnapshot}؟'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('تراجع')),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: AppTheme.danger),
                onPressed: () => Navigator.pop(c, true),
                child: const Text('إلغاء الموعد'),
              ),
            ],
          ),
        );
        if (confirmed == true) {
          await repo.updateStatus(appointment.id, AppointmentStatus.cancelled);
        }
        break;
      case 'patient':
        if (context.mounted) {
          context.push('/doctor/patients/${appointment.patientId}', extra: widget.profile);
        }
        break;
    }
  }

  Future<void> _reschedule(BuildContext context, Appointment appointment) async {
    final date = await showDatePicker(
      context: context,
      initialDate: appointment.scheduledAt!,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(appointment.scheduledAt!),
    );
    if (time == null) return;
    final newDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    await ref.read(appointmentRepositoryProvider).reschedule(appointment.id, newDateTime);
  }
}

class _WeekStrip extends StatelessWidget {
  const _WeekStrip({
    required this.weekStart,
    required this.selectedDay,
    required this.appointmentDays,
    required this.onDayTap,
  });

  final DateTime weekStart;
  final DateTime selectedDay;
  final Set<DateTime> appointmentDays;
  final ValueChanged<DateTime> onDayTap;

  @override
  Widget build(BuildContext context) {
    final days = List.generate(7, (i) => weekStart.add(Duration(days: i)));
    return Row(
      children: days.map((day) {
        final selected = day == selectedDay;
        final hasAppointments = appointmentDays.contains(day);
        return Expanded(
          child: InkWell(
            onTap: () => onDayTap(day),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: selected ? AppTheme.info : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: selected ? AppTheme.info : Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Text(_dayLabelFormat.format(day),
                      style: TextStyle(
                          fontSize: 11, color: selected ? Colors.white : Colors.grey.shade600)),
                  const SizedBox(height: 4),
                  Text('${day.day}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selected ? Colors.white : Colors.black87)),
                  const SizedBox(height: 4),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: hasAppointments
                          ? (selected ? Colors.white : AppTheme.warning)
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _LastAppointmentTodayCard extends StatelessWidget {
  const _LastAppointmentTodayCard({required this.appointments});

  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    final last = appointments.isEmpty ? null : appointments.last;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [AppTheme.info, _infoDark],
        ),
      ),
      child: Column(
        children: [
          const Text('آخر موعد اليوم', style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 8),
          Text(
            last == null ? 'لا يوجد مواعيد اليوم' : _timeFormat.format(last.scheduledAt!),
            style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          if (last != null) ...[
            const SizedBox(height: 4),
            Text(last.patientNameSnapshot, style: const TextStyle(color: Colors.white70)),
          ],
        ],
      ),
    );
  }
}

class _AppointmentTile extends StatelessWidget {
  const _AppointmentTile({required this.appointment, required this.showDate, required this.onTap});

  final Appointment appointment;
  final bool showDate;
  final VoidCallback onTap;

  static const _statusMeta = {
    AppointmentStatus.completed: ('مكتمل', AppTheme.success),
    AppointmentStatus.cancelled: ('ملغى', AppTheme.danger),
    AppointmentStatus.noShow: ('لم يحضر', AppTheme.warning),
  };

  @override
  Widget build(BuildContext context) {
    final statusMeta = _statusMeta[appointment.status];
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppTheme.info.withOpacity(0.12),
          child: const Icon(Icons.event_outlined, color: AppTheme.info),
        ),
        title: Text(appointment.patientNameSnapshot),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(TreatmentType.labels[appointment.expectedTreatmentType] ?? ''),
            ),
            if (statusMeta != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: statusMeta.$2.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(statusMeta.$1,
                    style: TextStyle(color: statusMeta.$2, fontSize: 10, fontWeight: FontWeight.w600)),
              ),
          ],
        ),
        trailing: Text(
          showDate
              ? '${_dayLabelFormat.format(appointment.scheduledAt!)} ${_timeFormat.format(appointment.scheduledAt!)}'
              : _timeFormat.format(appointment.scheduledAt!),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _FollowUpSection extends ConsumerWidget {
  const _FollowUpSection({required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownerId = profile.clinicOwnerId;
    final ownerType = profile.clinicOwnerType;
    final patientRepo = ref.watch(patientRepositoryProvider);
    final appointmentRepo = ref.watch(appointmentRepositoryProvider);

    return StreamBuilder<List<Visit>>(
      stream: patientRepo.watchVisitsForOwner(ownerId, ownerType),
      builder: (context, visitsSnap) {
        return StreamBuilder<List<Appointment>>(
          stream: appointmentRepo.watchUpcomingAppointments(ownerId, ownerType),
          builder: (context, upcomingSnap) {
            final candidates =
                computeFollowUpCandidates(visitsSnap.data ?? [], upcomingSnap.data ?? []);
            if (candidates.isEmpty) {
              return const Text('لا يوجد متابعات مطلوبة حاليًا', style: TextStyle(color: Colors.grey));
            }
            return Column(
              children: candidates
                  .map((c) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: const Icon(Icons.notification_important_outlined,
                              color: AppTheme.warning),
                          title: Text(TreatmentType.labels[c.lastVisit.treatmentType] ?? ''),
                          subtitle: Text('آخر زيارة: ${_fullDateFormat.format(c.lastVisit.visitDate!)}'),
                          trailing: TextButton(
                            onPressed: () => context.push(
                              '/doctor/patients/${c.patientId}',
                              extra: profile,
                            ),
                            child: const Text('عرض الملف'),
                          ),
                        ),
                      ))
                  .toList(),
            );
          },
        );
      },
    );
  }
}

class _PatientPickerSheet extends StatefulWidget {
  const _PatientPickerSheet({required this.patients});
  final List<Patient> patients;

  @override
  State<_PatientPickerSheet> createState() => _PatientPickerSheetState();
}

class _PatientPickerSheetState extends State<_PatientPickerSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _query.trim().isEmpty
        ? widget.patients
        : widget.patients
            .where((p) => p.name.toLowerCase().contains(_query.trim().toLowerCase()))
            .toList();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'اختر مريضًا',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (v) => setState(() => _query = v),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, i) {
                    final p = filtered[i];
                    return ListTile(
                      title: Text(p.name),
                      onTap: () => Navigator.pop(context, p),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
