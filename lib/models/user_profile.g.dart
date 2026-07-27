// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      uid: json['uid'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String,
      authEmail: json['authEmail'] as String,
      name: json['name'] as String,
      clinicName: json['clinicName'] as String? ?? '',
      location: json['location'] as String? ?? '',
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      stats: json['stats'] == null
          ? DoctorStats.empty
          : DoctorStats.fromJson(json['stats'] as Map<String, dynamic>),
      lastSeenTier: json['lastSeenTier'] as String? ?? 'silver',
      lastSeenTierYear: (json['lastSeenTierYear'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'role': instance.role,
      'phone': instance.phone,
      'authEmail': instance.authEmail,
      'name': instance.name,
      'clinicName': instance.clinicName,
      'location': instance.location,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'fcmTokens': instance.fcmTokens,
      'stats': instance.stats,
      'lastSeenTier': instance.lastSeenTier,
      'lastSeenTierYear': instance.lastSeenTierYear,
    };
