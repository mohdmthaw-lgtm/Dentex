import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/shipment.dart';
import '../../../services/firebase/service_providers.dart';
import 'supplier_picker_sheet.dart';

final _date = DateFormat.yMMMd('ar');

class _ItemRow {
  _ItemRow({
    String productName = '',
    String manufacturer = '',
    String quantity = '',
    String cartonCount = '',
    String purchasePrice = '',
  })  : productNameController = TextEditingController(text: productName),
        manufacturerController = TextEditingController(text: manufacturer),
        quantityController = TextEditingController(text: quantity),
        cartonCountController = TextEditingController(text: cartonCount),
        purchasePriceController = TextEditingController(text: purchasePrice);

  final TextEditingController productNameController;
  final TextEditingController manufacturerController;
  final TextEditingController quantityController;
  final TextEditingController cartonCountController;
  final TextEditingController purchasePriceController;

  num get lineTotal =>
      (num.tryParse(purchasePriceController.text) ?? 0) *
      (int.tryParse(quantityController.text) ?? 0);

  ShipmentItem toItem() => ShipmentItem(
        productName: productNameController.text.trim(),
        manufacturer: manufacturerController.text.trim(),
        quantity: int.tryParse(quantityController.text) ?? 0,
        cartonCount: int.tryParse(cartonCountController.text) ?? 0,
        purchasePrice: num.tryParse(purchasePriceController.text) ?? 0,
      );

  void dispose() {
    productNameController.dispose();
    manufacturerController.dispose();
    quantityController.dispose();
    cartonCountController.dispose();
    purchasePriceController.dispose();
  }
}

class ShipmentFormScreen extends ConsumerStatefulWidget {
  const ShipmentFormScreen({super.key, this.shipmentId});

  final String? shipmentId;

  bool get isEditing => shipmentId != null;

  @override
  ConsumerState<ShipmentFormScreen> createState() => _ShipmentFormScreenState();
}

