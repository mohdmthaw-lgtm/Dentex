import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/expense.dart';

String _monthKeyFor(DateTime date) => DateFormat('yyyy-MM').format(date);

/// Mirrors [OrderRepository]'s create/payment split exactly: createExpense
/// always writes amountPaid: 0 / amountRemaining: totalAmount, then an
/// immediate recordPayment (if any) goes through the same
/// onExpensePaymentCreated trigger a later installment would — never a
/// client-computed split.
class ExpenseRepository {
  ExpenseRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _expenses =>
      _db.collection(FirestorePaths.expenses);

  CollectionReference<Map<String, dynamic>> get _templates =>
      _db.collection(FirestorePaths.expenseTemplates);

  /// [ownerType] is filtered explicitly, not just present on the returned
  /// docs — see PatientRepository.watchPatientsForOwner's doc comment for
  /// why a `list` query needs it in the query itself, not only in the rule.
  Stream<List<Expense>> watchExpensesForOwner(
    String ownerId,
    String ownerType, {
    required DateTime start,
    required DateTime end,
  }) {
    return _expenses
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType)
        .where('expenseDate', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('expenseDate', isLessThan: Timestamp.fromDate(end))
        .orderBy('expenseDate', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => Expense.fromDoc(d.id, d.data())).toList());
  }

  Future<String> createExpense({
    required String ownerId,
    required String ownerType,
    required String description,
    required String category,
    required String costType,
    required num totalAmount,
    required num paidNow,
    required String createdByUid,
    DateTime? expenseDate,
    bool isRecurringMonthly = false,
    String? templateId,
  }) async {
    final date = expenseDate ?? DateTime.now();
    final ref = _expenses.doc();
    await ref.set({
      'ownerId': ownerId,
      'ownerType': ownerType,
      'description': description,
      'category': category,
      'costType': costType,
      'isRecurringMonthly': isRecurringMonthly,
      'templateId': templateId,
      'monthKey': _monthKeyFor(date),
      'totalAmount': totalAmount,
      'amountPaid': 0,
      'amountRemaining': totalAmount,
      'paymentStatus': 'unpaid',
      'expenseDate': Timestamp.fromDate(date),
      'createdByUid': createdByUid,
      'createdAt': FieldValue.serverTimestamp(),
    });

    if (paidNow > 0) {
      await recordPayment(expenseId: ref.id, amount: paidNow, recordedByUid: createdByUid);
    }
    return ref.id;
  }

  /// Bundles [createExpense] with an [ExpenseTemplate] doc — used when a
  /// doctor checks "متكرر شهريًا"; generateRecurringExpenses (Cloud
  /// Scheduler) creates every following month's instance from the
  /// template with no further manual entry.
  Future<void> createRecurringExpense({
    required String ownerId,
    required String ownerType,
    required String description,
    required String category,
    required String costType,
    required num amount,
    required num paidNow,
    required String createdByUid,
  }) async {
    final templateRef = _templates.doc();
    await templateRef.set({
      'ownerId': ownerId,
      'ownerType': ownerType,
      'description': description,
      'category': category,
      'costType': costType,
      'amount': amount,
      'active': true,
      'createdByUid': createdByUid,
      'createdAt': FieldValue.serverTimestamp(),
    });

    await createExpense(
      ownerId: ownerId,
      ownerType: ownerType,
      description: description,
      category: category,
      costType: costType,
      totalAmount: amount,
      paidNow: paidNow,
      createdByUid: createdByUid,
      isRecurringMonthly: true,
      templateId: templateRef.id,
    );
  }

  Future<void> recordPayment({
    required String expenseId,
    required num amount,
    required String recordedByUid,
    String method = 'cash',
    String note = '',
  }) {
    final paymentRef =
        _expenses.doc(expenseId).collection(FirestorePaths.payments).doc();
    return paymentRef.set({
      'amount': amount,
      'method': method,
      'recordedByUid': recordedByUid,
      'recordedAt': FieldValue.serverTimestamp(),
      'note': note,
    });
  }

  Stream<List<ExpensePayment>> watchPayments(String expenseId) {
    return _expenses
        .doc(expenseId)
        .collection(FirestorePaths.payments)
        .orderBy('recordedAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => ExpensePayment.fromDoc(d.id, d.data())).toList());
  }
}
