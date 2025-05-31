// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculationResult {
  double get result;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalculationResultCopyWith<CalculationResult> get copyWith =>
      _$CalculationResultCopyWithImpl<CalculationResult>(this as CalculationResult, _$identity);

  /// Serializes this CalculationResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalculationResult &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'CalculationResult(result: $result)';
  }
}

/// @nodoc
abstract mixin class $CalculationResultCopyWith<$Res> {
  factory $CalculationResultCopyWith(CalculationResult value, $Res Function(CalculationResult) _then) =
      _$CalculationResultCopyWithImpl;
  @useResult
  $Res call({double result});
}

/// @nodoc
class _$CalculationResultCopyWithImpl<$Res> implements $CalculationResultCopyWith<$Res> {
  _$CalculationResultCopyWithImpl(this._self, this._then);

  final CalculationResult _self;
  final $Res Function(CalculationResult) _then;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_self.copyWith(
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CalculationResult implements CalculationResult {
  _CalculationResult({required this.result});
  factory _CalculationResult.fromJson(Map<String, dynamic> json) => _$CalculationResultFromJson(json);

  @override
  final double result;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalculationResultCopyWith<_CalculationResult> get copyWith =>
      __$CalculationResultCopyWithImpl<_CalculationResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalculationResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculationResult &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'CalculationResult(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$CalculationResultCopyWith<$Res> implements $CalculationResultCopyWith<$Res> {
  factory _$CalculationResultCopyWith(_CalculationResult value, $Res Function(_CalculationResult) _then) =
      __$CalculationResultCopyWithImpl;
  @override
  @useResult
  $Res call({double result});
}

/// @nodoc
class __$CalculationResultCopyWithImpl<$Res> implements _$CalculationResultCopyWith<$Res> {
  __$CalculationResultCopyWithImpl(this._self, this._then);

  final _CalculationResult _self;
  final $Res Function(_CalculationResult) _then;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_CalculationResult(
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
