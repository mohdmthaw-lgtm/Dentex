// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalStatsImpl _$$GlobalStatsImplFromJson(Map<String, dynamic> json) =>
    _$GlobalStatsImpl(
      totalProducts: (json['totalProducts'] as num?)?.toInt() ?? 0,
      totalCustomers: (json['totalCustomers'] as num?)?.toInt() ?? 0,
      totalOrdersAllTime: (json['totalOrdersAllTime'] as num?)?.toInt() ?? 0,
      totalOrdersThisMonth:
          (json['totalOrdersThisMonth'] as num?)?.toInt() ?? 0,
      totalProfitAllTime: json['totalProfitAllTime'] as num? ?? 0,
      totalProfitThisMonth: json['totalProfitThisMonth'] as num? ?? 0,
      totalOutstandingDebt: json['totalOutstandingDebt'] as num? ?? 0,
    );

Map<String, dynamic> _$$GlobalStatsImplToJson(_$GlobalStatsImpl instance) =>
    <String, dynamic>{
      'totalProducts': instance.totalProducts,
      'totalCustomers': instance.totalCustomers,
      'totalOrdersAllTime': instance.totalOrdersAllTime,
      'totalOrdersThisMonth': instance.totalOrdersThisMonth,
      'totalProfitAllTime': instance.totalProfitAllTime,
      'totalProfitThisMonth': instance.totalProfitThisMonth,
      'totalOutstandingDebt': instance.totalOutstandingDebt,
    };

_$MonthlyProfitImpl _$$MonthlyProfitImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyProfitImpl(
      monthKey: json['monthKey'] as String,
      totalProfit: json['totalProfit'] as num? ?? 0,
      totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
      totalRevenue: json['totalRevenue'] as num? ?? 0,
    );

Map<String, dynamic> _$$MonthlyProfitImplToJson(_$MonthlyProfitImpl instance) =>
    <String, dynamic>{
      'monthKey': instance.monthKey,
      'totalProfit': instance.totalProfit,
      'totalOrders': instance.totalOrders,
      'totalRevenue': instance.totalRevenue,
    };
