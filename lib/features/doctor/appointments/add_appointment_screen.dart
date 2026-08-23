import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

final _dateTimeFormat = DateFormat.yMMMd('ar').add_jm();

/// Args bundle for /doctor/appointments/new — always opened with a patient
/// already chosen (either from [PatientDetailScreen]'s "حجز موعد" action,
/// or the appointments screen's own patient-picker sheet), so this screen
/// only ever deals with picking a date/time and expected treatment.
class AddAppointmentArgs {
  const AddAppointmentArgs({
    required this.profile,
    required this.patientId,
    required this.patientName,
  });

  final UserProfile profile;
  final String patientId;
  final String patientName;
}

class AddAppointmentScreen extends ConsumerStatefulWidget {
  const AddAppointmentScreen({super.key, required this.args});

  final AddAppointmentArgs args;

  @override
  ConsumerState<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends ConsumerState<AddAppointmentScreen> {
  final _notesController = TextEditingController();
  DateTime _scheduledAt = DateTime.now().add(const Duration(days: 1));
  String _treatmentType = TreatmentType.cleaning;
  bool _saving = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _scheduledAt,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_scheduledAt),
    );
    if (time == null) return;
    setState(() {
      _scheduledAt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await ref.read(appointmentRepositoryProvider).createAppointment(
            ownerId: widget.args.profile.clinicOwnerId,
            ownerType: widget.args.profile.clinicOwnerType,
            patientId: widget.args.patientId,
            patientNameSnapshot: widget.args.patientName,
            scheduledAt: _scheduledAt,
            expectedTreatmentType: _treatmentType,
            notes: _notesController.text.trim(),
            createdByUid: widget.args.profile.uid,
          );
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تعذر الحفظ: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حجز موعد')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: Text(widget.args.patientName),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.event_outlined),
                  title: Text(_dateTimeFormat.format(_scheduledAt)),
                  trailing: TextButton(onPressed: _pickDateTime, child: const Text('تغيير')),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _treatmentType,
                decoration: const InputDecoration(labelText: 'العلاج المتوقع'),
                items: TreatmentType.all
                    .map((t) => DropdownMenuItem(value: t, child: Text(TreatmentType.labels[t]!)))
                    .toList(),
                onChanged: (v) => setState(() => _treatmentType = v ?? TreatmentType.other),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'ملاحظات (اختياري)'),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _saving ? null : _save,
                child: _saving
                    ? const SizedBox(
                        width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('حفظ الموعد'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
