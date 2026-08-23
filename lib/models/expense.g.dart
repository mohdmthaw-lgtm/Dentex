// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  ownerType: json['ownerType'] as String? ?? PatientOwnerType.doctor,
  description: json['description'] as String,
  category: json['category'] as String? ?? ExpenseCategory.other,
  costType: json['costType'] as String? ?? ExpenseCostType.variable,
  isRecurringMonthly: json['isRecurringMonthly'] as bool? ?? false,
  templateId: json['templateId'] as String?,
  monthKey: json['monthKey'] as String,
  totalAmount: json['totalAmount'] as num,
  amountPaid: json['amountPaid'] as num? ?? 0,
  amountRemaining: json['amountRemaining'] as num? ?? 0,
  paymentStatus: json['paymentStatus'] as String? ?? 'unpaid',
  expenseDate: const TimestampConverter().fromJson(json['expenseDate']),
  createdByUid: json['createdByUid'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'ownerType': instance.ownerType,
  'description': instance.description,
  'category': instance.category,
  'costType': instance.costType,
  'isRecurringMonthly': instance.isRecurringMonthly,
  'templateId': instance.templateId,
  'monthKey': instance.monthKey,
  'totalAmount': instance.totalAmount,
  'amountPaid': instance.amountPaid,
  'amountRemaining': instance.amountRemaining,
  'paymentStatus': instance.paymentStatus,
  'expenseDate': const TimestampConverter().toJson(instance.expenseDate),
  'createdByUid': instance.createdByUid,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};

_ExpenseTemplate _$ExpenseTemplateFromJson(Map<String, dynamic> json) =>
    _ExpenseTemplate(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      ownerType: json['ownerType'] as String? ?? PatientOwnerType.doctor,
      description: json['description'] as String,
      category: json['category'] as String? ?? ExpenseCategory.other,
      costType: json['costType'] as String? ?? ExpenseCostType.fixed,
      amount: json['amount'] as num,
      active: json['active'] as bool? ?? true,
      createdByUid: json['createdByUid'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$ExpenseTemplateToJson(_ExpenseTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'ownerType': instance.ownerType,
      'description': instance.description,
      'category': instance.category,
      'costType': instance.costType,
      'amount': instance.amount,
      'active': instance.active,
      'createdByUid': instance.createdByUid,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

_ExpensePayment _$ExpensePaymentFromJson(Map<String, dynamic> json) =>
    _ExpensePayment(
      id: json['id'] as String,
      amount: json['amount'] as num,
      method: json['method'] as String? ?? 'cash',
      recordedByUid: json['recordedByUid'] as String,
      recordedAt: const TimestampConverter().fromJson(json['recordedAt']),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$ExpensePaymentToJson(_ExpensePayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'method': instance.method,
      'recordedByUid': instance.recordedByUid,
      'recordedAt': const TimestampConverter().toJson(instance.recordedAt),
      'note': instance.note,
    };
