import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/stats.dart';

/// Read-only from the client — stats/{document=**} denies client writes
/// entirely (see firestore.rules); every field here is maintained by
/// Cloud Functions triggers via FieldValue.increment so dashboard numbers
/// can never be corrupted by a buggy or compromised client write.
class StatsRepository {
  StatsRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  Stream<GlobalStats> watchGlobalStats() {
    return _db
        .collection(FirestorePaths.stats)
        .doc(FirestorePaths.statsGlobalDoc)
        .snapshots()
        .map((doc) =>
            doc.exists ? GlobalStats.fromJson(doc.data()!) : GlobalStats.empty);
  }

  Stream<List<MonthlyProfit>> watchMonthlyProfitForYear(int year) {
    final start = '$year-01';
    final end = '$year-12';
    return _db
        .collection(FirestorePaths.stats)
        .doc(FirestorePaths.statsGlobalDoc)
        .collection(FirestorePaths.monthlyProfit)
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: start)
        .where(FieldPath.documentId, isLessThanOrEqualTo: end)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => MonthlyProfit.fromDoc(d.id, d.data()))
            .toList()
          ..sort((a, b) => a.monthKey.compareTo(b.monthKey)));
  }
}
