import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/appointment.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

/// Args bundle for /doctor/patients/:id/visits/new — [initialTooth] is set
/// when this screen was opened by tapping a tooth on [DentalChartWidget].
/// [appointmentId] is set when opened from "تسجيل الحضور والدفع" on an
/// appointment (see appointments_screen.dart) — saving the visit also
/// marks that appointment completed, in one action.
class AddVisitArgs {
  const AddVisitArgs({required this.profile, this.initialTooth, this.appointmentId});
  final UserProfile profile;
  final String? initialTooth;
  final String? appointmentId;
}

class AddVisitScreen extends ConsumerStatefulWidget {
  const AddVisitScreen({super.key, required this.patientId, required this.args});

  final String patientId;
  final AddVisitArgs args;

  @override
  ConsumerState<AddVisitScreen> createState() => _AddVisitScreenState();
}

class _AddVisitScreenState extends ConsumerState<AddVisitScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _paidController = TextEditingController(text: '0');
  String _treatmentType = TreatmentType.cleaning;
  String? _tooth;
  bool _followUpNeeded = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _tooth = widget.args.initialTooth;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _costController.dispose();
    _paidController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      await ref.read(patientRepositoryProvider).recordVisit(
            patientId: widget.patientId,
            ownerId: widget.args.profile.clinicOwnerId,
            ownerType: widget.args.profile.clinicOwnerType,
            toothNumber: _tooth,
            treatmentType: _treatmentType,
            description: _descriptionController.text.trim(),
            cost: num.tryParse(_costController.text) ?? 0,
            paidAtVisit: num.tryParse(_paidController.text) ?? 0,
            followUpNeeded: _followUpNeeded,
            createdByUid: widget.args.profile.uid,
            visitDate: DateTime.now(),
          );
      if (widget.args.appointmentId != null) {
        await ref
            .read(appointmentRepositoryProvider)
            .updateStatus(widget.args.appointmentId!, AppointmentStatus.completed);
      }
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
      appBar: AppBar(title: const Text('تسجيل زيارة')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_tooth != null)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.circle_outlined),
                      title: Text('السن رقم $_tooth'),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => setState(() => _tooth = null),
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _treatmentType,
                  decoration: const InputDecoration(labelText: 'نوع العلاج'),
                  items: TreatmentType.all
                      .map((t) => DropdownMenuItem(value: t, child: Text(TreatmentType.labels[t]!)))
                      .toList(),
                  onChanged: (v) => setState(() => _treatmentType = v ?? TreatmentType.other),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'وصف ما تم عمله'),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _costController,
                  decoration: const InputDecoration(labelText: 'التكلفة (₪)'),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      (num.tryParse(v ?? '') == null) ? 'أدخل رقمًا صحيحًا' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _paidController,
                  decoration: const InputDecoration(labelText: 'المدفوع الآن (₪)'),
                  keyboardType: TextInputType.number,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _followUpNeeded,
                  title: const Text('يحتاج متابعة لاحقًا'),
                  subtitle: const Text('يظهر ضمن "متابعات مطلوبة" في شاشة المواعيد'),
                  onChanged: (v) => setState(() => _followUpNeeded = v ?? false),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saving ? null : _save,
                  child: _saving
                      ? const SizedBox(
                          width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('حفظ الزيارة'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
