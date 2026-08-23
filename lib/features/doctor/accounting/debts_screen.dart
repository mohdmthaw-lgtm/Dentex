import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

/// /doctor/accounting/debts — every patient with an outstanding balance
/// (see PatientRepository.watchDebtors), each with a quick call/WhatsApp
/// action and an inline "record payment" dialog.
class DebtsScreen extends ConsumerWidget {
  const DebtsScreen({super.key, required this.profile});

  final UserProfile profile;

  Future<void> _call(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    await launchUrl(uri);
  }

  Future<void> _whatsApp(String phone) async {
    final digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
    final uri = Uri.parse('https://wa.me/$digits');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _recordPayment(BuildContext context, WidgetRef ref, Patient patient) async {
    final controller = TextEditingController();
    final amount = await showDialog<num>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('تسجيل دفعة — ${patient.name}'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'المبلغ (₪)',
            helperText: 'الدين الحالي: ${patient.stats.totalDebt.toStringAsFixed(0)} ₪',
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('إلغاء')),
          FilledButton(
            onPressed: () => Navigator.pop(c, num.tryParse(controller.text)),
            child: const Text('تسجيل'),
          ),
        ],
      ),
    );
    if (amount == null || amount <= 0) return;
    await ref.read(patientRepositoryProvider).recordPayment(
          patientId: patient.id,
          ownerId: patient.ownerId,
          ownerType: patient.ownerType,
          amount: amount,
          recordedByUid: profile.uid,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtorsStream = ref
        .watch(patientRepositoryProvider)
        .watchDebtors(profile.clinicOwnerId, profile.clinicOwnerType);

    return Scaffold(
      appBar: AppBar(title: const Text('ديون المرضى')),
      body: StreamBuilder<List<Patient>>(
        stream: debtorsStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final debtors = snap.data ?? [];
          if (debtors.isEmpty) {
            return const Center(child: Text('لا يوجد مرضى عليهم دين حاليًا 🎉'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: debtors.length,
            itemBuilder: (context, i) {
              final patient = debtors[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(patient.name,
                                    style: Theme.of(context).textTheme.titleMedium),
                                Text(patient.phoneEncrypted, textDirection: TextDirection.ltr),
                              ],
                            ),
                          ),
                          Text(
                            '${patient.stats.totalDebt.toStringAsFixed(0)} ₪',
                            style: const TextStyle(
                                color: AppTheme.warning, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => _call(patient.phoneEncrypted),
                            icon: const Icon(Icons.call_outlined),
                          ),
                          IconButton(
                            onPressed: () => _whatsApp(patient.phoneEncrypted),
                            icon: const Icon(Icons.chat_outlined, color: Color(0xFF25D366)),
                          ),
                          const Spacer(),
                          FilledButton.tonal(
                            onPressed: () => _recordPayment(context, ref, patient),
                            child: const Text('تسجيل دفعة'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
