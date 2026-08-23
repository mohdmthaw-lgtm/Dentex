import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/expense.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

/// /doctor/accounting/expenses/new — description, category, fixed/variable
/// cost type, total/paid-now (same partial-payment shape as a patient
/// debt, opposite direction — see Expense's doc comment), and an optional
/// "متكرر شهريًا" toggle that also creates an [ExpenseTemplate].
class ExpenseFormScreen extends ConsumerStatefulWidget {
  const ExpenseFormScreen({super.key, required this.profile});

  final UserProfile profile;

  @override
  ConsumerState<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends ConsumerState<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _totalController = TextEditingController();
  final _paidController = TextEditingController(text: '0');
  String _category = ExpenseCategory.other;
  String _costType = ExpenseCostType.variable;
  bool _isRecurring = false;
  bool _saving = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    _totalController.dispose();
    _paidController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final repo = ref.read(expenseRepositoryProvider);
    final total = num.tryParse(_totalController.text) ?? 0;
    final paid = num.tryParse(_paidController.text) ?? 0;
    try {
      if (_isRecurring) {
        await repo.createRecurringExpense(
          ownerId: widget.profile.clinicOwnerId,
          ownerType: widget.profile.clinicOwnerType,
          description: _descriptionController.text.trim(),
          category: _category,
          costType: _costType,
          amount: total,
          paidNow: paid,
          createdByUid: widget.profile.uid,
        );
      } else {
        await repo.createExpense(
          ownerId: widget.profile.clinicOwnerId,
          ownerType: widget.profile.clinicOwnerType,
          description: _descriptionController.text.trim(),
          category: _category,
          costType: _costType,
          totalAmount: total,
          paidNow: paid,
          createdByUid: widget.profile.uid,
        );
      }
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تعذر الحفظ: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مصروف جديد')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'الوصف'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _category,
                  decoration: const InputDecoration(labelText: 'الفئة'),
                  items: ExpenseCategory.all
                      .map((c) => DropdownMenuItem(value: c, child: Text(ExpenseCategory.labels[c]!)))
                      .toList(),
                  onChanged: (v) => setState(() => _category = v ?? ExpenseCategory.other),
                ),
                const SizedBox(height: 12),
                SegmentedButton<String>(
                  segments: [
                    ButtonSegment(
                        value: ExpenseCostType.fixed, label: Text(ExpenseCostType.labels[ExpenseCostType.fixed]!)),
                    ButtonSegment(
                        value: ExpenseCostType.variable,
                        label: Text(ExpenseCostType.labels[ExpenseCostType.variable]!)),
                  ],
                  selected: {_costType},
                  onSelectionChanged: (s) => setState(() => _costType = s.first),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _totalController,
                  decoration: const InputDecoration(labelText: 'المبلغ الكلي (₪)'),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      (num.tryParse(v ?? '') == null) ? 'أدخل رقمًا صحيحًا' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _paidController,
                  decoration: const InputDecoration(labelText: 'المدفوع الآن (₪)'),
                  keyboardType: TextInputType.number,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _isRecurring,
                  title: const Text('متكرر شهريًا'),
                  subtitle: const Text('مثل الإيجار — يُسجَّل تلقائيًا كل شهر بنفس المبلغ'),
                  onChanged: (v) => setState(() => _isRecurring = v ?? false),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saving ? null : _save,
                  child: _saving
                      ? const SizedBox(
                          width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('حفظ المصروف'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
