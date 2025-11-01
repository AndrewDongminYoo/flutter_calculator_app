// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculatorEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is CalculatorEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalculatorEvent()';
  }
}

/// @nodoc

class Clear implements CalculatorEvent {
  const Clear();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is Clear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalculatorEvent.clear()';
  }
}

/// @nodoc

class Delete implements CalculatorEvent {
  const Delete();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is Delete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalculatorEvent.delete()';
  }
}

/// @nodoc

class FlipSign implements CalculatorEvent {
  const FlipSign();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is FlipSign);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalculatorEvent.flipSign()';
  }
}

/// @nodoc

class Input implements CalculatorEvent {
  const Input(this.input);

  final String input;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Input && (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input);

  @override
  String toString() {
    return 'CalculatorEvent.input(input: $input)';
  }
}

/// @nodoc

class Evaluate implements CalculatorEvent {
  const Evaluate();

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is Evaluate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalculatorEvent.evaluate()';
  }
}

/// @nodoc
mixin _$CalculatorState {
  String get equation;
  String get result;
  String get expression;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalculatorStateCopyWith<CalculatorState> get copyWith => _$CalculatorStateCopyWithImpl<CalculatorState>(
    this as CalculatorState,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalculatorState &&
            (identical(other.equation, equation) || other.equation == equation) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.expression, expression) || other.expression == expression));
  }

  @override
  int get hashCode => Object.hash(runtimeType, equation, result, expression);

  @override
  String toString() {
    return 'CalculatorState(equation: $equation, result: $result, expression: $expression)';
  }
}

/// @nodoc
abstract mixin class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
    CalculatorState value,
    $Res Function(CalculatorState) _then,
  ) = _$CalculatorStateCopyWithImpl;
  @useResult
  $Res call({String equation, String result, String expression});
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res> implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._self, this._then);

  final CalculatorState _self;
  final $Res Function(CalculatorState) _then;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equation = null,
    Object? result = null,
    Object? expression = null,
  }) {
    return _then(
      _self.copyWith(
        equation: null == equation
            ? _self.equation
            : equation // ignore: cast_nullable_to_non_nullable
                  as String,
        result: null == result
            ? _self.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String,
        expression: null == expression
            ? _self.expression
            : expression // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _CalculatorState implements CalculatorState {
  const _CalculatorState({
    this.equation = '0',
    this.result = '0',
    this.expression = '',
  });

  @override
  @JsonKey()
  final String equation;
  @override
  @JsonKey()
  final String result;
  @override
  @JsonKey()
  final String expression;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      __$CalculatorStateCopyWithImpl<_CalculatorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculatorState &&
            (identical(other.equation, equation) || other.equation == equation) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.expression, expression) || other.expression == expression));
  }

  @override
  int get hashCode => Object.hash(runtimeType, equation, result, expression);

  @override
  String toString() {
    return 'CalculatorState(equation: $equation, result: $result, expression: $expression)';
  }
}

/// @nodoc
abstract mixin class _$CalculatorStateCopyWith<$Res> implements $CalculatorStateCopyWith<$Res> {
  factory _$CalculatorStateCopyWith(
    _CalculatorState value,
    $Res Function(_CalculatorState) _then,
  ) = __$CalculatorStateCopyWithImpl;
  @override
  @useResult
  $Res call({String equation, String result, String expression});
}

/// @nodoc
class __$CalculatorStateCopyWithImpl<$Res> implements _$CalculatorStateCopyWith<$Res> {
  __$CalculatorStateCopyWithImpl(this._self, this._then);

  final _CalculatorState _self;
  final $Res Function(_CalculatorState) _then;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? equation = null,
    Object? result = null,
    Object? expression = null,
  }) {
    return _then(
      _CalculatorState(
        equation: null == equation
            ? _self.equation
            : equation // ignore: cast_nullable_to_non_nullable
                  as String,
        result: null == result
            ? _self.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String,
        expression: null == expression
            ? _self.expression
            : expression // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
