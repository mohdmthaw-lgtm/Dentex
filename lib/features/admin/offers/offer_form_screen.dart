import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/offer.dart';
import '../../../models/product.dart';
import '../../../models/product_variant.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);
final _date = DateFormat.yMMMd('ar');

/// Add/edit offer (package) screen: a title/description/image, an optional
/// active window, a list of existing products+variants bundled at their
/// normal price, and an admin-set package price — the discount is always
/// derived from those two numbers, never entered directly, so it can never
/// drift out of sync with the actual line items.
class OfferFormScreen extends ConsumerStatefulWidget {
  const OfferFormScreen({super.key, this.offerId});

  final String? offerId;

  bool get isEditing => offerId != null;

  @override
  ConsumerState<OfferFormScreen> createState() => _OfferFormScreenState();
}

class _OfferFormScreenState extends ConsumerState<OfferFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _offerPriceController = TextEditingController();
  final List<OfferItem> _items = [];

  Offer? _existingOffer;
  File? _pickedImage;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isActive = true;
  bool _loading = false;
  bool _saving = false;
  bool _addingProduct = false;

  num get _originalTotal =>
      _items.fold<num>(0, (sum, i) => sum + i.lineTotal);

  num get _offerPrice => num.tryParse(_offerPriceController.text) ?? 0;

  num get _discountAmount => (_originalTotal - _offerPrice).clamp(0, _originalTotal);

  double get _discountPercent =>
      _originalTotal <= 0 ? 0 : (_discountAmount / _originalTotal * 100);

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) _loadExisting();
  }

  Future<void> _loadExisting() async {
    setState(() => _loading = true);
    final offer = await ref.read(offerRepositoryProvider).getOffer(widget.offerId!);
    if (offer != null) {
      _titleController.text = offer.title;
      _descriptionController.text = offer.description;
      _offerPriceController.text = offer.offerPrice.toString();
      _items.addAll(offer.items);
      _startDate = offer.startDate;
      _endDate = offer.endDate;
      _isActive = offer.isActive;
    }
    if (mounted) {
      setState(() {
        _existingOffer = offer;
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _offerPriceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _pickedImage = File(picked.path));
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (picked != null) setState(() => _startDate = picked);
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (picked != null) setState(() => _endDate = picked);
  }

  Future<void> _addProduct() async {
    setState(() => _addingProduct = true);
    List<Product> products;
    try {
      products = await ref
          .read(productRepositoryProvider)
          .watchProducts(activeOnly: true)
          .first;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('تعذر تحميل المنتجات: $e')));
      }
      return;
    } finally {
      if (mounted) setState(() => _addingProduct = false);
    }
    if (!mounted) return;
    if (products.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('لا توجد منتجات فعالة — أضف منتجًا من قسم المنتجات أولاً')),
      );
      return;
    }
    final result = await showModalBottomSheet<List<OfferItem>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _ProductPickerSheet(products: products),
    );
    if (result != null && result.isNotEmpty) {
      setState(() => _items.addAll(result));
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('أضف منتجًا واحدًا على الأقل للعرض')),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final repo = ref.read(offerRepositoryProvider);
      String offerId;
      if (widget.isEditing) {
        offerId = widget.offerId!;
        await repo.updateOffer(
          offerId: offerId,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          items: _items,
          offerPrice: _offerPrice,
          startDate: _startDate,
          endDate: _endDate,
        );
        if (_existingOffer!.isActive != _isActive) {
          await repo.setActive(offerId, _isActive);
        }
      } else {
        offerId = await repo.createOffer(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          items: _items,
          offerPrice: _offerPrice,
          startDate: _startDate,
          endDate: _endDate,
        );
      }

      if (_pickedImage != null) {
        final storage = ref.read(storageServiceProvider);
        final url =
            await storage.uploadOfferImage(offerId: offerId, file: _pickedImage!);
        await repo.updateOfferImage(
          offerId: offerId,
          imageUrl: url,
          imagePath: storage.offerImagePath(offerId),
        );
      }

      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('تعذر حفظ العرض: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'تعديل العرض' : 'إضافة عرض'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 140,
                    height: 140,
                    color: Colors.grey.shade200,
                    child: _pickedImage != null
                        ? Image.file(_pickedImage!, fit: BoxFit.cover)
                        : (_existingOffer?.imageUrl.isNotEmpty ?? false)
                            ? CachedNetworkImage(
                                imageUrl: _existingOffer!.imageUrl, fit: BoxFit.cover)
                            : const Icon(Icons.add_a_photo_outlined,
                                size: 32, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'اسم العرض / البكج'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'وصف مختصر'),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickStartDate,
                    icon: const Icon(Icons.event_outlined),
                    label: Text(_startDate == null
                        ? 'تاريخ البداية'
                        : _date.format(_startDate!)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickEndDate,
                    icon: const Icon(Icons.event_busy_outlined),
                    label: Text(
                        _endDate == null ? 'تاريخ الانتهاء' : _date.format(_endDate!)),
                  ),
                ),
              ],
            ),
            if (widget.isEditing) ...[
              const SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('العرض فعال'),
                value: _isActive,
                onChanged: (v) => setState(() => _isActive = v),
              ),
            ],
            const SizedBox(height: 24),
            Row(
              children: [
                Text('منتجات العرض',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                TextButton.icon(
                  onPressed: _addingProduct ? null : _addProduct,
                  icon: _addingProduct
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.add),
                  label: const Text('إضافة منتج'),
                ),
              ],
            ),
            if (_items.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('لم تتم إضافة منتجات بعد', style: TextStyle(color: Colors.grey)),
              ),
            ...List.generate(_items.length, (i) => _buildItemRow(i)),
            const SizedBox(height: 24),
            TextFormField(
              controller: _offerPriceController,
              decoration: const InputDecoration(labelText: 'سعر العرض'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (_) => setState(() {}),
              validator: (v) => num.tryParse(v ?? '') == null ? 'رقم غير صحيح' : null,
            ),
            const SizedBox(height: 12),
            _buildPricingSummary(),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: _saving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('حفظ'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(int index) {
    final item = _items[index];
    return Card(
      margin: const EdgeInsets.only(top: 8),
      child: ListTile(
        title: Text('${item.productName} - ${item.variantLabel}'),
        subtitle: Text('${item.quantity} × ${_currency.format(item.unitPrice)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_currency.format(item.lineTotal),
                style: const TextStyle(fontWeight: FontWeight.w600)),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
              onPressed: () => setState(() => _items.removeAt(index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingSummary() {
    return Card(
      color: AppTheme.surfaceLight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryLine('السعر الإجمالي العادي', _currency.format(_originalTotal)),
            _summaryLine('سعر العرض', _currency.format(_offerPrice)),
            const Divider(),
            _summaryLine(
              'قيمة التوفير',
              '${_currency.format(_discountAmount)} (${_discountPercent.toStringAsFixed(0)}%)',
              color: AppTheme.success,
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryLine(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value,
              style: TextStyle(fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}

class _ProductPickerSheet extends ConsumerStatefulWidget {
  const _ProductPickerSheet({required this.products});
  final List<Product> products;

  @override
  ConsumerState<_ProductPickerSheet> createState() => _ProductPickerSheetState();
}

class _ProductPickerSheetState extends ConsumerState<_ProductPickerSheet> {
  Product? _product;
  List<ProductVariant> _variants = [];
  // variantId -> chosen quantity for that spec; a spec with no entry (or 0)
  // is not included, so several specs of one product can each get their own
  // quantity instead of picking a single variant per "add product" pass.
  final Map<String, int> _quantities = {};
  bool _loadingVariants = false;

  int get _selectedCount => _quantities.values.where((q) => q > 0).length;

  Future<void> _selectProduct(Product p) async {
    setState(() {
      _product = p;
      _quantities.clear();
      _loadingVariants = true;
    });
    final variants =
        await ref.read(productRepositoryProvider).watchVariants(p.id).first;
    if (mounted) {
      setState(() {
        _variants = variants;
        _loadingVariants = false;
      });
    }
  }

  void _submit() {
    final product = _product!;
    final items = _variants
        .where((v) => (_quantities[v.id] ?? 0) > 0)
        .map((v) => OfferItem(
              productId: product.id,
              productName: product.name,
              variantId: v.id,
              variantLabel: v.label,
              unitPrice: v.sellPrice,
              quantity: _quantities[v.id]!,
            ))
        .toList();
    Navigator.pop(context, items);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      expand: false,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_product == null ? 'اختر منتجًا' : _product!.name,
                style: Theme.of(context).textTheme.titleMedium),
            if (_product != null)
              Text('حدّد كمية كل مواصفة تريد إضافتها',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Expanded(
              child: _product == null
                  ? ListView.builder(
                      controller: scrollController,
                      itemCount: widget.products.length,
                      itemBuilder: (context, i) {
                        final p = widget.products[i];
                        return ListTile(
                          title: Text(p.name),
                          subtitle: Text(p.description,
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                          onTap: () => _selectProduct(p),
                        );
                      },
                    )
                  : _loadingVariants
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          controller: scrollController,
                          children: _variants.map((v) {
                            final qty = _quantities[v.id] ?? 0;
                            final outOfStock = v.quantity <= 0;
                            return ListTile(
                              title: Text(v.label),
                              subtitle: Text(outOfStock
                                  ? 'نفذ من المخزون'
                                  : _currency.format(v.sellPrice)),
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
                          }).toList(),
                        ),
            ),
            if (_product != null)
              FilledButton(
                onPressed: _selectedCount > 0 ? _submit : null,
                child: Text(_selectedCount > 0
                    ? 'إضافة $_selectedCount مواصفة إلى العرض'
                    : 'إضافة إلى العرض'),
              ),
          ],
        ),
      ),
    );
  }
}
