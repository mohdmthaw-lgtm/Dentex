import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/offer.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);

class OffersListScreen extends ConsumerWidget {
  const OffersListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offersStream = ref.watch(offerRepositoryProvider).watchOffers();

    return Scaffold(
      appBar: AppBar(title: const Text('العروض')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/admin/offers/new'),
        icon: const Icon(Icons.add),
        label: const Text('إضافة عرض'),
      ),
      body: StreamBuilder<List<Offer>>(
        stream: offersStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('تعذر تحميل العروض: ${snap.error}'));
          }
          final offers = snap.data ?? [];
          if (offers.isEmpty) {
            return const Center(child: Text('لا توجد عروض بعد'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: offers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _OfferCard(offer: offers[i]),
          );
        },
      ),
    );
  }
}

class _OfferCard extends ConsumerWidget {
  const _OfferCard({required this.offer});
  final Offer offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/admin/offers/${offer.id}'),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: offer.imageUrl.isEmpty
                          ? Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.local_offer_outlined,
                                  color: Colors.grey),
                            )
                          : CachedNetworkImage(
                              imageUrl: offer.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(offer.title,
                                  style: const TextStyle(fontWeight: FontWeight.w600)),
                            ),
                            _StatusBadge(status: offer.status),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              _currency.format(offer.originalTotal),
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                            const SizedBox(width: 6),
                            Text(_currency.format(offer.offerPrice),
                                style: const TextStyle(
                                    color: AppTheme.primary, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Text('${offer.items.length} منتج · تم بيعه ${offer.timesSold} مرة',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) async {
                      final repo = ref.read(offerRepositoryProvider);
                      if (value == 'toggle') {
                        await repo.setActive(offer.id, !offer.isActive);
                      } else if (value == 'edit') {
                        if (context.mounted) context.push('/admin/offers/${offer.id}');
                      } else if (value == 'delete') {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (c) => AlertDialog(
                            title: const Text('حذف العرض'),
                            content: Text('هل أنت متأكد من حذف "${offer.title}"؟'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(c, false),
                                  child: const Text('إلغاء')),
                              TextButton(
                                  onPressed: () => Navigator.pop(c, true),
                                  child: const Text('حذف',
                                      style: TextStyle(color: AppTheme.danger))),
                            ],
                          ),
                        );
                        if (confirm == true) await repo.deleteOffer(offer.id);
                      }
                    },
                    itemBuilder: (c) => [
                      PopupMenuItem(
                        value: 'toggle',
                        child: Text(offer.isActive ? 'إيقاف العرض' : 'تفعيل العرض'),
                      ),
                      const PopupMenuItem(value: 'edit', child: Text('تعديل')),
                      const PopupMenuItem(value: 'delete', child: Text('حذف')),
                    ],
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

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});
  final OfferStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      OfferStatus.active => ('فعال', AppTheme.success),
      OfferStatus.inactive => ('غير فعال', Colors.grey),
      OfferStatus.expired => ('منتهي', AppTheme.danger),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 11)),
    );
  }
}
