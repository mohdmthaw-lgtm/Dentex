import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/activity_log_entry.dart';

/// Read-only from the client in normal operation — every activity log
/// entry is actually written by a Cloud Functions trigger reacting to the
/// underlying event (order created, payment recorded, etc.), which keeps
/// the log trustworthy as an audit trail rather than something the client
/// could spoof.
class ActivityLogRepository {
  ActivityLogRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  Stream<List<ActivityLogEntry>> watchRecent({int limit = 20}) {
    return _db
        .collection(FirestorePaths.activityLog)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => ActivityLogEntry.fromDoc(d.id, d.data()))
            .toList());
  }
}
