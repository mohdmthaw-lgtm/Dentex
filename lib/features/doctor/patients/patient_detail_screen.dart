import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../core/constants/dental_chart.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/dental_chart.dart';
import '../../../shared/widgets/stat_tile.dart';
import '../appointments/add_appointment_screen.dart';
import 'add_visit_screen.dart';
import 'patient_form_screen.dart';
import 'tooth_photo_archive_screen.dart';

final _dateFormat = DateFormat.yMMMd('ar').add_jm();

/// /doctor/patients/:id — profile header (live totalPaid/totalDebt), the
/// dental chart (tap a tooth to record a visit against it), and the
/// chronological visit list below.
class PatientDetailScreen extends ConsumerWidget {
  const PatientDetailScreen({super.key, required this.patientId, required this.profile});

  final String patientId;
  final UserProfile profile;

  Future<void> _showToothActions(BuildContext context, String tooth) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.medical_services_outlined),
              title: Text('تسجيل زيارة — ${DentalChart.arabicLabel(tooth)}'),
              onTap: () => Navigator.pop(c, 'visit'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text('أرشيف صور — ${DentalChart.arabicLabel(tooth)}'),
              onTap: () => Navigator.pop(c, 'archive'),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || action == null) return;
    if (action == 'visit') {
      context.push(
        '/doctor/patients/$patientId/visits/new',
        extra: AddVisitArgs(profile: profile, initialTooth: tooth),
      );
    } else {
      context.push(
        '/doctor/patients/$patientId/teeth/$tooth/photos',
        extra: ToothArchiveArgs(profile: profile, patientId: patientId, toothNumber: tooth),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(patientRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ملف المريض'),
        actions: [
          StreamBuilder<Patient?>(
            stream: repo.watchPatient(patientId),
            builder: (context, snap) {
              final patient = snap.data;
              if (patient == null) return const SizedBox.shrink();
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.event_outlined),
                    tooltip: 'حجز موعد',
                    onPressed: () => context.push(
                      '/doctor/appointments/new',
                      extra: AddAppointmentArgs(
                        profile: profile,
                        patientId: patient.id,
                        patientName: patient.name,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => context.push(
                      '/doctor/patients/$patientId/edit',
                      extra: PatientFormArgs(profile: profile, existing: patient),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(
          '/doctor/patients/$patientId/visits/new',
          extra: AddVisitArgs(profile: profile),
        ),
        icon: const Icon(Icons.add),
        label: const Text('تسجيل زيارة'),
      ),
      body: StreamBuilder<Patient?>(
        stream: repo.watchPatient(patientId),
        builder: (context, patientSnap) {
          if (!patientSnap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final patient = patientSnap.data;
          if (patient == null) {
            return const Center(child: Text('تعذر العثور على المريض'));
          }
          return StreamBuilder<List<Visit>>(
            stream: repo.watchVisits(patientId, patient.ownerId, patient.ownerType),
            builder: (context, visitsSnap) {
              final visits = visitsSnap.data ?? [];
              final teethWithHistory =
                  visits.where((v) => v.toothNumber != null).map((v) => v.toothNumber!).toSet();

              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _PatientHeader(patient: patient),
                  const SizedBox(height: 16),
                  Text('مخطط الأسنان', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: DentalChartWidget(
                        hasHistory: teethWithHistory,
                        onToothTap: (tooth) => _showToothActions(context, tooth),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('سجل الزيارات', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  if (visits.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(child: Text('لا توجد زيارات مسجلة بعد')),
                    )
                  else
                    ...visits.map((v) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppTheme.accent.withOpacity(0.12),
                              child: Text(
                                v.toothNumber ?? '-',
                                style: const TextStyle(
                                    color: AppTheme.accent, fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            title: Text(TreatmentType.labels[v.treatmentType] ?? v.treatmentType),
                            subtitle: Text(
                              [
                                if (v.description.isNotEmpty) v.description,
                                if (v.visitDate != null) _dateFormat.format(v.visitDate!),
                              ].join(' · '),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${v.cost.toStringAsFixed(0)} ₪'),
                                if (v.cost > v.paidAtVisit)
                                  Text(
                                    'متبقي ${(v.cost - v.paidAtVisit).toStringAsFixed(0)}',
                                    style: const TextStyle(color: AppTheme.warning, fontSize: 11),
                                  ),
                              ],
                            ),
                          ),
                        )),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _PatientHeader extends StatelessWidget {
  const _PatientHeader({required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(patient.name, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text(patient.phoneEncrypted, textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.grey.shade600)),
        const SizedBox(height: 12),
        StatTileRow(tiles: [
          StatTile(
            label: 'إجمالي المدفوع',
            value: '${patient.stats.totalPaid.toStringAsFixed(0)} ₪',
            icon: Icons.check_circle_outline,
            color: AppTheme.success,
          ),
          StatTile(
            label: 'الدين الحالي',
            value: '${patient.stats.totalDebt.toStringAsFixed(0)} ₪',
            icon: Icons.warning_amber_outlined,
            color: patient.stats.totalDebt > 0 ? AppTheme.warning : Colors.grey,
          ),
        ]),
        if (patient.allergiesEncrypted.isNotEmpty || patient.chronicConditionsEncrypted.isNotEmpty) ...[
          const SizedBox(height: 12),
          Card(
            color: AppTheme.danger.withOpacity(0.06),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (patient.allergiesEncrypted.isNotEmpty)
                    Text('حساسية: ${patient.allergiesEncrypted}',
                        style: const TextStyle(color: AppTheme.danger)),
                  if (patient.chronicConditionsEncrypted.isNotEmpty)
                    Text('أمراض مزمنة: ${patient.chronicConditionsEncrypted}',
                        style: const TextStyle(color: AppTheme.danger)),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
