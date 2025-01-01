// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculationModel _$CalculationModelFromJson(Map<String, dynamic> json) {
  return _CalculationModel.fromJson(json);
}

/// @nodoc
mixin _$CalculationModel {
  double get result => throw _privateConstructorUsedError;

  /// Serializes this CalculationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculationModelCopyWith<CalculationModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationModelCopyWith<$Res> {
  factory $CalculationModelCopyWith(CalculationModel value, $Res Function(CalculationModel) then) =
      _$CalculationModelCopyWithImpl<$Res, CalculationModel>;
  @useResult
  $Res call({double result});
}

/// @nodoc
class _$CalculationModelCopyWithImpl<$Res, $Val extends CalculationModel> implements $CalculationModelCopyWith<$Res> {
  _$CalculationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationModelImplCopyWith<$Res> implements $CalculationModelCopyWith<$Res> {
  factory _$$CalculationModelImplCopyWith(_$CalculationModelImpl value, $Res Function(_$CalculationModelImpl) then) =
      __$$CalculationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double result});
}

/// @nodoc
class __$$CalculationModelImplCopyWithImpl<$Res> extends _$CalculationModelCopyWithImpl<$Res, _$CalculationModelImpl>
    implements _$$CalculationModelImplCopyWith<$Res> {
  __$$CalculationModelImplCopyWithImpl(_$CalculationModelImpl _value, $Res Function(_$CalculationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$CalculationModelImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationModelImpl implements _CalculationModel {
  _$CalculationModelImpl({required this.result});

  factory _$CalculationModelImpl.fromJson(Map<String, dynamic> json) => _$$CalculationModelImplFromJson(json);

  @override
  final double result;

  @override
  String toString() {
    return 'CalculationModel(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationModelImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationModelImplCopyWith<_$CalculationModelImpl> get copyWith =>
      __$$CalculationModelImplCopyWithImpl<_$CalculationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationModelImplToJson(
      this,
    );
  }
}

abstract class _CalculationModel implements CalculationModel {
  factory _CalculationModel({required final double result}) = _$CalculationModelImpl;

  factory _CalculationModel.fromJson(Map<String, dynamic> json) = _$CalculationModelImpl.fromJson;

  @override
  double get result;

  /// Create a copy of CalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationModelImplCopyWith<_$CalculationModelImpl> get copyWith => throw _privateConstructorUsedError;
}
