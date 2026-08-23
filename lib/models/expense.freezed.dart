// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Expense {

 String get id; String get ownerId; String get ownerType; String get description; String get category; String get costType; bool get isRecurringMonthly; String? get templateId; String get monthKey; num get totalAmount; num get amountPaid; num get amountRemaining; String get paymentStatus;@TimestampConverter() DateTime? get expenseDate; String get createdByUid;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCopyWith<Expense> get copyWith => _$ExpenseCopyWithImpl<Expense>(this as Expense, _$identity);

  /// Serializes this Expense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.costType, costType) || other.costType == costType)&&(identical(other.isRecurringMonthly, isRecurringMonthly) || other.isRecurringMonthly == isRecurringMonthly)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.monthKey, monthKey) || other.monthKey == monthKey)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,description,category,costType,isRecurringMonthly,templateId,monthKey,totalAmount,amountPaid,amountRemaining,paymentStatus,expenseDate,createdByUid,createdAt);

@override
String toString() {
  return 'Expense(id: $id, ownerId: $ownerId, ownerType: $ownerType, description: $description, category: $category, costType: $costType, isRecurringMonthly: $isRecurringMonthly, templateId: $templateId, monthKey: $monthKey, totalAmount: $totalAmount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, paymentStatus: $paymentStatus, expenseDate: $expenseDate, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res>  {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String ownerType, String description, String category, String costType, bool isRecurringMonthly, String? templateId, String monthKey, num totalAmount, num amountPaid, num amountRemaining, String paymentStatus,@TimestampConverter() DateTime? expenseDate, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? description = null,Object? category = null,Object? costType = null,Object? isRecurringMonthly = null,Object? templateId = freezed,Object? monthKey = null,Object? totalAmount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? paymentStatus = null,Object? expenseDate = freezed,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(Expense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,costType: null == costType ? _self.costType : costType // ignore: cast_nullable_to_non_nullable
as String,isRecurringMonthly: null == isRecurringMonthly ? _self.isRecurringMonthly : isRecurringMonthly // ignore: cast_nullable_to_non_nullable
as bool,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,monthKey: null == monthKey ? _self.monthKey : monthKey // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as num,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as num,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Expense].
extension ExpensePatterns on Expense {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expense value)  $default,){
final _that = this;
switch (_that) {
case _Expense():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expense value)?  $default,){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String description,  String category,  String costType,  bool isRecurringMonthly,  String? templateId,  String monthKey,  num totalAmount,  num amountPaid,  num amountRemaining,  String paymentStatus, @TimestampConverter()  DateTime? expenseDate,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.description,_that.category,_that.costType,_that.isRecurringMonthly,_that.templateId,_that.monthKey,_that.totalAmount,_that.amountPaid,_that.amountRemaining,_that.paymentStatus,_that.expenseDate,_that.createdByUid,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String description,  String category,  String costType,  bool isRecurringMonthly,  String? templateId,  String monthKey,  num totalAmount,  num amountPaid,  num amountRemaining,  String paymentStatus, @TimestampConverter()  DateTime? expenseDate,  String createdByUid, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Expense():
return $default(_that.id,_that.ownerId,_that.ownerType,_that.description,_that.category,_that.costType,_that.isRecurringMonthly,_that.templateId,_that.monthKey,_that.totalAmount,_that.amountPaid,_that.amountRemaining,_that.paymentStatus,_that.expenseDate,_that.createdByUid,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String ownerType,  String description,  String category,  String costType,  bool isRecurringMonthly,  String? templateId,  String monthKey,  num totalAmount,  num amountPaid,  num amountRemaining,  String paymentStatus, @TimestampConverter()  DateTime? expenseDate,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.description,_that.category,_that.costType,_that.isRecurringMonthly,_that.templateId,_that.monthKey,_that.totalAmount,_that.amountPaid,_that.amountRemaining,_that.paymentStatus,_that.expenseDate,_that.createdByUid,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Expense implements Expense {
  const _Expense({required this.id, required this.ownerId, this.ownerType = PatientOwnerType.doctor, required this.description, this.category = ExpenseCategory.other, this.costType = ExpenseCostType.variable, this.isRecurringMonthly = false, this.templateId, required this.monthKey, required this.totalAmount, this.amountPaid = 0, this.amountRemaining = 0, this.paymentStatus = 'unpaid', @TimestampConverter() this.expenseDate, required this.createdByUid, @TimestampConverter() this.createdAt});
  factory _Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

@override final  String id;
@override final  String ownerId;
@override@JsonKey() final  String ownerType;
@override final  String description;
@override@JsonKey() final  String category;
@override@JsonKey() final  String costType;
@override@JsonKey() final  bool isRecurringMonthly;
@override final  String? templateId;
@override final  String monthKey;
@override final  num totalAmount;
@override@JsonKey() final  num amountPaid;
@override@JsonKey() final  num amountRemaining;
@override@JsonKey() final  String paymentStatus;
@override@TimestampConverter() final  DateTime? expenseDate;
@override final  String createdByUid;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCopyWith<_Expense> get copyWith => __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.costType, costType) || other.costType == costType)&&(identical(other.isRecurringMonthly, isRecurringMonthly) || other.isRecurringMonthly == isRecurringMonthly)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.monthKey, monthKey) || other.monthKey == monthKey)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,description,category,costType,isRecurringMonthly,templateId,monthKey,totalAmount,amountPaid,amountRemaining,paymentStatus,expenseDate,createdByUid,createdAt);

