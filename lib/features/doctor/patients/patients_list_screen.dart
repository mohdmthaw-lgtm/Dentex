import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import 'patient_form_screen.dart';

enum _PatientFilter { all, withDebt, seenThisMonth }

/// /doctor/patients — searchable (client-side, over already-decrypted
/// fields, see PatientRepository.watchPatientsForOwner) list of every
/// patient owned by this doctor or their medical center.
class PatientsListScreen extends ConsumerStatefulWidget {
  const PatientsListScreen({super.key, required this.profile});

  final UserProfile profile;

  @override
  ConsumerState<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends ConsumerState<PatientsListScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  _PatientFilter _filter = _PatientFilter.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Patient> _apply(List<Patient> patients) {
    final now = DateTime.now();
    var result = patients;
    if (_filter == _PatientFilter.withDebt) {
      result = result.where((p) => p.stats.totalDebt > 0).toList();
    } else if (_filter == _PatientFilter.seenThisMonth) {
      result = result
          .where((p) => p.updatedAt != null &&
              p.updatedAt!.year == now.year &&
              p.updatedAt!.month == now.month)
          .toList();
    }
    if (_query.trim().isNotEmpty) {
      final q = _query.trim().toLowerCase();
      result = result
          .where((p) =>
              p.name.toLowerCase().contains(q) || p.phoneEncrypted.contains(q))
          .toList();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final ownerId = widget.profile.clinicOwnerId;
    final ownerType = widget.profile.clinicOwnerType;
    final patientsStream = ref
        .watch(patientRepositoryProvider)
        .watchPatientsForOwner(ownerId, ownerType);

    return Scaffold(
      appBar: AppBar(title: const Text('مرضاي')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(
          '/doctor/patients/new',
          extra: PatientFormArgs(profile: widget.profile),
        ),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ابحث بالاسم أو الهاتف',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _FilterChip(
                  label: 'الكل',
                  selected: _filter == _PatientFilter.all,
                  onTap: () => setState(() => _filter = _PatientFilter.all),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: 'عندهم دين',
                  selected: _filter == _PatientFilter.withDebt,
                  onTap: () => setState(() => _filter = _PatientFilter.withDebt),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: 'زاروا هالشهر',
                  selected: _filter == _PatientFilter.seenThisMonth,
                  onTap: () => setState(() => _filter = _PatientFilter.seenThisMonth),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: StreamBuilder<List<Patient>>(
              stream: patientsStream,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final patients = _apply(snap.data ?? []);
                if (patients.isEmpty) {
                  return const Center(child: Text('لا يوجد مرضى بعد'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: patients.length,
                  itemBuilder: (context, i) {
                    final patient = patients[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        onTap: () => context.push(
                          '/doctor/patients/${patient.id}',
                          extra: widget.profile,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: AppTheme.accent.withOpacity(0.12),
                          child: const Icon(Icons.person_outline, color: AppTheme.accent),
                        ),
                        title: Text(patient.name),
                        subtitle: Text(patient.phoneEncrypted, textDirection: TextDirection.ltr),
                        trailing: patient.stats.totalDebt > 0
                            ? Text(
                                '${patient.stats.totalDebt.toStringAsFixed(0)} ₪',
                                style: const TextStyle(
                                    color: AppTheme.warning, fontWeight: FontWeight.bold),
                              )
                            : null,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(label: Text(label), selected: selected, onSelected: (_) => onTap());
  }
}
