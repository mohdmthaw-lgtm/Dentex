import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/constants/loyalty_tiers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/doctor_tier.dart';
import '../../../models/product.dart';
import '../../../models/product_variant.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/order_repository.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/tier_badge.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);

/// Manual order-entry flow: admin looks up an existing doctor (or creates
/// one on the spot), builds a cart of product+variant+quantity lines, and
/// records how much was paid now vs. left as debt. Mirrors the real-world
/// "doctor called or visited" flow described in the spec.
class OrderFormScreen extends ConsumerStatefulWidget {
  const OrderFormScreen({super.key});

  @override
  ConsumerState<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends ConsumerState<OrderFormScreen> {
  UserProfile? _selectedDoctor;
  final _doctorSearchController = TextEditingController();
  List<UserProfile> _searchResults = [];
  bool _searching = false;

  final List<CartLine> _cart = [];
  final _amountPaidController = TextEditingController(text: '0');
  final _notesController = TextEditingController();
  bool _submitting = false;

  // The selected doctor's loyalty-tier standing, based on their orders this
  // calendar year — determines the discount applied to this new order.
  DoctorTierInfo? _tierInfo;

  num get _discountRate => tierDiscounts[_tierInfo?.tier ?? DoctorTier.silver] ?? 0;

  @override
  void dispose() {
    _doctorSearchController.dispose();
    _amountPaidController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _searchDoctors(String query) async {
    setState(() => _searching = true);
    final results = await ref.read(userRepositoryProvider).searchDoctors(query);
    if (mounted) {
      setState(() {
        _searchResults = results;
        _searching = false;
      });
    }
  }

  num get _subtotal => _cart.fold(0, (sum, c) => sum + c.lineTotal);
  num get _discountAmount => _subtotal * _discountRate;
  num get _total => _subtotal - _discountAmount;

  Future<DoctorTierInfo> _fetchTierInfo(String doctorId) async {
    final orders = await ref.read(orderRepositoryProvider).getOrdersForDoctor(doctorId);
    return computeDoctorTierInfo(orders);
  }

  Future<void> _loadTierInfo() async {
    final doctor = _selectedDoctor;
    if (doctor == null) {
      setState(() => _tierInfo = null);
      return;
    }
    final info = await _fetchTierInfo(doctor.uid);
    if (mounted && _selectedDoctor?.uid == doctor.uid) {
      setState(() => _tierInfo = info);
    }
  }

  Future<void> _addProductToCart() async {
    final result = await showModalBottomSheet<List<CartLine>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _ProductPickerSheet(),
    );
    if (result != null && result.isNotEmpty) {
      setState(() => _cart.addAll(result));
    }
  }

  Future<void> _showCreateDoctorDialog() async {
    final nameCtrl = TextEditingController(text: _doctorSearchController.text);
    final phoneCtrl = TextEditingController();
    final clinicCtrl = TextEditingController();
    final locationCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    final created = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('إضافة دكتور جديد'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'الاسم')),
              TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'رقم الهاتف')),
              TextField(controller: clinicCtrl, decoration: const InputDecoration(labelText: 'اسم العيادة')),
              TextField(controller: locationCtrl, decoration: const InputDecoration(labelText: 'الموقع')),
              TextField(controller: passwordCtrl, decoration: const InputDecoration(labelText: 'كلمة سر مبدئية')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('إلغاء')),
          FilledButton(onPressed: () => Navigator.pop(c, true), child: const Text('إضافة')),
        ],
      ),
    );

    if (created == true &&
        nameCtrl.text.trim().isNotEmpty &&
        phoneCtrl.text.trim().isNotEmpty) {
      final uid = await ref.read(userRepositoryProvider).createDoctorAccount(
            phone: phoneCtrl.text.trim(),
            password: passwordCtrl.text.trim().isEmpty
                ? '123456'
                : passwordCtrl.text.trim(),
            name: nameCtrl.text.trim(),
            clinicName: clinicCtrl.text.trim(),
            location: locationCtrl.text.trim(),
          );
      setState(() {
        _selectedDoctor = UserProfile(
          uid: uid,
          role: 'doctor',
          phone: phoneCtrl.text.trim(),
          authEmail: '',
          name: nameCtrl.text.trim(),
          clinicName: clinicCtrl.text.trim(),
          location: locationCtrl.text.trim(),
        );
        _searchResults = [];
      });
      _loadTierInfo();
    }
  }

  Future<void> _submit() async {
    if (_selectedDoctor == null || _cart.isEmpty) return;
    setState(() => _submitting = true);
    try {
      final auth = ref.read(authServiceProvider);
      final currentUser = auth.currentUser;
      // Recompute fresh right before writing the order, in case the cart
      // was built up over a while and the doctor placed another order
      // meanwhile (from either this or another admin session).
      final tierInfo = await _fetchTierInfo(_selectedDoctor!.uid);
      final discountRate = tierDiscounts[tierInfo.tier] ?? 0;
      await ref.read(orderRepositoryProvider).createOrder(
            doctorId: _selectedDoctor!.uid,
            doctorNameSnapshot: _selectedDoctor!.name,
            doctorPhoneSnapshot: _selectedDoctor!.phone,
            createdBy: 'admin',
            createdByUid: currentUser!.uid,
            items: _cart,
            amountPaidNow: num.tryParse(_amountPaidController.text) ?? 0,
            notes: _notesController.text.trim(),
            discountRate: discountRate,
          );
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلبية جديدة')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('الدكتور', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (_selectedDoctor != null)
            Card(
              child: ListTile(
                title: Text(_selectedDoctor!.name),
                subtitle: Text(
                    '${_selectedDoctor!.clinicName}  •  ${_selectedDoctor!.phone}'),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => setState(() {
                    _selectedDoctor = null;
                    _tierInfo = null;
                  }),
                ),
              ),
            )
          else ...[
            TextField(
              controller: _doctorSearchController,
              decoration: const InputDecoration(
                labelText: 'ابحث باسم الدكتور أو رقم الهاتف',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (q) {
                if (q.trim().length >= 2) {
                  _searchDoctors(q);
                } else {
                  setState(() => _searchResults = []);
                }
              },
            ),
            if (_searching) const LinearProgressIndicator(),
            ..._searchResults.map((d) => ListTile(
                  title: Text(d.name),
                  subtitle: Text('${d.clinicName}  •  ${d.phone}'),
                  onTap: () {
                    setState(() {
                      _selectedDoctor = d;
                      _searchResults = [];
                    });
                    _loadTierInfo();
                  },
                )),
            TextButton.icon(
              onPressed: _showCreateDoctorDialog,
              icon: const Icon(Icons.person_add_alt),
              label: const Text('دكتور جديد غير موجود؟ أضفه الآن'),
            ),
          ],
          const Divider(height: 32),
          Row(
            children: [
              Text('المنتجات', style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              TextButton.icon(
                onPressed: _addProductToCart,
                icon: const Icon(Icons.add),
                label: const Text('إضافة منتج'),
              ),
            ],
          ),
          ..._cart.asMap().entries.map((entry) => Card(
                child: ListTile(
                  title: Text('${entry.value.productName} - ${entry.value.variantLabel}'),
                  subtitle: Text(
                      '${entry.value.quantity} × ${_currency.format(entry.value.unitSellPrice)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_currency.format(entry.value.lineTotal)),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                        onPressed: () => setState(() => _cart.removeAt(entry.key)),
                      ),
                    ],
                  ),
                ),
              )),
          if (_cart.isNotEmpty) ...[
            const Divider(),
            if (_discountRate > 0) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('المجموع قبل الخصم'),
                  Text(_currency.format(_subtotal),
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TierDiscountBadge(tier: _tierInfo!.tier, rate: _discountRate),
                  Text('- ${_currency.format(_discountAmount)}',
                      style: const TextStyle(color: AppTheme.success, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 4),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الإجمالي', style: Theme.of(context).textTheme.titleMedium),
                Text(_currency.format(_total),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.primary)),
              ],
            ),
          ],
          const Divider(height: 32),
          Text('الدفع', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _amountPaidController,
            decoration: const InputDecoration(labelText: 'المبلغ المدفوع الآن'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(labelText: 'ملاحظات (اختياري)'),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: (_selectedDoctor != null && _cart.isNotEmpty && !_submitting)
                ? _submit
                : null,
            style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            child: _submitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('تأكيد الطلبية'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ProductPickerSheet extends ConsumerStatefulWidget {
  const _ProductPickerSheet();

  @override
  ConsumerState<_ProductPickerSheet> createState() => _ProductPickerSheetState();
}

class _ProductPickerSheetState extends ConsumerState<_ProductPickerSheet> {
  Product? _selectedProduct;
  // variantId -> chosen quantity; lets several specs of the same product be
  // added at once instead of picking a single variant per visit to the sheet.
  final Map<String, int> _quantities = {};

  int get _selectedCount => _quantities.values.where((q) => q > 0).length;

  @override
  Widget build(BuildContext context) {
    final productsStream = ref.watch(productRepositoryProvider).watchProducts(activeOnly: true);

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      expand: false,
      builder: (context, scrollController) {
        if (_selectedProduct == null) {
          return StreamBuilder<List<Product>>(
            stream: productsStream,
            builder: (context, snap) {
              final products = snap.data ?? [];
              return ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  Text('اختر منتج', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  ...products.map((p) => ListTile(
                        title: Text(p.name),
                        subtitle: Text('الكمية المتوفرة: ${p.totalQuantity}'),
                        onTap: () => setState(() => _selectedProduct = p),
                      )),
                ],
              );
            },
          );
        }

        return StreamBuilder<List<ProductVariant>>(
          stream: ref.watch(productRepositoryProvider).watchVariants(_selectedProduct!.id),
          builder: (context, snap) {
            final variants = snap.data ?? [];
            return ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => setState(() {
                        _selectedProduct = null;
                        _quantities.clear();
                      }),
                    ),
                    Text(_selectedProduct!.name, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 8),
                ...variants.map((v) {
                  final qty = _quantities[v.id] ?? 0;
                  final outOfStock = v.quantity <= 0;
                  return ListTile(
                    title: Text(v.label),
                    subtitle: Text(outOfStock
                        ? 'نفذ من المخزون'
                        : '${_currency.format(v.sellPrice)} • متوفر ${v.quantity}'),
                    trailing: outOfStock
                        ? null
                        : Row(
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
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () => setState(() => _quantities[v.id] = qty + 1),
                              ),
                            ],
                          ),
                  );
                }),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _selectedCount > 0
                      ? () => Navigator.pop(
                            context,
                            variants
                                .where((v) => (_quantities[v.id] ?? 0) > 0)
                                .map((v) => CartLine(
                                      productId: _selectedProduct!.id,
                                      productName: _selectedProduct!.name,
                                      variantId: v.id,
                                      variantLabel: v.label,
                                      unitSellPrice: v.sellPrice,
                                      quantity: _quantities[v.id]!,
                                    ))
                                .toList(),
                          )
                      : null,
                  child: Text(_selectedCount > 0
                      ? 'إضافة $_selectedCount مواصفة إلى الطلبية'
                      : 'إضافة إلى الطلبية'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