class _ShipmentFormScreenState extends ConsumerState<ShipmentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _supplierController = TextEditingController();
  final _poController = TextEditingController();
  final _shippingCompanyController = TextEditingController();
  final _shippingAgentController = TextEditingController();
  final _originController = TextEditingController();
  final _containerController = TextEditingController();
  final _notesController = TextEditingController();

  final _shippingCostController = TextEditingController(text: '0');
  final _customsController = TextEditingController(text: '0');
  final _clearanceController = TextEditingController(text: '0');
  final _storageController = TextEditingController(text: '0');
  final _transportController = TextEditingController(text: '0');
  final _otherCostController = TextEditingController(text: '0');

  final List<_ItemRow> _items = [];

  String _shipmentType = ShipmentType.sea;
  String _currency = 'USD';
  DateTime? _shipDate;
  DateTime? _expectedArrivalDate;
  bool _loading = false;
  bool _saving = false;

  num get _productsTotal => _items.fold<num>(0, (sum, r) => sum + r.lineTotal);
  num get _costsTotal =>
      (num.tryParse(_shippingCostController.text) ?? 0) +
      (num.tryParse(_customsController.text) ?? 0) +
      (num.tryParse(_clearanceController.text) ?? 0) +
      (num.tryParse(_storageController.text) ?? 0) +
      (num.tryParse(_transportController.text) ?? 0) +
      (num.tryParse(_otherCostController.text) ?? 0);
  num get _grandTotal => _productsTotal + _costsTotal;
  String get _symbol => _currency == 'USD' ? '\$' : '₪';

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      _loadExisting();
    } else {
      _items.add(_ItemRow());
    }
  }

  Future<void> _loadExisting() async {
    setState(() => _loading = true);
    final shipment =
        await ref.read(shipmentRepositoryProvider).getShipment(widget.shipmentId!);
    if (shipment != null) {
      _supplierController.text = shipment.supplierName;
      _poController.text = shipment.purchaseOrderNumber;
      _shippingCompanyController.text = shipment.shippingCompany;
      _shippingAgentController.text = shipment.shippingAgent;
      _originController.text = shipment.originCountry;
      _containerController.text = shipment.containerNumber;
      _notesController.text = shipment.notes;
      _shipmentType = shipment.shipmentType;
      _currency = shipment.currency;
      _shipDate = shipment.shipDate;
      _expectedArrivalDate = shipment.expectedArrivalDate;
      _shippingCostController.text = shipment.costs.shipping.toString();
      _customsController.text = shipment.costs.customs.toString();
      _clearanceController.text = shipment.costs.clearance.toString();
      _storageController.text = shipment.costs.storage.toString();
      _transportController.text = shipment.costs.transport.toString();
      _otherCostController.text = shipment.costs.other.toString();
      for (final item in shipment.items) {
        _items.add(_ItemRow(
          productName: item.productName,
          manufacturer: item.manufacturer,
          quantity: item.quantity.toString(),
          cartonCount: item.cartonCount.toString(),
          purchasePrice: item.purchasePrice.toString(),
        ));
      }
      if (_items.isEmpty) _items.add(_ItemRow());
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _supplierController.dispose();
    _poController.dispose();
    _shippingCompanyController.dispose();
    _shippingAgentController.dispose();
    _originController.dispose();
    _containerController.dispose();
    _notesController.dispose();
    _shippingCostController.dispose();
    _customsController.dispose();
    _clearanceController.dispose();
    _storageController.dispose();
    _transportController.dispose();
    _otherCostController.dispose();
    for (final row in _items) {
      row.dispose();
    }
    super.dispose();
  }

  void _addItemRow() {
    // Auto-fill the new row's manufacturer from the previous one — the spec
    // asks for this since a shipment's items are very often all from the
    // same factory, while still letting each row be edited independently.
    final lastManufacturer =
        _items.isNotEmpty ? _items.last.manufacturerController.text : '';
    setState(() => _items.add(_ItemRow(manufacturer: lastManufacturer)));
  }

  void _removeItemRow(int index) {
    if (_items.length <= 1) return;
    setState(() {
      _items[index].dispose();
      _items.removeAt(index);
    });
  }

  Future<void> _pickDate({required bool isShipDate}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: (isShipDate ? _shipDate : _expectedArrivalDate) ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (picked != null) {
      setState(() {
        if (isShipDate) {
          _shipDate = picked;
        } else {
          _expectedArrivalDate = picked;
        }
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final repo = ref.read(shipmentRepositoryProvider);
      final items = _items
          .where((r) => r.productNameController.text.trim().isNotEmpty)
          .map((r) => r.toItem())
          .toList();
      final costs = ShipmentCosts(
        shipping: num.tryParse(_shippingCostController.text) ?? 0,
        customs: num.tryParse(_customsController.text) ?? 0,
        clearance: num.tryParse(_clearanceController.text) ?? 0,
        storage: num.tryParse(_storageController.text) ?? 0,
        transport: num.tryParse(_transportController.text) ?? 0,
        other: num.tryParse(_otherCostController.text) ?? 0,
      );

      if (widget.isEditing) {
        await repo.updateShipment(
          shipmentId: widget.shipmentId!,
          supplierName: _supplierController.text.trim(),
          purchaseOrderNumber: _poController.text.trim(),
          shippingCompany: _shippingCompanyController.text.trim(),
          shippingAgent: _shippingAgentController.text.trim(),
          shipmentType: _shipmentType,
          originCountry: _originController.text.trim(),
          containerNumber: _containerController.text.trim(),
          shipDate: _shipDate,
          expectedArrivalDate: _expectedArrivalDate,
          notes: _notesController.text.trim(),
          items: items,
          costs: costs,
          currency: _currency,
        );
      } else {
        await repo.createShipment(
          supplierName: _supplierController.text.trim(),
          purchaseOrderNumber: _poController.text.trim(),
          shippingCompany: _shippingCompanyController.text.trim(),
          shippingAgent: _shippingAgentController.text.trim(),
          shipmentType: _shipmentType,
          originCountry: _originController.text.trim(),
          containerNumber: _containerController.text.trim(),
          shipDate: _shipDate,
          expectedArrivalDate: _expectedArrivalDate,
          notes: _notesController.text.trim(),
          items: items,
          costs: costs,
          currency: _currency,
        );
      }
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('تعذر حفظ الشحنة: $e')));
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
      appBar: AppBar(title: Text(widget.isEditing ? 'تعديل الشحنة' : 'شحنة جديدة')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            Text('بيانات الشحنة', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _SupplierField(
              controller: _supplierController,
              label: 'المورد / شركة التصدير',
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _poController,
              decoration: const InputDecoration(labelText: 'رقم طلب الشراء'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _shippingCompanyController,
                    decoration: const InputDecoration(labelText: 'شركة الشحن'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _shippingAgentController,
                    decoration: const InputDecoration(labelText: 'وكيل الشحن'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                    value: ShipmentType.sea,
                    label: Text('بحري'),
                    icon: Icon(Icons.directions_boat_filled)),
                ButtonSegment(
                    value: ShipmentType.air,
                    label: Text('جوي'),
                    icon: Icon(Icons.flight_takeoff)),
              ],
              selected: {_shipmentType},
              onSelectionChanged: (s) => setState(() => _shipmentType = s.first),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _originController,
                    decoration: const InputDecoration(labelText: 'بلد المنشأ'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _containerController,
                    decoration: const InputDecoration(labelText: 'رقم الحاوية'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pickDate(isShipDate: true),
                    icon: const Icon(Icons.event_outlined),
                    label: Text(
                        _shipDate == null ? 'تاريخ الشحن' : _date.format(_shipDate!)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pickDate(isShipDate: false),
                    icon: const Icon(Icons.event_available_outlined),
                    label: Text(_expectedArrivalDate == null
                        ? 'الوصول المتوقع'
                        : _date.format(_expectedArrivalDate!)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text('المنتجات', style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                TextButton.icon(
                  onPressed: _addItemRow,
                  icon: const Icon(Icons.add),
                  label: const Text('إضافة منتج'),
                ),
              ],
            ),
            ...List.generate(_items.length, (i) => _buildItemCard(i)),
            const SizedBox(height: 8),
            _buildItemsSummary(),
            const SizedBox(height: 24),
            Text('تكاليف الشحنة', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'USD', label: Text('USD')),
                ButtonSegment(value: 'ILS', label: Text('ILS')),
              ],
              selected: {_currency},
              onSelectionChanged: (s) => setState(() => _currency = s.first),
            ),
            const SizedBox(height: 12),
            _costField(_shippingCostController, 'تكلفة الشحن'),
            _costField(_customsController, 'الجمارك'),
            _costField(_clearanceController, 'التخليص'),
            _costField(_storageController, 'التخزين'),
            _costField(_transportController, 'النقل'),
            _costField(_otherCostController, 'مصاريف أخرى'),
            const SizedBox(height: 12),
            _buildCostsSummary(),
            const SizedBox(height: 24),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'ملاحظات'),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: _saving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('حفظ الشحنة'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _costField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label, prefixText: '$_symbol '),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: (_) => setState(() {}),
      ),
    );
  }

  Widget _buildItemCard(int index) {
    final row = _items[index];
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: row.productNameController,
                    decoration: const InputDecoration(labelText: 'اسم المنتج'),
                  ),
                ),
                if (_items.length > 1)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                    onPressed: () => _removeItemRow(index),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            _SupplierField(
              controller: row.manufacturerController,
              label: 'المصنع / المورد',
              dense: true,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: row.quantityController,
                    decoration: const InputDecoration(labelText: 'الكمية'),
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: row.cartonCountController,
                    decoration: const InputDecoration(labelText: 'عدد الكراتين'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: row.purchasePriceController,
                    decoration: InputDecoration(labelText: 'سعر الشراء', prefixText: '$_symbol '),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('الإجمالي: $_symbol ${row.lineTotal.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.primary)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsSummary() {
    final totalQty = _items.fold<int>(0, (s, r) => s + (int.tryParse(r.quantityController.text) ?? 0));
    final totalCartons =
        _items.fold<int>(0, (s, r) => s + (int.tryParse(r.cartonCountController.text) ?? 0));
    return Card(
      color: AppTheme.surfaceLight,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _summaryLine('عدد المنتجات', '${_items.where((r) => r.productNameController.text.trim().isNotEmpty).length}'),
            _summaryLine('إجمالي الكميات', '$totalQty'),
            _summaryLine('إجمالي الكراتين', '$totalCartons'),
            _summaryLine('إجمالي قيمة المنتجات', '$_symbol ${_productsTotal.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildCostsSummary() {
    return Card(
      color: AppTheme.surfaceLight,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _summaryLine('قيمة المنتجات', '$_symbol ${_productsTotal.toStringAsFixed(2)}'),
            _summaryLine('مصاريف إضافية', '$_symbol ${_costsTotal.toStringAsFixed(2)}'),
            const Divider(),
            _summaryLine('إجمالي تكلفة الشحنة', '$_symbol ${_grandTotal.toStringAsFixed(2)}',
                bold: true),
          ],
        ),
      ),
    );
  }

  Widget _summaryLine(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.w600,
                  color: bold ? AppTheme.primary : null)),
        ],
      ),
    );
  }
}

class _SupplierField extends StatelessWidget {
  const _SupplierField({required this.controller, required this.label, this.dense = false});
  final TextEditingController controller;
  final String label;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        isDense: dense,
        suffixIcon: IconButton(
          icon: const Icon(Icons.list_alt, size: 20),
          onPressed: () async {
            final picked = await pickSupplier(context);
            if (picked != null) controller.text = picked;
          },
        ),
      ),
    );
  }
}
