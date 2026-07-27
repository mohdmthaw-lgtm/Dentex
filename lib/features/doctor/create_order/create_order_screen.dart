import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/constants/loyalty_tiers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/doctor_tier.dart';
import '../../../models/order.dart';
import '../../../models/product.dart';
import '../../../models/product_variant.dart';
import '../../../services/firebase/order_repository.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/tier_badge.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);

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
  final _searchController = TextEditingController();
  String _query = '';
  bool _submitting = false;

  // This doctor's orders (all-time), fetched once and reused both to
  // compute the discount that applies to this new order and, right after
  // submission, to optimistically predict whether it crosses into a new
  // tier — see _maybeShowTierUpBanner.
  List<Order> _doctorOrders = [];
  DoctorTierInfo? _tierInfo;

  num get _subtotal => _cart.fold(0, (sum, c) => sum + c.lineTotal);
  num get _discountRate => tierDiscounts[_tierInfo?.tier ?? DoctorTier.silver] ?? 0;
  num get _discountAmount => _subtotal * _discountRate;
  num get _total => _subtotal - _discountAmount;
  int get _itemCount => _cart.fold(0, (sum, c) => sum + c.quantity);

  @override
  void initState() {
    super.initState();
    _loadTierInfo();
  }

  Future<void> _loadTierInfo() async {
    final uid = ref.read(authServiceProvider).currentUser!.uid;
    final orders = await ref.read(orderRepositoryProvider).getOrdersForDoctor(uid);
    if (mounted) {
      setState(() {
        _doctorOrders = orders;
        _tierInfo = computeDoctorTierInfo(orders);
      });
    }
  }

  int _tierRank(String tier) => switch (tier) {
        DoctorTier.platinum => 2,
        DoctorTier.gold => 1,
        _ => 0,
      };

  /// Best-effort, client-only prediction shown immediately after a
  /// successful submit — the durable tier-upgrade record (activity log +
  /// lastSeenTier) is written server-side by onOrderCreated regardless of
  /// whether this banner manages to show.
  void _maybeShowTierUpBanner(String uid, num orderTotal) {
    final before = _tierInfo;
    if (before == null) return;
    final projected = Order(
      id: 'projected',
      doctorId: uid,
      doctorNameSnapshot: '',
      createdBy: 'doctor',
      createdByUid: uid,
      totalAmount: orderTotal,
      amountRemaining: orderTotal, // COD — unpaid until delivery.
      createdAt: DateTime.now(),
    );
    final after = computeDoctorTierInfo([..._doctorOrders, projected]);
    if (_tierRank(after.tier) > _tierRank(before.tier)) {
      _showTierUpBanner(after.tier);
    }
  }

  void _showTierUpBanner(String tier) {
    final meta = tierMeta[tier]!;
    final overlay = Overlay.of(context);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: meta.color,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 12, offset: const Offset(0, 4)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text('🎉 ترقّيت إلى المستوى ${meta.label} ${meta.emoji}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 18),
                  onPressed: () => entry.remove(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 4), () {
      if (entry.mounted) entry.remove();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _pickVariant(Product product) async {
    final variants =
        await ref.read(productRepositoryProvider).watchVariants(product.id).first;
    if (!mounted) return;
    final result = await showModalBottomSheet<List<CartLine>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _VariantPickerSheet(product: product, variants: variants),
    );
    if (result != null && result.isNotEmpty) {
      setState(() => _cart.addAll(result));
    }
  }

  Future<void> _submitOrder() async {
    setState(() => _submitting = true);
    try {
      final auth = ref.read(authServiceProvider);
      final uid = auth.currentUser!.uid;
      final profile = await ref.read(userRepositoryProvider).getUser(uid);
      // Recompute fresh right before writing the order, in case time has
      // passed since this screen loaded and another order already landed.
      final freshOrders = await ref.read(orderRepositoryProvider).getOrdersForDoctor(uid);
      final tierInfo = computeDoctorTierInfo(freshOrders);
      final discountRate = tierDiscounts[tierInfo.tier] ?? 0;
      await ref.read(orderRepositoryProvider).createOrder(
            doctorId: uid,
            doctorNameSnapshot: profile?.name ?? '',
            doctorPhoneSnapshot: profile?.phone ?? '',
            createdBy: 'doctor',
            createdByUid: uid,
            items: _cart,
            amountPaidNow: 0, // COD — payment happens on delivery.
            discountRate: discountRate,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم إرسال الطلبية بنجاح')),
        );
        final subtotal = _cart.fold<num>(0, (sum, c) => sum + c.lineTotal);
        _doctorOrders = freshOrders;
        _tierInfo = tierInfo;
        _maybeShowTierUpBanner(uid, subtotal - subtotal * discountRate);
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
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ابحث عن منتج...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      ),
              ),
              onChanged: (v) => setState(() => _query = v.trim()),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: productsStream,
              builder: (context, snap) {
                final products = snap.data ?? [];
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(child: Text('تعذر تحميل المنتجات: ${snap.error}'));
                }
                if (products.isEmpty) {
                  return const Center(child: Text('لا توجد منتجات متاحة حالياً'));
                }
                final filtered = _query.isEmpty
                    ? products
                    : products
                        .where((p) =>
                            p.name.contains(_query) ||
                            p.manufacturer.contains(_query))
                        .toList();
                if (filtered.isEmpty) {
                  return const Center(child: Text('لا نتائج مطابقة'));
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, i) => _ProductCard(
                    product: filtered[i],
                    onTap: () => _pickVariant(filtered[i]),
                  ),
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
                          if (_discountRate > 0)
                            Row(
                              children: [
                                Text(_currency.format(_subtotal),
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                        fontSize: 13)),
                                const SizedBox(width: 6),
                                Text(_currency.format(_total),
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              ],
                            )
                          else
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
              if (_discountRate > 0)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TierDiscountBadge(tier: _tierInfo!.tier, rate: _discountRate),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: '${_currency.format(_subtotal)}  ',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough, color: Colors.grey)),
                          TextSpan(
                              text: _currency.format(_total),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, color: AppTheme.primary)),
                        ]),
                      ),
                    ],
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

