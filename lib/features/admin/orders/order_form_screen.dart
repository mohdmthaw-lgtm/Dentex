import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/product.dart';
import '../../../models/product_variant.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/order_repository.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: 'ر.س', decimalDigits: 0);

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

  num get _total => _cart.fold(0, (sum, c) => sum + c.lineTotal);

  Future<void> _addProductToCart() async {
    final result = await showModalBottomSheet<CartLine>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _ProductPickerSheet(),
    );
    if (result != null) {
      setState(() => _cart.add(result));
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
    }
  }

  Future<void> _submit() async {
    if (_selectedDoctor == null || _cart.isEmpty) return;
    setState(() => _submitting = true);
    try {
      final auth = ref.read(authServiceProvider);
      final currentUser = auth.currentUser;
      await ref.read(orderRepositoryProvider).createOrder(
            doctorId: _selectedDoctor!.uid,
            doctorNameSnapshot: _selectedDoctor!.name,
            doctorPhoneSnapshot: _selectedDoctor!.phone,
            createdBy: 'admin',
            createdByUid: currentUser!.uid,
            items: _cart,
            amountPaidNow: num.tryParse(_amountPaidController.text) ?? 0,
            notes: _notesController.text.trim(),
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
                  onPressed: () => setState(() => _selectedDoctor = null),
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
                  onTap: () => setState(() {
                    _selectedDoctor = d;
                    _searchResults = [];
                  }),
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
  ProductVariant? _selectedVariant;
  int _quantity = 1;

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
                        _selectedVariant = null;
                      }),
                    ),
                    Text(_selectedProduct!.name, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 8),
                ...variants.map((v) => RadioListTile<ProductVariant>(
                      title: Text(v.label),
                      subtitle: Text('${_currency.format(v.sellPrice)} • متوفر ${v.quantity}'),
                      value: v,
                      groupValue: _selectedVariant,
                      onChanged: (val) => setState(() => _selectedVariant = val),
                    )),
                if (_selectedVariant != null) ...[
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => Navigator.pop(
                      context,
                      CartLine(
                        productId: _selectedProduct!.id,
                        productName: _selectedProduct!.name,
                        variantId: _selectedVariant!.id,
                        variantLabel: _selectedVariant!.label,
                        unitSellPrice: _selectedVariant!.sellPrice,
                        quantity: _quantity,
                      ),
                    ),
                    child: const Text('إضافة إلى الطلبية'),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
