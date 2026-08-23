import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../models/medical_center.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

final _dateTimeFormat = DateFormat.yMMMd('ar').add_jm();

/// Args bundle for /doctor/patients/new and /doctor/patients/:id/edit.
class PatientFormArgs {
  const PatientFormArgs({required this.profile, this.existing});
  final UserProfile profile;
  final Patient? existing;
}

/// /doctor/patients/new (and .../:id/edit) — basic info + sensitive medical
/// notes. Encryption of phone/allergies/chronicConditions happens inside
/// PatientRepository, not here, so this screen only ever deals in
/// plaintext form fields.
class PatientFormScreen extends ConsumerStatefulWidget {
  const PatientFormScreen({super.key, required this.profile, this.existing});

  final UserProfile profile;
  final Patient? existing;

  @override
  ConsumerState<PatientFormScreen> createState() => _PatientFormScreenState();
}

class _PatientFormScreenState extends ConsumerState<PatientFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController =
      TextEditingController(text: widget.existing?.name ?? '');
  late final _phoneController =
      TextEditingController(text: widget.existing?.phoneEncrypted ?? '');
  late final _addressController =
      TextEditingController(text: widget.existing?.address ?? '');
  late final _allergiesController =
      TextEditingController(text: widget.existing?.allergiesEncrypted ?? '');
  late final _chronicController =
      TextEditingController(text: widget.existing?.chronicConditionsEncrypted ?? '');
  String _gender = '';
  bool _saving = false;

  // Manager-only assignment (see Patient.assignedDoctorUid's doc comment)
  // — only ever offered when creating a brand-new patient inside a medical
  // center, and only to the center's own manager.
  String? _assignedDoctorUid;
  String? _assignedDoctorName;
  DateTime? _initialAppointmentAt;

  @override
  void initState() {
    super.initState();
    _gender = widget.existing?.gender ?? '';
  }

  Future<void> _pickInitialAppointmentTime() async {
    final base = _initialAppointmentAt ?? DateTime.now().add(const Duration(days: 1));
    final date = await showDatePicker(
      context: context,
      initialDate: base,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(base));
    if (time == null) return;
    setState(() {
      _initialAppointmentAt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _allergiesController.dispose();
    _chronicController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final repo = ref.read(patientRepositoryProvider);
    try {
      if (widget.existing == null) {
        if (_assignedDoctorUid != null && _initialAppointmentAt != null) {
          // Appointment must exist *before* the patient doc so
          // onPatientCreated's notification trigger can find it without a
          // race — see PatientRepository.reservePatientId's doc comment.
          final patientId = repo.reservePatientId();
          await ref.read(appointmentRepositoryProvider).createAppointment(
                ownerId: widget.profile.clinicOwnerId,
                ownerType: widget.profile.clinicOwnerType,
                patientId: patientId,
                patientNameSnapshot: _nameController.text.trim(),
                scheduledAt: _initialAppointmentAt!,
                createdByUid: widget.profile.uid,
                assignedDoctorUid: _assignedDoctorUid,
              );
          await repo.createPatient(
            id: patientId,
            ownerId: widget.profile.clinicOwnerId,
            ownerType: widget.profile.clinicOwnerType,
            name: _nameController.text.trim(),
            phone: _phoneController.text.trim(),
            gender: _gender,
            address: _addressController.text.trim(),
            allergies: _allergiesController.text.trim(),
            chronicConditions: _chronicController.text.trim(),
            createdByUid: widget.profile.uid,
            assignedDoctorUid: _assignedDoctorUid,
            assignedDoctorNameSnapshot: _assignedDoctorName,
          );
        } else {
          await repo.createPatient(
            ownerId: widget.profile.clinicOwnerId,
            ownerType: widget.profile.clinicOwnerType,
            name: _nameController.text.trim(),
            phone: _phoneController.text.trim(),
            gender: _gender,
            address: _addressController.text.trim(),
            allergies: _allergiesController.text.trim(),
            chronicConditions: _chronicController.text.trim(),
            createdByUid: widget.profile.uid,
            assignedDoctorUid: _assignedDoctorUid,
            assignedDoctorNameSnapshot: _assignedDoctorName,
          );
        }
      } else {
        await repo.updatePatient(
          patientId: widget.existing!.id,
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
          gender: _gender,
          address: _addressController.text.trim(),
          allergies: _allergiesController.text.trim(),
          chronicConditions: _chronicController.text.trim(),
        );
      }
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('تعذر الحفظ: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.existing == null ? 'مريض جديد' : 'تعديل بيانات المريض')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'الاسم الكامل'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'رقم الهاتف'),
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _gender.isEmpty ? null : _gender,
                  decoration: const InputDecoration(labelText: 'الجنس'),
                  items: const [
                    DropdownMenuItem(value: 'male', child: Text('ذكر')),
                    DropdownMenuItem(value: 'female', child: Text('أنثى')),
                  ],
                  onChanged: (v) => setState(() => _gender = v ?? ''),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'العنوان'),
                ),
                const Divider(height: 32),
                Text('معلومات طبية حساسة', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _allergiesController,
                  decoration:
                      const InputDecoration(labelText: 'حساسية أدوية / بنج', hintText: 'مثال: بنسلين'),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _chronicController,
                  decoration: const InputDecoration(
                      labelText: 'أمراض مزمنة', hintText: 'مثال: سكري، ضغط'),
                  maxLines: 2,
                ),
                if (widget.existing == null && widget.profile.isCenterMember)
                  _DoctorAssignmentSection(
                    profile: widget.profile,
                    assignedDoctorUid: _assignedDoctorUid,
                    initialAppointmentAt: _initialAppointmentAt,
                    onDoctorChanged: (uid, name) =>
                        setState(() {
                          _assignedDoctorUid = uid;
                          _assignedDoctorName = name;
                          if (uid == null) _initialAppointmentAt = null;
                        }),
                    onPickAppointmentTime: _pickInitialAppointmentTime,
                    onClearAppointmentTime: () => setState(() => _initialAppointmentAt = null),
                  ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saving ? null : _save,
                  child: _saving
                      ? const SizedBox(
                          width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('حفظ'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Only rendered for a brand-new patient inside a medical center, and even
/// then only its content shows once we've confirmed [profile] *is* that
/// center's manager (see MedicalCenter.managerUid) — every other center
/// doctor creates patients with no assignment UI at all, exactly like a
/// solo clinic. Lets the manager optionally hand this patient to a
/// specific member doctor and, in the same step, book their first
/// appointment — both feed onPatientCreated's assignment notification.
class _DoctorAssignmentSection extends ConsumerWidget {
  const _DoctorAssignmentSection({
    required this.profile,
    required this.assignedDoctorUid,
    required this.initialAppointmentAt,
    required this.onDoctorChanged,
    required this.onPickAppointmentTime,
    required this.onClearAppointmentTime,
  });

  final UserProfile profile;
  final String? assignedDoctorUid;
  final DateTime? initialAppointmentAt;
  final void Function(String? uid, String? name) onDoctorChanged;
  final VoidCallback onPickAppointmentTime;
  final VoidCallback onClearAppointmentTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<MedicalCenter?>(
      stream: ref.watch(medicalCenterRepositoryProvider).watchCenter(profile.centerId!),
      builder: (context, snap) {
        final center = snap.data;
        if (center == null || center.managerUid != profile.uid) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 32),
            Text('إسناد لطبيب داخل المركز (اختياري)', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: assignedDoctorUid,
              decoration: const InputDecoration(labelText: 'الطبيب المسؤول'),
              items: center.memberNames.entries
                  .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                  .toList(),
              onChanged: (uid) => onDoctorChanged(uid, uid == null ? null : center.memberNames[uid]),
            ),
            if (assignedDoctorUid != null) ...[
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.event_outlined),
                  title: Text(initialAppointmentAt == null
                      ? 'بدون حجز موعد أول'
                      : _dateTimeFormat.format(initialAppointmentAt!)),
                  trailing: TextButton(
                    onPressed: onPickAppointmentTime,
                    child: Text(initialAppointmentAt == null ? 'حجز موعد' : 'تغيير'),
                  ),
                  onLongPress: initialAppointmentAt == null ? null : onClearAppointmentTime,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
