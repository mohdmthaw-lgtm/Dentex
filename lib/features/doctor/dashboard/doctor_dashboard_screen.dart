import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/loyalty_tiers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/doctor_tier.dart';
import '../../../models/order.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/auth_service.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';
import '../account/change_password_screen.dart';

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

    if (uid == null) return const Scaffold(body: SizedBox.shrink());

    // Walk-in accounts get a system-generated temp password (see
    // UserRepository.createDoctorAccount) — block the real dashboard until
    // the doctor sets their own, rather than nesting this inside it.
    return StreamBuilder<UserProfile?>(
      stream: ref.watch(userRepositoryProvider).watchUser(uid),
      builder: (context, snap) {
        final profile = snap.data;
        if (profile != null && profile.mustChangePassword) {
          return ChangePasswordScreen(uid: uid);
        }
        return _DoctorDashboardBody(auth: auth, uid: uid, profile: profile);
      },
    );
  }
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

class _DoctorDashboardBody extends ConsumerWidget {
  const _DoctorDashboardBody({required this.auth, required this.uid, required this.profile});

  final AuthService auth;
  final String uid;
  final UserProfile? profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/dentex_logo.png', height: 36),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'حسابي',
            onPressed: profile == null
                ? null
                : () => context.push('/doctor/account', extra: profile),
          ),
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
      body: StreamBuilder<List<Order>>(
        stream: ref.watch(orderRepositoryProvider).watchOrdersForDoctor(uid),
        builder: (context, ordersSnap) {
          final tierInfo = computeDoctorTierInfo(ordersSnap.data ?? []);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (profile != null) _WelcomeCard(name: profile!.name, tierInfo: tierInfo),
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
                // List order is mirrored by the RTL grid: item 1
                // lands in the rightmost cell, item 2 to its left.
                _ActionTile(
                  label: 'فواتيري / طلبياتي',
                  emoji: '🧾',
                  warning: (profile?.stats.totalDebt ?? 0) > 0
                      ? '⚠️ ${_currency.format(profile?.stats.totalDebt ?? 0)} متأخر عليّ'
                      : null,
                  onTap: () => context.push('/doctor/orders'),
                ),
                _ActionTile(
                  label: 'المنتجات والعروض',
                  emoji: '📦',
                  onTap: () => context.push('/doctor/create-order', extra: profile),
                ),
              ]),
              const SizedBox(height: 4),
              _CreateOrderCta(onTap: () => context.push('/doctor/create-order', extra: profile)),
              const SizedBox(height: 24),
              Text('قسم الإدارة', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              if (profile != null)
                StatTileRow(tiles: [
                  _ManagementTile(
                    label: 'مرضاي',
                    emoji: '🦷',
                    color: AppTheme.accent,
                    onTap: () => context.push('/doctor/patients', extra: profile),
                  ),
                  _ManagementTile(
                    label: 'حساباتي',
                    emoji: '💳',
                    color: AppTheme.warning,
                    onTap: () => context.push('/doctor/accounting', extra: profile),
                  ),
                  _ManagementTile(
                    label: 'مواعيدي',
                    emoji: '📅',
                    color: AppTheme.info,
                    onTap: () => context.push('/doctor/appointments', extra: profile),
                  ),
                ]),
            ],
          );
        },
      ),
    );
  }
}

/// Darkens a tier color for the progress-bar fill so it reads clearly
/// against the card's own teal gradient background.
Color _darken(Color color, [double amount = 0.25]) {
  final hsl = HSLColor.fromColor(color);
  return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({required this.name, required this.tierInfo});

  final String name;
  final DoctorTierInfo tierInfo;

  @override
  Widget build(BuildContext context) {
    final meta = tierMeta[tierInfo.tier]!;
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
            'مرحباً د. $name ${meta.emoji}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  Container(
                      height: 8, width: constraints.maxWidth, color: Colors.white.withOpacity(0.25)),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease,
                    height: 8,
                    width: constraints.maxWidth * tierInfo.progressPercent,
                    color: _darken(meta.color),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            tierInfo.nextTier == null
                ? 'أعلى مستوى لعام ${tierInfo.year} 💎'
                : 'باقي ${_currency.format(tierInfo.amountToNext)} للمستوى التالي (هذا العام)',
            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// Full-width, single-row CTA — replaces a previous 120px-tall block
/// button that ate too much of the dashboard for what's just one tap
/// target. Icon-label-chevron reads right-to-left with the rest of the
/// screen (Directionality is rtl app-wide), so the chevron lands on the
/// leading/left edge as a "go" affordance rather than centered dead space.
/// primaryDark (not plain primary) so this — the dashboard's one real
/// call-to-action — reads as a step darker/richer than the flat-teal icons
/// on the tiles around it, instead of blending into them.
class _CreateOrderCta extends StatelessWidget {
  const _CreateOrderCta({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.primaryDark,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Row(
            children: [
              Icon(Icons.add_shopping_cart, color: Colors.white, size: 22),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'إنشاء طلبية',
                  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.arrow_back_ios_new, color: Colors.white70, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

/// Same visual shell as [StatTile] but tappable and without a value line —
/// used for "فواتيري / طلبياتي" and "المنتجات والعروض". [warning], when
/// set, folds what used to be the separate "متأخر عليّ" tile into a small
/// orange line under the label instead of its own grid cell.
class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.label,
    required this.emoji,
    required this.onTap,
    this.warning,
  });

  final String label;
  final String emoji;
  final VoidCallback onTap;
  final String? warning;

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
              Text(emoji, style: const TextStyle(fontSize: 26)),
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
              if (warning != null) ...[
                const SizedBox(height: 4),
                Text(
                  warning!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppTheme.warning, fontSize: 11, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// The two "قسم الإدارة" entry points (مرضاي/حساباتي) — visually set apart
/// from the ordering tiles above by reusing [_WelcomeCard]'s own gradient
/// (rather than inventing a new color), plus a small "جديد" pill in the
/// same ad-hoc-pill convention as [TierBadge].
class _ManagementTile extends StatelessWidget {
  const _ManagementTile({
    required this.label,
    required this.emoji,
    required this.color,
    required this.onTap,
  });

  final String label;
  final String emoji;
  // Each tile gets its own accent (patients=teal, accounting=amber,
  // appointments=blue) instead of all three sharing the brand teal — three
  // back-to-back identical-color cards was the single most repetitive
  // block on the dashboard.
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, _darken(color)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('جديد',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(emoji, style: const TextStyle(fontSize: 26)),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
