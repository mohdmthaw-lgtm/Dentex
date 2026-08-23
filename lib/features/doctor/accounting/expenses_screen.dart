import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/clinic_summary.dart';
import '../../../core/utils/net_profit.dart';
import '../../../models/expense.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';

final _dateFormat = DateFormat.yMMMd('ar');
final _currency = NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);
// Darker variant of the accounting section's accent (AppTheme.warning),
// same role primaryDark plays for the app-wide teal.
final Color _warningDark = Color.lerp(AppTheme.warning, Colors.black, 0.25)!;

/// /doctor/accounting/expenses — the "لوحة صافي الربح" (income minus
/// *paid* expenses only, see computeNetProfit) plus this month's expense
/// list and a PDF export of the same breakdown. Deliberately independent
/// of any patient data beyond the income figure it borrows from
/// PatientRepository's visit/payment streams — see Expense's doc comment.
class ExpensesScreen extends ConsumerStatefulWidget {
  const ExpensesScreen({super.key, required this.profile});

  final UserProfile profile;

  @override
  ConsumerState<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends ConsumerState<ExpensesScreen> {
  bool _exporting = false;

  Future<void> _exportPdf(NetProfitSummary summary, List<Expense> expenses) async {
    setState(() => _exporting = true);
    try {
      final font = await PdfGoogleFonts.notoSansArabicRegular();
      final boldFont = await PdfGoogleFonts.notoSansArabicBold();
      final doc = pw.Document();

      final byCategory = <String, num>{};
      for (final e in expenses) {
        byCategory[e.category] = (byCategory[e.category] ?? 0) + e.totalAmount;
      }

      doc.addPage(
        pw.MultiPage(
          textDirection: pw.TextDirection.rtl,
          theme: pw.ThemeData.withFont(base: font, bold: boldFont),
          build: (context) => [
            pw.Header(text: 'التقرير الشهري — ${widget.profile.name}'),
            pw.SizedBox(height: 8),
            pw.Text('دخل الشهر: ${summary.incomeThisMonth.toStringAsFixed(0)} ₪'),
            pw.Text('مصاريف مدفوعة: ${summary.expensesPaidThisMonth.toStringAsFixed(0)} ₪'),
            pw.Text('مصاريف لسا عليّ: ${summary.expensesOwedThisMonth.toStringAsFixed(0)} ₪'),
            pw.Text('صافي الربح: ${summary.netProfit.toStringAsFixed(0)} ₪',
                style: pw.TextStyle(font: boldFont)),
            pw.SizedBox(height: 16),
            pw.Text('المصاريف حسب الفئة', style: pw.TextStyle(font: boldFont)),
            pw.SizedBox(height: 8),
            pw.Table.fromTextArray(
              headers: const ['الفئة', 'المبلغ'],
              data: byCategory.entries
                  .map((e) => [ExpenseCategory.labels[e.key] ?? e.key, '${e.value.toStringAsFixed(0)} ₪'])
                  .toList(),
            ),
          ],
        ),
      );

      final bytes = await doc.save();
      await Printing.sharePdf(bytes: bytes, filename: 'dentex_monthly_report.pdf');
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ownerId = widget.profile.clinicOwnerId;
    final ownerType = widget.profile.clinicOwnerType;
    final monthStart = DateTime(DateTime.now().year, DateTime.now().month, 1);
    final monthEnd = DateTime(DateTime.now().year, DateTime.now().month + 1, 1);
    final patientRepo = ref.watch(patientRepositoryProvider);
    final expenseRepo = ref.watch(expenseRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('المصاريف وصافي الربح')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/doctor/accounting/expenses/new', extra: widget.profile),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Visit>>(
        stream: patientRepo.watchVisitsForOwner(ownerId, ownerType, start: monthStart),
        builder: (context, visitsSnap) {
          return StreamBuilder<List<PatientPayment>>(
            stream: patientRepo.watchPaymentsForOwner(ownerId, ownerType, start: monthStart),
            builder: (context, paymentsSnap) {
              final clinicSummary =
                  computeClinicSummary(visitsSnap.data ?? [], paymentsSnap.data ?? []);
              return StreamBuilder<List<Expense>>(
                stream: expenseRepo.watchExpensesForOwner(ownerId, ownerType,
                    start: monthStart, end: monthEnd),
                builder: (context, expensesSnap) {
                  final expenses = expensesSnap.data ?? [];
                  final summary = computeNetProfit(expenses, clinicSummary.incomeThisMonth);

                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _NetProfitPanel(summary: summary),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: _exporting || expenses.isEmpty
                            ? null
                            : () => _exportPdf(summary, expenses),
                        icon: _exporting
                            ? const SizedBox(
                                width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                            : const Icon(Icons.picture_as_pdf_outlined),
                        label: const Text('تصدير التقرير الشهري (PDF)'),
                      ),
                      const SizedBox(height: 20),
                      Text('مصاريف هذا الشهر', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 12),
                      if (expenses.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: Text('لا توجد مصاريف مسجلة هذا الشهر')),
                        )
                      else
                        ...expenses.map((e) => _ExpenseTile(expense: e)),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _NetProfitPanel extends StatelessWidget {
  const _NetProfitPanel({required this.summary});

  final NetProfitSummary summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatTileRow(tiles: [
          StatTile(
            label: 'دخل الشهر',
            value: _currency.format(summary.incomeThisMonth),
            icon: Icons.trending_up,
            color: AppTheme.success,
          ),
          StatTile(
            label: 'مصاريف مدفوعة',
            value: _currency.format(summary.expensesPaidThisMonth),
            icon: Icons.trending_down,
            color: AppTheme.danger,
          ),
          StatTile(
            label: 'مصاريف لسا عليّ',
            value: _currency.format(summary.expensesOwedThisMonth),
            icon: Icons.hourglass_bottom_outlined,
            color: AppTheme.warning,
          ),
        ]),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [AppTheme.warning, _warningDark]),
          ),
          child: Column(
            children: [
              const Text('صافي الربح (بعد المدفوع فعليًا)',
                  style: TextStyle(color: Colors.white70, fontSize: 13)),
              const SizedBox(height: 8),
              Text(
                _currency.format(summary.netProfit),
                style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpenseTile extends StatelessWidget {
  const _ExpenseTile({required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final isPartial = expense.amountPaid > 0 && expense.amountRemaining > 0;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expense.description, style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 6,
                        children: [
                          _Pill(text: ExpenseCategory.labels[expense.category] ?? '', color: AppTheme.warning),
                          _Pill(
                            text: ExpenseCostType.labels[expense.costType] ?? '',
                            color: expense.costType == ExpenseCostType.fixed
                                ? _warningDark
                                : Colors.grey,
                          ),
                          if (expense.isRecurringMonthly)
                            const _Pill(text: 'متكرر شهريًا', color: AppTheme.success),
                          if (isPartial) const _Pill(text: 'جزئي الدفع', color: AppTheme.warning),
                        ],
                      ),
                    ],
                  ),
                ),
                Text('${expense.totalAmount.toStringAsFixed(0)} ₪',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            if (isPartial) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: expense.amountPaid / expense.totalAmount,
                  minHeight: 6,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation(AppTheme.warning),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'مدفوع ${expense.amountPaid.toStringAsFixed(0)} / متبقي ${expense.amountRemaining.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
            if (expense.expenseDate != null) ...[
              const SizedBox(height: 6),
              Text(_dateFormat.format(expense.expenseDate!),
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}
