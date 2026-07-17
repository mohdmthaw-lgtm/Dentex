import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/product.dart';
import '../../../models/product_variant.dart';
import '../../../services/firebase/order_repository.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: 'ر.س', decimalDigits: 0);

/// Doctor-facing order builder. Shows sell price only (never cost/profit —
/// enforced both here by simply not fetching cost data, and structurally by
/// Firestore rules, since costs live in an admin-only sibling path the
/// doctor's credentials can't read at all).
class CreateOrderScreen extends ConsumerStatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  ConsumerState<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends ConsumerState<CreateOrderScreen> {
  final List<CartLine> _cart = [];
  bool _submitting = false;

  num get _total => _cart.fold(0, (sum, c) => sum + c.lineTotal);
  int get _itemCount => _cart.fold(0, (sum, c) => sum + c.quantity);

  Future<void> _pickVariant(Product product) async {
    final variants =
        await ref.read(productRepositoryProvider).watchVariants(product.id).first;
    if (!mounted) return;
    final result = await showModalBottomSheet<CartLine>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _VariantPickerSheet(product: product, variants: variants),
    );
    if (result != null) {
      setState(() => _cart.add(result));
    }
  }

  Future<void> _submitOrder() async {
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
            items: _cart,
            amountPaidNow: 0, // COD — payment happens on delivery.
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم إرسال الطلبية بنجاح')),
        );
        context.pop();
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsStream = ref.watch(productRepositoryProvider).watchProducts(activeOnly: true);

    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء طلبية')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: productsStream,
              builder: (context, snap) {
                final products = snap.data ?? [];
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final p = products[i];
                    final minPrice = p.variantSummaries.isEmpty
                        ? null
                        : p.variantSummaries.map((v) => v.sellPrice).reduce((a, b) => a < b ? a : b);
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => _pickVariant(p),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: p.imageUrl.isEmpty
                                      ? Container(
                                          color: Colors.grey.shade200,
                                          child: const Icon(Icons.inventory_2_outlined),
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: p.imageUrl, fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(p.name,
                                        style: const TextStyle(fontWeight: FontWeight.w600)),
                                    if (p.description.isNotEmpty)
                                      Text(p.description,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.bodySmall),
                                    if (minPrice != null)
                                      Text(_currency.format(minPrice),
                                          style: const TextStyle(
                                              color: AppTheme.primary, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.add_circle_outline, color: AppTheme.primary),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (_cart.isNotEmpty)
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$_itemCount منتج', style: Theme.of(context).textTheme.bodySmall),
                          Text(_currency.format(_total),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                    ),
                    FilledButton(
                      onPressed: _submitting ? null : () => _showCartSheet(context),
                      child: const Text('مراجعة الطلبية'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showCartSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        expand: false,
        builder: (context, scrollController) => StatefulBuilder(
          builder: (context, setSheetState) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('مراجعة الطلبية', style: Theme.of(context).textTheme.titleMedium),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _cart.length,
                  itemBuilder: (context, i) => ListTile(
                    title: Text('${_cart[i].productName} - ${_cart[i].variantLabel}'),
                    subtitle: Text('${_cart[i].quantity} × ${_currency.format(_cart[i].unitSellPrice)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                      onPressed: () {
                        setState(() => _cart.removeAt(i));
                        setSheetState(() {});
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton(
                  onPressed: _cart.isEmpty || _submitting
                      ? null
                      : () {
                          Navigator.pop(context);
                          _submitOrder();
                        },
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: Text('تأكيد الطلبية (${_currency.format(_total)})'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VariantPickerSheet extends StatefulWidget {
  const _VariantPickerSheet({required this.product, required this.variants});
  final Product product;
  final List<ProductVariant> variants;

  @override
  State<_VariantPickerSheet> createState() => _VariantPickerSheetState();
}

class _VariantPickerSheetState extends State<_VariantPickerSheet> {
  ProductVariant? _selected;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.product.name, style: Theme.of(context).textTheme.titleMedium),
          if (widget.product.description.isNotEmpty)
            Text(widget.product.description, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          ...widget.variants.map((v) => RadioListTile<ProductVariant>(
                title: Text(v.label),
                subtitle: Text(_currency.format(v.sellPrice)),
                value: v,
                groupValue: _selected,
                onChanged: v.quantity > 0 ? (val) => setState(() => _selected = val) : null,
              )),
          if (_selected != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            FilledButton(
              onPressed: () => Navigator.pop(
                context,
                CartLine(
                  productId: widget.product.id,
                  productName: widget.product.name,
                  variantId: _selected!.id,
                  variantLabel: _selected!.label,
                  unitSellPrice: _selected!.sellPrice,
                  quantity: _quantity,
                ),
              ),
              child: const Text('إضافة إلى السلة'),
            ),
          ],
        ],
      ),
    );
  }
}
