// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculationModel {
  double get result;

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalculationModelCopyWith<CalculationModel> get copyWith =>
      _$CalculationModelCopyWithImpl<CalculationModel>(this as CalculationModel, _$identity);

  /// Serializes this CalculationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalculationModel &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'CalculationModel(result: $result)';
  }
}

/// @nodoc
abstract mixin class $CalculationModelCopyWith<$Res> {
  factory $CalculationModelCopyWith(CalculationModel value, $Res Function(CalculationModel) _then) =
      _$CalculationModelCopyWithImpl;
  @useResult
  $Res call({double result});
}

/// @nodoc
class _$CalculationModelCopyWithImpl<$Res> implements $CalculationModelCopyWith<$Res> {
  _$CalculationModelCopyWithImpl(this._self, this._then);

  final CalculationModel _self;
  final $Res Function(CalculationModel) _then;

  /// Create a copy of CalculationModel
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
class _CalculationModel implements CalculationModel {
  _CalculationModel({required this.result});
  factory _CalculationModel.fromJson(Map<String, dynamic> json) => _$CalculationModelFromJson(json);

  @override
  final double result;

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalculationModelCopyWith<_CalculationModel> get copyWith =>
      __$CalculationModelCopyWithImpl<_CalculationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalculationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculationModel &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'CalculationModel(result: $result)';
  }
}

/// @nodoc
abstract mixin class _$CalculationModelCopyWith<$Res> implements $CalculationModelCopyWith<$Res> {
  factory _$CalculationModelCopyWith(_CalculationModel value, $Res Function(_CalculationModel) _then) =
      __$CalculationModelCopyWithImpl;
  @override
  @useResult
  $Res call({double result});
}

/// @nodoc
class __$CalculationModelCopyWithImpl<$Res> implements _$CalculationModelCopyWith<$Res> {
  __$CalculationModelCopyWithImpl(this._self, this._then);

  final _CalculationModel _self;
  final $Res Function(_CalculationModel) _then;

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(_CalculationModel(
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
