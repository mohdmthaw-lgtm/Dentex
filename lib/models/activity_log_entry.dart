import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'activity_log_entry.freezed.dart';
part 'activity_log_entry.g.dart';

@freezed
class ActivityLogEntry with _$ActivityLogEntry {
  const factory ActivityLogEntry({
    required String id,
    required String type, // see ActivityType constants
    required String actorUid,
    required String actorName,
    required String actorRole,
    required String message,
    String? relatedOrderId,
    String? relatedProductId,
    @TimestampConverter() DateTime? createdAt,
  }) = _ActivityLogEntry;

  factory ActivityLogEntry.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogEntryFromJson(json);

  factory ActivityLogEntry.fromDoc(String id, Map<String, dynamic> data) =>
      ActivityLogEntry.fromJson({...data, 'id': id});
}
