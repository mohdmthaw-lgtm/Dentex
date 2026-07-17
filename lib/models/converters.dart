import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// Converts between Firestore [Timestamp] and Dart [DateTime] for
/// json_serializable models. Firestore document snapshots hand back
/// [Timestamp] objects, but server-timestamp sentinel writes and freshly
/// constructed local models use [DateTime] / [FieldValue] — this converter
/// normalizes reads and tolerates both on write paths.
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is DateTime) return json;
    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return FieldValue.serverTimestamp();
    return Timestamp.fromDate(object);
  }
}

/// Like [TimestampConverter] but never emits a server-timestamp sentinel on
/// write — used for fields that must always carry an explicit value chosen
/// by the caller (e.g. a snapshot date), not "now, whenever this write
/// eventually commits".
class NullableTimestampConverter implements JsonConverter<DateTime?, Object?> {
  const NullableTimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is DateTime) return json;
    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;
    return Timestamp.fromDate(object);
  }
}
