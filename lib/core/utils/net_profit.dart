import '../../models/expense.dart';

/// A clinic's net-profit picture for a given month — recomputed fresh from
/// that month's [Expense] docs plus the income figure the caller already
/// has (see computeClinicSummary), never persisted. [netProfit] is
/// deliberately based on [expensesPaidThisMonth] only, per spec — money
/// still owed to a supplier hasn't left the clinic's pocket yet, so it
/// shouldn't reduce the number a doctor reads as "what I actually made".
class NetProfitSummary {
  const NetProfitSummary({
    required this.incomeThisMonth,
    required this.expensesPaidThisMonth,
    required this.expensesOwedThisMonth,
  });

  final num incomeThisMonth;
  final num expensesPaidThisMonth;
  final num expensesOwedThisMonth;

  num get netProfit => incomeThisMonth - expensesPaidThisMonth;
}

NetProfitSummary computeNetProfit(List<Expense> expensesThisMonth, num incomeThisMonth) {
  final paid = expensesThisMonth.fold<num>(0, (sum, e) => sum + e.amountPaid);
  final owed = expensesThisMonth.fold<num>(0, (sum, e) => sum + e.amountRemaining);
  return NetProfitSummary(
    incomeThisMonth: incomeThisMonth,
    expensesPaidThisMonth: paid,
    expensesOwedThisMonth: owed,
  );
}
