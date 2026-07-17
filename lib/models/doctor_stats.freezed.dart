// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorStats _$DoctorStatsFromJson(Map<String, dynamic> json) {
  return _DoctorStats.fromJson(json);
}

/// @nodoc
mixin _$DoctorStats {
  int get totalOrders => throw _privateConstructorUsedError;
  num get totalSpent => throw _privateConstructorUsedError;
  num get totalDebt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get lastOrderAt => throw _privateConstructorUsedError;

  /// Serializes this DoctorStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorStatsCopyWith<DoctorStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorStatsCopyWith<$Res> {
  factory $DoctorStatsCopyWith(
          DoctorStats value, $Res Function(DoctorStats) then) =
      _$DoctorStatsCopyWithImpl<$Res, DoctorStats>;
  @useResult
  $Res call(
      {int totalOrders,
      num totalSpent,
      num totalDebt,
      @TimestampConverter() DateTime? lastOrderAt});
}

/// @nodoc
class _$DoctorStatsCopyWithImpl<$Res, $Val extends DoctorStats>
    implements $DoctorStatsCopyWith<$Res> {
  _$DoctorStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? totalDebt = null,
    Object? lastOrderAt = freezed,
  }) {
    return _then(_value.copyWith(
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as num,
      totalDebt: null == totalDebt
          ? _value.totalDebt
          : totalDebt // ignore: cast_nullable_to_non_nullable
              as num,
      lastOrderAt: freezed == lastOrderAt
          ? _value.lastOrderAt
          : lastOrderAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorStatsImplCopyWith<$Res>
    implements $DoctorStatsCopyWith<$Res> {
  factory _$$DoctorStatsImplCopyWith(
          _$DoctorStatsImpl value, $Res Function(_$DoctorStatsImpl) then) =
      __$$DoctorStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalOrders,
      num totalSpent,
      num totalDebt,
      @TimestampConverter() DateTime? lastOrderAt});
}

/// @nodoc
class __$$DoctorStatsImplCopyWithImpl<$Res>
    extends _$DoctorStatsCopyWithImpl<$Res, _$DoctorStatsImpl>
    implements _$$DoctorStatsImplCopyWith<$Res> {
  __$$DoctorStatsImplCopyWithImpl(
      _$DoctorStatsImpl _value, $Res Function(_$DoctorStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? totalDebt = null,
    Object? lastOrderAt = freezed,
  }) {
    return _then(_$DoctorStatsImpl(
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as num,
      totalDebt: null == totalDebt
          ? _value.totalDebt
          : totalDebt // ignore: cast_nullable_to_non_nullable
              as num,
      lastOrderAt: freezed == lastOrderAt
          ? _value.lastOrderAt
          : lastOrderAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorStatsImpl implements _DoctorStats {
  const _$DoctorStatsImpl(
      {this.totalOrders = 0,
      this.totalSpent = 0,
      this.totalDebt = 0,
      @TimestampConverter() this.lastOrderAt});

  factory _$DoctorStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalOrders;
  @override
  @JsonKey()
  final num totalSpent;
  @override
  @JsonKey()
  final num totalDebt;
  @override
  @TimestampConverter()
  final DateTime? lastOrderAt;

  @override
  String toString() {
    return 'DoctorStats(totalOrders: $totalOrders, totalSpent: $totalSpent, totalDebt: $totalDebt, lastOrderAt: $lastOrderAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorStatsImpl &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalDebt, totalDebt) ||
                other.totalDebt == totalDebt) &&
            (identical(other.lastOrderAt, lastOrderAt) ||
                other.lastOrderAt == lastOrderAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalOrders, totalSpent, totalDebt, lastOrderAt);

  /// Create a copy of DoctorStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorStatsImplCopyWith<_$DoctorStatsImpl> get copyWith =>
      __$$DoctorStatsImplCopyWithImpl<_$DoctorStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorStatsImplToJson(
      this,
    );
  }
}

abstract class _DoctorStats implements DoctorStats {
  const factory _DoctorStats(
      {final int totalOrders,
      final num totalSpent,
      final num totalDebt,
      @TimestampConverter() final DateTime? lastOrderAt}) = _$DoctorStatsImpl;

  factory _DoctorStats.fromJson(Map<String, dynamic> json) =
      _$DoctorStatsImpl.fromJson;

  @override
  int get totalOrders;
  @override
  num get totalSpent;
  @override
  num get totalDebt;
  @override
  @TimestampConverter()
  DateTime? get lastOrderAt;

  /// Create a copy of DoctorStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorStatsImplCopyWith<_$DoctorStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
