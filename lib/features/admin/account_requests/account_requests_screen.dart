import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../core/theme/app_theme.dart';
import '../../../models/account_request.dart';
import '../../../services/firebase/service_providers.dart';

final _dateFormat = DateFormat.yMMMd('ar').add_jm();

/// Admin review queue for [RequestAccountScreen] submissions — the other
/// half of the Guideline 3.2 fix. Approving here still goes through
/// `createDoctorAccount` (Admin SDK), same as the existing walk-in
/// "add doctor" flow in order_form_screen.dart; this screen only decides
/// *whether* to create the account, not how.
class AccountRequestsScreen extends ConsumerWidget {
  const AccountRequestsScreen({super.key});

  Future<void> _approve(
    BuildContext context,
    WidgetRef ref,
    AccountRequest request,
  ) {
    return request.accountType == AccountRequestType.center
        ? _approveCenter(context, ref, request)
        : _approveSolo(context, ref, request);
  }

  Future<void> _approveSolo(
    BuildContext context,
    WidgetRef ref,
    AccountRequest request,
  ) async {
    final nameCtrl = TextEditingController(text: request.name);
    final phoneCtrl = TextEditingController(text: request.phone);
    final clinicCtrl = TextEditingController(text: request.clinicName);
    final locationCtrl = TextEditingController(text: request.location);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('قبول الطلب وإنشاء حساب'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'الاسم')),
              TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'رقم الهاتف')),
              TextField(controller: clinicCtrl, decoration: const InputDecoration(labelText: 'اسم العيادة')),
              TextField(controller: locationCtrl, decoration: const InputDecoration(labelText: 'الموقع')),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'سيتم استخدام كلمة السر التي اختارها الزبون بنفسه عند تقديم الطلب.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('إلغاء')),
          FilledButton(onPressed: () => Navigator.pop(c, true), child: const Text('إنشاء الحساب')),
        ],
      ),
    );
    if (confirmed != true) return;
    if (nameCtrl.text.trim().isEmpty || phoneCtrl.text.trim().isEmpty) return;

    try {
      final uid = await ref.read(userRepositoryProvider).createDoctorAccount(
            phone: phoneCtrl.text.trim(),
            password: request.password,
            name: nameCtrl.text.trim(),
            clinicName: clinicCtrl.text.trim(),
            location: locationCtrl.text.trim(),
          );
      await ref.read(accountRequestRepositoryProvider).markApproved(request.id, uid);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل إنشاء الحساب: $e')),
        );
      }
    }
  }

  /// The primary submitter (`request.name`/`request.phone`/`request.password`)
  /// always becomes the center's manager — [AccountRequestDoctor.isManager]
  /// on the *added* doctors is purely a descriptive flag shown to the admin,
  /// not decision-driving, to avoid the account-creation-order headache of
  /// letting an added-but-not-yet-created doctor be the manager a
  /// [MedicalCenter] doc requires a managerUid to point at.
  Future<void> _approveCenter(
    BuildContext context,
    WidgetRef ref,
    AccountRequest request,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('قبول طلب مركز طبي'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('سيتم إنشاء "${request.centerName}" بـ ${request.chairCount} كرسي، '
                  'ومدير المركز: ${request.name}.'),
              const SizedBox(height: 8),
              Text('عدد الدكاترة الإضافيين: ${request.doctors.length}'),
              const SizedBox(height: 8),
              const Text(
                'سيتم استخدام كلمات السر التي اختارها كل دكتور بنفسه عند تقديم الطلب.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('إلغاء')),
          FilledButton(onPressed: () => Navigator.pop(c, true), child: const Text('إنشاء المركز')),
        ],
      ),
    );
    if (confirmed != true) return;

    final userRepo = ref.read(userRepositoryProvider);
    final centerRepo = ref.read(medicalCenterRepositoryProvider);
    try {
      final managerUid = await userRepo.createDoctorAccount(
        phone: request.phone,
        password: request.password,
        name: request.name,
        clinicName: request.clinicName,
        location: request.location,
      );

      final centerId = await centerRepo.createCenter(
        name: request.centerName,
        chairCount: request.chairCount,
        managerUid: managerUid,
        managerName: request.name,
      );
      await userRepo.setCenterMembership(uid: managerUid, centerId: centerId);

      final memberUids = [managerUid];
      for (final doctor in request.doctors) {
        final uid = await userRepo.createDoctorAccount(
          phone: doctor.phone,
          password: doctor.password,
          name: doctor.name,
          clinicName: request.centerName,
          location: request.location,
          centerId: centerId,
          accountType: AccountRequestType.center,
        );
        await centerRepo.addMember(centerId, uid, doctor.name);
        memberUids.add(uid);
      }

      await ref.read(accountRequestRepositoryProvider).markApprovedCenter(
            id: request.id,
            doctors: request.doctors,
            doctorUids: memberUids,
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم إنشاء المركز وحسابات الدكاترة بنجاح')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل إنشاء المركز: $e')),
        );
      }
    }
  }

  Future<void> _reject(BuildContext context, WidgetRef ref, AccountRequest request) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('رفض الطلب'),
        content: Text('هل تريد رفض طلب ${request.name}؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('إلغاء')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppTheme.danger),
            onPressed: () => Navigator.pop(c, true),
            child: const Text('رفض'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(accountRequestRepositoryProvider).rejectRequest(request.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestsAsync = ref.watch(accountRequestRepositoryProvider).watchPendingRequests();

    return Scaffold(
      appBar: AppBar(title: const Text('طلبات الحسابات')),
      body: StreamBuilder<List<AccountRequest>>(
        stream: requestsAsync,
        builder: (context, snap) {
          final requests = snap.data ?? [];
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (requests.isEmpty) {
            return const Center(child: Text('لا توجد طلبات حسابات جديدة'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: requests.length,
            itemBuilder: (context, i) {
              final r = requests[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(r.name, style: Theme.of(context).textTheme.titleMedium),
                          ),
                          if (r.accountType == AccountRequestType.center)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.primary.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text('مركز طبي',
                                  style: TextStyle(
                                      color: AppTheme.primary, fontSize: 11, fontWeight: FontWeight.w600)),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(r.phone, textDirection: TextDirection.ltr),
                      if (r.clinicName.isNotEmpty) Text('العيادة: ${r.clinicName}'),
                      if (r.location.isNotEmpty) Text('الموقع: ${r.location}'),
                      if (r.accountType == AccountRequestType.center) ...[
                        Text('المركز: ${r.centerName} — ${r.chairCount} كرسي'),
                        Text('دكاترة إضافيون: ${r.doctors.length}'),
                      ],
                      if (r.notes.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(r.notes, style: Theme.of(context).textTheme.bodySmall),
                      ],
                      if (r.createdAt != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          _dateFormat.format(r.createdAt!),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => _reject(context, ref, r),
                              child: const Text('رفض'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: FilledButton(
                              onPressed: () => _approve(context, ref, r),
                              child: const Text('قبول'),
                            ),
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
