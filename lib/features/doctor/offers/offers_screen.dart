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
final _date = DateFormat.yMMMd('ar');

class OffersScreen extends ConsumerWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offersStream =
        ref.watch(offerRepositoryProvider).watchOffers(activeOnly: true);

    return Scaffold(
      appBar: AppBar(title: const Text('العروض')),
      body: StreamBuilder<List<Offer>>(
        stream: offersStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('تعذر تحميل العروض: ${snap.error}'));
          }
          // watchOffers(activeOnly: true) filters on the isActive flag only;
          // an offer past its endDate is still isActive=true until an admin
          // flips it, so also drop expired ones here.
          final offers = (snap.data ?? [])
              .where((o) => o.status == OfferStatus.active)
              .toList();
          if (offers.isEmpty) {
            return const Center(child: Text('لا توجد عروض حالياً'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: offers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => _OfferCard(offer: offers[i]),
          );
        },
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.offer});
  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/doctor/offers/${offer.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (offer.imageUrl.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(imageUrl: offer.imageUrl, fit: BoxFit.cover),
              ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(offer.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  if (offer.description.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(offer.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        _currency.format(offer.originalTotal),
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Text(_currency.format(offer.offerPrice),
                          style: const TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.success.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'وفّر ${offer.discountPercent.toStringAsFixed(0)}%',
                          style: const TextStyle(
                              color: AppTheme.success, fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  if (offer.endDate != null) ...[
                    const SizedBox(height: 6),
                    Text('ينتهي العرض: ${_date.format(offer.endDate!)}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey.shade600)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
