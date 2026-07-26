import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);

const _supportWhatsAppNumber = '970592040123';

/// Deliberately minimal per spec: order count + amount owed, a link to
/// past orders, and one big "create order" call to action — no admin-style
/// dense dashboard here.
class DoctorDashboardScreen extends ConsumerWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    final uid = auth.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/dentex_logo.png', height: 36),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => auth.signOut(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () => _openWhatsApp(context),
        child: SvgPicture.asset('assets/images/whatsapp_icon.svg', width: 28, height: 28),
      ),
      body: uid == null
          ? const SizedBox.shrink()
          : StreamBuilder<UserProfile?>(
              stream: ref.watch(userRepositoryProvider).watchUser(uid),
              builder: (context, snap) {
                final profile = snap.data;
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (profile != null) _WelcomeCard(name: profile.name),
                    const SizedBox(height: 16),
                    Text(
                      'طلبات أسرع - إدارة أسهل - وعيادة جاهزة دائماً',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    StatTileRow(tiles: [
                      // List order is mirrored by the RTL grid: item 1 lands
                      // in the rightmost cell, item 2 to its left, etc.
                      StatTile(
                        label: 'عدد طلبياتي',
                        value: '${profile?.stats.totalOrders ?? 0}',
                        icon: Icons.receipt_long_outlined,
                        color: AppTheme.primary,
                      ),
                      StatTile(
                        label: 'متأخر عليّ',
                        value: _currency.format(profile?.stats.totalDebt ?? 0),
                        icon: Icons.warning_amber_outlined,
                        color: AppTheme.warning,
                      ),
                      _ActionTile(
                        label: 'فواتيري / طلبياتي',
                        icon: Icons.receipt_long,
                        color: AppTheme.primary,
                        onTap: () => context.push('/doctor/orders'),
                      ),
                      _ActionTile(
                        label: 'العروض',
                        icon: Icons.local_offer_outlined,
                        color: AppTheme.warning,
                        onTap: () => context.push('/doctor/offers'),
                      ),
                    ]),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 120,
                      child: FilledButton.icon(
                        onPressed: () => context.push('/doctor/create-order'),
                        icon: const Icon(Icons.add_shopping_cart, size: 32),
                        label: const Text('إنشاء طلبية',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  Future<void> _openWhatsApp(BuildContext context) async {
    final uri = Uri.parse('https://wa.me/$_supportWhatsAppNumber');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر فتح واتساب')),
        );
      }
    }
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.primary, AppTheme.primaryDark],
        ),
      ),
      child: Column(
        children: [
          Text(
            'مرحباً د. $name',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'إليك ملخص حسابك اليوم',
            style: TextStyle(color: Colors.white.withOpacity(0.85)),
          ),
        ],
      ),
    );
  }
}

/// Same visual shell as [StatTile] but tappable and without a value line —
/// used for the two link-style tiles ("العروض" / "فواتيري / طلبياتي").
class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
