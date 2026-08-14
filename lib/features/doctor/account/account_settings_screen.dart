import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

/// App Store Guideline 5.1.1(v): an app that supports account creation must
/// also let the user delete their own account (not just sign out or
/// deactivate). This screen is that entry point for doctor accounts.
class AccountSettingsScreen extends ConsumerStatefulWidget {
  const AccountSettingsScreen({super.key, required this.profile});

  final UserProfile profile;

  @override
  ConsumerState<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends ConsumerState<AccountSettingsScreen> {
  bool _isDeleting = false;

  Future<void> _confirmAndDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('حذف الحساب نهائياً؟'),
        content: const Text(
          'سيتم حذف حسابك وبياناتك الشخصية بشكل نهائي ولا يمكن التراجع عن هذا الإجراء. '
          'سجل طلباتك السابقة يبقى محفوظاً لدى الموزع لأغراض محاسبية.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('إلغاء')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppTheme.danger),
            onPressed: () => Navigator.pop(c, true),
            child: const Text('حذف نهائياً'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _isDeleting = true);
    try {
      await ref.read(userRepositoryProvider).deleteOwnAccount();
      await ref.read(authServiceProvider).signOut();
      // No explicit navigation — deleting + signing out flips
      // appAuthStateProvider to signedOut, and the router redirects to
      // /login on its own.
    } catch (e) {
      if (mounted) {
        setState(() => _isDeleting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تعذر حذف الحساب: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile;
    return Scaffold(
      appBar: AppBar(title: const Text('حسابي')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.name, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(profile.phone, textDirection: TextDirection.ltr),
                  if (profile.clinicName.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text('العيادة: ${profile.clinicName}'),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            color: AppTheme.danger.withOpacity(0.06),
            child: ListTile(
              leading: const Icon(Icons.delete_forever, color: AppTheme.danger),
              title: const Text('حذف الحساب', style: TextStyle(color: AppTheme.danger)),
              subtitle: const Text('حذف نهائي لحسابك وبياناتك الشخصية'),
              trailing: _isDeleting
                  ? const SizedBox(
                      height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.chevron_left),
              onTap: _isDeleting ? null : _confirmAndDelete,
            ),
          ),
        ],
      ),
    );
  }
}
