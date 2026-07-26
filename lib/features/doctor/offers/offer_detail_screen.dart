import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/offer.dart';
import '../../../services/firebase/order_repository.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);
final _date = DateFormat.yMMMd('ar');

class OfferDetailScreen extends ConsumerStatefulWidget {
  const OfferDetailScreen({super.key, required this.offerId});
  final String offerId;

  @override
  ConsumerState<OfferDetailScreen> createState() => _OfferDetailScreenState();
}

class _OfferDetailScreenState extends ConsumerState<OfferDetailScreen> {
  int _quantity = 1;
  bool _submitting = false;

  /// Distributes the package's discounted price across its component lines
  /// proportional to each product's normal-price share, so the resulting
  /// order total exactly matches `offer.offerPrice * packageQty` while
  /// every OrderItem still carries a real per-unit sell price.
  List<CartLine> _buildCartLines(Offer offer) {
    final originalTotal = offer.originalTotal;
    return offer.items.map((item) {
      final share = originalTotal <= 0 ? item.unitPrice : (offer.offerPrice * item.unitPrice / originalTotal);
      final unitSellPrice = share.round();
      return CartLine(
        productId: item.productId,
        productName: item.productName,
        variantId: item.variantId,
        variantLabel: item.variantLabel,
        unitSellPrice: unitSellPrice,
        quantity: item.quantity * _quantity,
        offerId: offer.id,
        offerName: offer.title,
      );
    }).toList();
  }

  Future<void> _order(Offer offer) async {
    setState(() => _submitting = true);
    try {
      final auth = ref.read(authServiceProvider);
      final uid = auth.currentUser!.uid;
      final profile = await ref.read(userRepositoryProvider).getUser(uid);
      await ref.read(orderRepositoryProvider).createOrder(
            doctorId: uid,
            doctorNameSnapshot: profile?.name ?? '',
            doctorPhoneSnapshot: profile?.phone ?? '',
            createdBy: 'doctor',
            createdByUid: uid,
            items: _buildCartLines(offer),
            amountPaidNow: 0,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم إرسال طلب العرض بنجاح')),
        );
        context.pop();
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final offerStream = ref.watch(offerRepositoryProvider).watchOffer(widget.offerId);

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل العرض')),
      body: StreamBuilder<Offer?>(
        stream: offerStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('تعذر تحميل العرض: ${snap.error}'));
          }
          final offer = snap.data;
          if (offer == null) {
            return const Center(child: Text('هذا العرض لم يعد متاحًا'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    if (offer.imageUrl.isNotEmpty)
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(imageUrl: offer.imageUrl, fit: BoxFit.cover),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(offer.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          if (offer.description.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text(offer.description, style: Theme.of(context).textTheme.bodyLarge),
                          ],
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(_currency.format(offer.originalTotal),
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 16)),
                              const SizedBox(width: 10),
                              Text(_currency.format(offer.offerPrice),
                                  style: const TextStyle(
                                      color: AppTheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                            ],
                          ),
                          Text(
                            'توفير ${_currency.format(offer.discountAmount)} (${offer.discountPercent.toStringAsFixed(0)}%)',
                            style: const TextStyle(color: AppTheme.success, fontWeight: FontWeight.w600),
                          ),
                          if (offer.endDate != null) ...[
                            const SizedBox(height: 6),
                            Text('ينتهي العرض في ${_date.format(offer.endDate!)}',
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                          const SizedBox(height: 20),
                          Text('محتويات العرض', style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 8),
                          ...offer.items.map((item) => Card(
                                child: ListTile(
                                  leading: const Icon(Icons.inventory_2_outlined),
                                  title: Text('${item.productName} - ${item.variantLabel}'),
                                  subtitle: Text('الكمية: ${item.quantity}'),
                                  trailing: Text(_currency.format(item.lineTotal)),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, -2)),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                      ),
                      Text('$_quantity', style: Theme.of(context).textTheme.titleLarge),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => setState(() => _quantity++),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          onPressed: _submitting ? null : () => _order(offer),
                          style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                          child: _submitting
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                              : Text('اطلب الآن (${_currency.format(offer.offerPrice * _quantity)})'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