/// Square-ish catalog card: a large image on top, name/manufacturer/price
/// below — replaces the old thin list row, which wasted most of its width
/// on empty space either side of a small thumbnail.
class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product, required this.onTap});
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final minPrice = product.variantSummaries.isEmpty
        ? null
        : product.variantSummaries.map((v) => v.sellPrice).reduce((a, b) => a < b ? a : b);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: product.imageUrl.isEmpty
                  ? Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.inventory_2_outlined,
                          size: 36, color: Colors.grey),
                    )
                  : CachedNetworkImage(imageUrl: product.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                  if (product.manufacturer.isNotEmpty)
                    Text(product.manufacturer,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey.shade600)),
                  const SizedBox(height: 4),
                  if (minPrice != null)
                    Text(_currency.format(minPrice),
                        style: const TextStyle(
                            color: AppTheme.primary, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
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
  // variantId -> chosen quantity; lets several specs of the same product be
  // added at once instead of picking a single variant per visit to the sheet.
  final Map<String, int> _quantities = {};

  int get _selectedCount => _quantities.values.where((q) => q > 0).length;

  void _submit() {
    final lines = widget.variants
        .where((v) => (_quantities[v.id] ?? 0) > 0)
        .map((v) => CartLine(
              productId: widget.product.id,
              productName: widget.product.name,
              variantId: v.id,
              variantLabel: v.label,
              unitSellPrice: v.sellPrice,
              quantity: _quantities[v.id]!,
            ))
        .toList();
    Navigator.pop(context, lines);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              children: [
                if (widget.product.imageUrl.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                          imageUrl: widget.product.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                const SizedBox(height: 14),
                Text(widget.product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                if (widget.product.manufacturer.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(widget.product.manufacturer,
                        style: TextStyle(color: Colors.grey.shade600)),
                  ),
                if (widget.product.description.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(widget.product.description,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                const SizedBox(height: 16),
                Text('اختر المواصفة والكمية',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey.shade600)),
                const SizedBox(height: 8),
                ...widget.variants.map((v) {
                  final qty = _quantities[v.id] ?? 0;
                  final outOfStock = v.quantity <= 0;
                  final selected = qty > 0;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: selected ? AppTheme.primary : Colors.grey.shade200,
                        width: selected ? 2 : 1,
                      ),
                      color: selected ? AppTheme.primary.withOpacity(0.05) : null,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: v.imageUrl.isNotEmpty
                                ? CachedNetworkImage(imageUrl: v.imageUrl, fit: BoxFit.cover)
                                : Container(
                                    color: Colors.grey.shade100,
                                    child: Icon(Icons.inventory_2_outlined,
                                        color: Colors.grey.shade400),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(v.label,
                                  style: const TextStyle(fontWeight: FontWeight.w600)),
                              Text(
                                outOfStock ? 'نفذ من المخزون' : _currency.format(v.sellPrice),
                                style: TextStyle(
                                  color: outOfStock ? AppTheme.danger : AppTheme.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!outOfStock)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: qty > 0
                                    ? () => setState(() => _quantities[v.id] = qty - 1)
                                    : null,
                              ),
                              Text('$qty', style: Theme.of(context).textTheme.titleMedium),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline, color: AppTheme.primary),
                                onPressed: () => setState(() => _quantities[v.id] = qty + 1),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: _selectedCount > 0 ? _submit : null,
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: Text(_selectedCount > 0
                      ? 'إضافة $_selectedCount مواصفة إلى السلة'
                      : 'إضافة إلى السلة'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
