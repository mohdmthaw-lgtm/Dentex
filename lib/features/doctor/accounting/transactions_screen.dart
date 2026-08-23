import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';

final _dateFormat = DateFormat.yMMMd('ar').add_jm();

class _Transaction {
  const _Transaction({
    required this.date,
    required this.label,
    required this.amount,
    required this.isPayment,
  });

  final DateTime date;
  final String label;
  final num amount;
  final bool isPayment;
}

/// /doctor/accounting/transactions — merged visit+payment log for the
/// current month, filterable by treatment type, with a PDF export (see
/// _exportPdf) suitable for a doctor's own bookkeeping or showing a
/// bank/partner their clinic's activity.
class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key, required this.profile});

  final UserProfile profile;

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  String? _treatmentFilter;
  bool _exporting = false;

  List<_Transaction> _merge(List<Visit> visits, List<PatientPayment> payments) {
    final filteredVisits = _treatmentFilter == null
        ? visits
        : visits.where((v) => v.treatmentType == _treatmentFilter);
    final items = <_Transaction>[
      ...filteredVisits.where((v) => v.visitDate != null).map((v) => _Transaction(
            date: v.visitDate!,
            label: '${TreatmentType.labels[v.treatmentType] ?? v.treatmentType} — ${v.cost.toStringAsFixed(0)} ₪',
            amount: v.paidAtVisit,
            isPayment: false,
          )),
      if (_treatmentFilter == null)
        ...payments.where((p) => p.recordedAt != null).map((p) => _Transaction(
              date: p.recordedAt!,
              label: 'دفعة',
              amount: p.amount,
              isPayment: true,
            )),
    ];
    items.sort((a, b) => b.date.compareTo(a.date));
    return items;
  }

  Future<void> _exportPdf(List<_Transaction> transactions) async {
    setState(() => _exporting = true);
    try {
      final font = await PdfGoogleFonts.notoSansArabicRegular();
      final boldFont = await PdfGoogleFonts.notoSansArabicBold();
      final doc = pw.Document();
      final total = transactions.fold<num>(0, (sum, t) => sum + t.amount);

      doc.addPage(
        pw.MultiPage(
          textDirection: pw.TextDirection.rtl,
          theme: pw.ThemeData.withFont(base: font, bold: boldFont),
          build: (context) => [
            pw.Header(text: 'سجل المعاملات — ${widget.profile.name}'),
            pw.SizedBox(height: 8),
            pw.Text('إجمالي الفترة: ${total.toStringAsFixed(0)} ₪'),
            pw.SizedBox(height: 16),
            pw.Table.fromTextArray(
              headers: const ['التاريخ', 'البيان', 'المبلغ'],
              data: transactions
                  .map((t) => [
                        _dateFormat.format(t.date),
                        t.label,
                        '${t.amount.toStringAsFixed(0)} ₪',
                      ])
                  .toList(),
            ),
          ],
        ),
      );

      final bytes = await doc.save();
      await Printing.sharePdf(bytes: bytes, filename: 'dentex_transactions.pdf');
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ownerId = widget.profile.clinicOwnerId;
    final ownerType = widget.profile.clinicOwnerType;
    final monthStart = DateTime(DateTime.now().year, DateTime.now().month, 1);
    final repo = ref.watch(patientRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('سجل المعاملات')),
      body: StreamBuilder<List<Visit>>(
        stream: repo.watchVisitsForOwner(ownerId, ownerType, start: monthStart),
        builder: (context, visitsSnap) {
          return StreamBuilder<List<PatientPayment>>(
            stream: repo.watchPaymentsForOwner(ownerId, ownerType, start: monthStart),
            builder: (context, paymentsSnap) {
              final transactions = _merge(visitsSnap.data ?? [], paymentsSnap.data ?? []);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: SizedBox(
                      height: 36,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: ChoiceChip(
                              label: const Text('الكل'),
                              selected: _treatmentFilter == null,
                              onSelected: (_) => setState(() => _treatmentFilter = null),
                            ),
                          ),
                          ...TreatmentType.all.map((t) => Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: ChoiceChip(
                                  label: Text(TreatmentType.labels[t]!),
                                  selected: _treatmentFilter == t,
                                  onSelected: (_) => setState(() => _treatmentFilter = t),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: FilledButton.icon(
                      onPressed: _exporting || transactions.isEmpty
                          ? null
                          : () => _exportPdf(transactions),
                      icon: _exporting
                          ? const SizedBox(
                              width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.picture_as_pdf_outlined),
                      label: const Text('تصدير PDF'),
                    ),
                  ),
                  Expanded(
                    child: transactions.isEmpty
                        ? const Center(child: Text('لا توجد معاملات هذا الشهر'))
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: transactions.length,
                            itemBuilder: (context, i) {
                              final t = transactions[i];
                              return ListTile(
                                leading: Icon(
                                  t.isPayment ? Icons.payments_outlined : Icons.medical_services_outlined,
                                  color: AppTheme.warning,
                                ),
                                title: Text(t.label),
                                subtitle: Text(_dateFormat.format(t.date)),
                                trailing: Text('${t.amount.toStringAsFixed(0)} ₪'),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