@override
String toString() {
  return 'Expense(id: $id, ownerId: $ownerId, ownerType: $ownerType, description: $description, category: $category, costType: $costType, isRecurringMonthly: $isRecurringMonthly, templateId: $templateId, monthKey: $monthKey, totalAmount: $totalAmount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, paymentStatus: $paymentStatus, expenseDate: $expenseDate, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) _then) = __$ExpenseCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String ownerType, String description, String category, String costType, bool isRecurringMonthly, String? templateId, String monthKey, num totalAmount, num amountPaid, num amountRemaining, String paymentStatus,@TimestampConverter() DateTime? expenseDate, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(this._self, this._then);

  final _Expense _self;
  final $Res Function(_Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? description = null,Object? category = null,Object? costType = null,Object? isRecurringMonthly = null,Object? templateId = freezed,Object? monthKey = null,Object? totalAmount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? paymentStatus = null,Object? expenseDate = freezed,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(_Expense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,costType: null == costType ? _self.costType : costType // ignore: cast_nullable_to_non_nullable
as String,isRecurringMonthly: null == isRecurringMonthly ? _self.isRecurringMonthly : isRecurringMonthly // ignore: cast_nullable_to_non_nullable
as bool,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,monthKey: null == monthKey ? _self.monthKey : monthKey // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as num,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as num,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ExpenseTemplate {

 String get id; String get ownerId; String get ownerType; String get description; String get category; String get costType; num get amount; bool get active; String get createdByUid;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of ExpenseTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseTemplateCopyWith<ExpenseTemplate> get copyWith => _$ExpenseTemplateCopyWithImpl<ExpenseTemplate>(this as ExpenseTemplate, _$identity);

  /// Serializes this ExpenseTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.costType, costType) || other.costType == costType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.active, active) || other.active == active)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,description,category,costType,amount,active,createdByUid,createdAt);

@override
String toString() {
  return 'ExpenseTemplate(id: $id, ownerId: $ownerId, ownerType: $ownerType, description: $description, category: $category, costType: $costType, amount: $amount, active: $active, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ExpenseTemplateCopyWith<$Res>  {
  factory $ExpenseTemplateCopyWith(ExpenseTemplate value, $Res Function(ExpenseTemplate) _then) = _$ExpenseTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String ownerType, String description, String category, String costType, num amount, bool active, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$ExpenseTemplateCopyWithImpl<$Res>
    implements $ExpenseTemplateCopyWith<$Res> {
  _$ExpenseTemplateCopyWithImpl(this._self, this._then);

  final ExpenseTemplate _self;
  final $Res Function(ExpenseTemplate) _then;

/// Create a copy of ExpenseTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? description = null,Object? category = null,Object? costType = null,Object? amount = null,Object? active = null,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(ExpenseTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,costType: null == costType ? _self.costType : costType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseTemplate].
extension ExpenseTemplatePatterns on ExpenseTemplate {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseTemplate() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseTemplate value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseTemplate():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseTemplate() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String description,  String category,  String costType,  num amount,  bool active,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseTemplate() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.description,_that.category,_that.costType,_that.amount,_that.active,_that.createdByUid,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String ownerType,  String description,  String category,  String costType,  num amount,  bool active,  String createdByUid, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ExpenseTemplate():
return $default(_that.id,_that.ownerId,_that.ownerType,_that.description,_that.category,_that.costType,_that.amount,_that.active,_that.createdByUid,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String ownerType,  String description,  String category,  String costType,  num amount,  bool active,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseTemplate() when $default != null:
return $default(_that.id,_that.ownerId,_that.ownerType,_that.description,_that.category,_that.costType,_that.amount,_that.active,_that.createdByUid,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseTemplate implements ExpenseTemplate {
  const _ExpenseTemplate({required this.id, required this.ownerId, this.ownerType = PatientOwnerType.doctor, required this.description, this.category = ExpenseCategory.other, this.costType = ExpenseCostType.fixed, required this.amount, this.active = true, required this.createdByUid, @TimestampConverter() this.createdAt});
  factory _ExpenseTemplate.fromJson(Map<String, dynamic> json) => _$ExpenseTemplateFromJson(json);

@override final  String id;
@override final  String ownerId;
@override@JsonKey() final  String ownerType;
@override final  String description;
@override@JsonKey() final  String category;
@override@JsonKey() final  String costType;
@override final  num amount;
@override@JsonKey() final  bool active;
@override final  String createdByUid;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of ExpenseTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseTemplateCopyWith<_ExpenseTemplate> get copyWith => __$ExpenseTemplateCopyWithImpl<_ExpenseTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.costType, costType) || other.costType == costType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.active, active) || other.active == active)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,ownerType,description,category,costType,amount,active,createdByUid,createdAt);

@override
String toString() {
  return 'ExpenseTemplate(id: $id, ownerId: $ownerId, ownerType: $ownerType, description: $description, category: $category, costType: $costType, amount: $amount, active: $active, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ExpenseTemplateCopyWith<$Res> implements $ExpenseTemplateCopyWith<$Res> {
  factory _$ExpenseTemplateCopyWith(_ExpenseTemplate value, $Res Function(_ExpenseTemplate) _then) = __$ExpenseTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String ownerType, String description, String category, String costType, num amount, bool active, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$ExpenseTemplateCopyWithImpl<$Res>
    implements _$ExpenseTemplateCopyWith<$Res> {
  __$ExpenseTemplateCopyWithImpl(this._self, this._then);

  final _ExpenseTemplate _self;
  final $Res Function(_ExpenseTemplate) _then;

/// Create a copy of ExpenseTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? ownerType = null,Object? description = null,Object? category = null,Object? costType = null,Object? amount = null,Object? active = null,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(_ExpenseTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,ownerType: null == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,costType: null == costType ? _self.costType : costType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ExpensePayment {

 String get id; num get amount; String get method; String get recordedByUid;@TimestampConverter() DateTime? get recordedAt; String get note;
/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensePaymentCopyWith<ExpensePayment> get copyWith => _$ExpensePaymentCopyWithImpl<ExpensePayment>(this as ExpensePayment, _$identity);

  /// Serializes this ExpensePayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensePayment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.recordedByUid, recordedByUid) || other.recordedByUid == recordedByUid)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,method,recordedByUid,recordedAt,note);

@override
String toString() {
  return 'ExpensePayment(id: $id, amount: $amount, method: $method, recordedByUid: $recordedByUid, recordedAt: $recordedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class $ExpensePaymentCopyWith<$Res>  {
  factory $ExpensePaymentCopyWith(ExpensePayment value, $Res Function(ExpensePayment) _then) = _$ExpensePaymentCopyWithImpl;
@useResult
$Res call({
 String id, num amount, String method, String recordedByUid,@TimestampConverter() DateTime? recordedAt, String note
});




}
/// @nodoc
class _$ExpensePaymentCopyWithImpl<$Res>
    implements $ExpensePaymentCopyWith<$Res> {
  _$ExpensePaymentCopyWithImpl(this._self, this._then);

  final ExpensePayment _self;
  final $Res Function(ExpensePayment) _then;

/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? method = null,Object? recordedByUid = null,Object? recordedAt = freezed,Object? note = null,}) {
  return _then(ExpensePayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,recordedByUid: null == recordedByUid ? _self.recordedByUid : recordedByUid // ignore: cast_nullable_to_non_nullable
as String,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensePayment].
extension ExpensePaymentPatterns on ExpensePayment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensePayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensePayment value)  $default,){
final _that = this;
switch (_that) {
case _ExpensePayment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensePayment value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
return $default(_that.id,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)  $default,) {final _that = this;
switch (_that) {
case _ExpensePayment():
return $default(_that.id,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)?  $default,) {final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
return $default(_that.id,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpensePayment implements ExpensePayment {
  const _ExpensePayment({required this.id, required this.amount, this.method = 'cash', required this.recordedByUid, @TimestampConverter() this.recordedAt, this.note = ''});
  factory _ExpensePayment.fromJson(Map<String, dynamic> json) => _$ExpensePaymentFromJson(json);

@override final  String id;
@override final  num amount;
@override@JsonKey() final  String method;
@override final  String recordedByUid;
@override@TimestampConverter() final  DateTime? recordedAt;
@override@JsonKey() final  String note;

/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensePaymentCopyWith<_ExpensePayment> get copyWith => __$ExpensePaymentCopyWithImpl<_ExpensePayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpensePaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensePayment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.recordedByUid, recordedByUid) || other.recordedByUid == recordedByUid)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,method,recordedByUid,recordedAt,note);

@override
String toString() {
  return 'ExpensePayment(id: $id, amount: $amount, method: $method, recordedByUid: $recordedByUid, recordedAt: $recordedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ExpensePaymentCopyWith<$Res> implements $ExpensePaymentCopyWith<$Res> {
  factory _$ExpensePaymentCopyWith(_ExpensePayment value, $Res Function(_ExpensePayment) _then) = __$ExpensePaymentCopyWithImpl;
@override @useResult
$Res call({
 String id, num amount, String method, String recordedByUid,@TimestampConverter() DateTime? recordedAt, String note
});




}
/// @nodoc
class __$ExpensePaymentCopyWithImpl<$Res>
    implements _$ExpensePaymentCopyWith<$Res> {
  __$ExpensePaymentCopyWithImpl(this._self, this._then);

  final _ExpensePayment _self;
  final $Res Function(_ExpensePayment) _then;

/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? method = null,Object? recordedByUid = null,Object? recordedAt = freezed,Object? note = null,}) {
  return _then(_ExpensePayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,recordedByUid: null == recordedByUid ? _self.recordedByUid : recordedByUid // ignore: cast_nullable_to_non_nullable
as String,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
