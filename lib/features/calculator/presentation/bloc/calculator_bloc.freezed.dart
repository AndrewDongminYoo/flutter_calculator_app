// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clear,
    required TResult Function() delete,
    required TResult Function() flipSign,
    required TResult Function(String input) input,
    required TResult Function() evaluate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clear,
    TResult? Function()? delete,
    TResult? Function()? flipSign,
    TResult? Function(String input)? input,
    TResult? Function()? evaluate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clear,
    TResult Function()? delete,
    TResult Function()? flipSign,
    TResult Function(String input)? input,
    TResult Function()? evaluate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Clear value) clear,
    required TResult Function(Delete value) delete,
    required TResult Function(FlipSign value) flipSign,
    required TResult Function(Input value) input,
    required TResult Function(Evaluate value) evaluate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Clear value)? clear,
    TResult? Function(Delete value)? delete,
    TResult? Function(FlipSign value)? flipSign,
    TResult? Function(Input value)? input,
    TResult? Function(Evaluate value)? evaluate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Clear value)? clear,
    TResult Function(Delete value)? delete,
    TResult Function(FlipSign value)? flipSign,
    TResult Function(Input value)? input,
    TResult Function(Evaluate value)? evaluate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorEventCopyWith<$Res> {
  factory $CalculatorEventCopyWith(CalculatorEvent value, $Res Function(CalculatorEvent) then) =
      _$CalculatorEventCopyWithImpl<$Res, CalculatorEvent>;
}

/// @nodoc
class _$CalculatorEventCopyWithImpl<$Res, $Val extends CalculatorEvent> implements $CalculatorEventCopyWith<$Res> {
  _$CalculatorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(_$ClearImpl value, $Res Function(_$ClearImpl) then) = __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res> extends _$CalculatorEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(_$ClearImpl _value, $Res Function(_$ClearImpl) _then) : super(_value, _then);

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'CalculatorEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clear,
    required TResult Function() delete,
    required TResult Function() flipSign,
    required TResult Function(String input) input,
    required TResult Function() evaluate,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clear,
    TResult? Function()? delete,
    TResult? Function()? flipSign,
    TResult? Function(String input)? input,
    TResult? Function()? evaluate,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clear,
    TResult Function()? delete,
    TResult Function()? flipSign,
    TResult Function(String input)? input,
    TResult Function()? evaluate,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Clear value) clear,
    required TResult Function(Delete value) delete,
    required TResult Function(FlipSign value) flipSign,
    required TResult Function(Input value) input,
    required TResult Function(Evaluate value) evaluate,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Clear value)? clear,
    TResult? Function(Delete value)? delete,
    TResult? Function(FlipSign value)? flipSign,
    TResult? Function(Input value)? input,
    TResult? Function(Evaluate value)? evaluate,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Clear value)? clear,
    TResult Function(Delete value)? delete,
    TResult Function(FlipSign value)? flipSign,
    TResult Function(Input value)? input,
    TResult Function(Evaluate value)? evaluate,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class Clear implements CalculatorEvent {
  const factory Clear() = _$ClearImpl;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(_$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res> extends _$CalculatorEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(_$DeleteImpl _value, $Res Function(_$DeleteImpl) _then) : super(_value, _then);

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteImpl implements Delete {
  const _$DeleteImpl();

  @override
  String toString() {
    return 'CalculatorEvent.delete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$DeleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clear,
    required TResult Function() delete,
    required TResult Function() flipSign,
    required TResult Function(String input) input,
    required TResult Function() evaluate,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clear,
    TResult? Function()? delete,
    TResult? Function()? flipSign,
    TResult? Function(String input)? input,
    TResult? Function()? evaluate,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clear,
    TResult Function()? delete,
    TResult Function()? flipSign,
    TResult Function(String input)? input,
    TResult Function()? evaluate,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Clear value) clear,
    required TResult Function(Delete value) delete,
    required TResult Function(FlipSign value) flipSign,
    required TResult Function(Input value) input,
    required TResult Function(Evaluate value) evaluate,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Clear value)? clear,
    TResult? Function(Delete value)? delete,
    TResult? Function(FlipSign value)? flipSign,
    TResult? Function(Input value)? input,
    TResult? Function(Evaluate value)? evaluate,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Clear value)? clear,
    TResult Function(Delete value)? delete,
    TResult Function(FlipSign value)? flipSign,
    TResult Function(Input value)? input,
    TResult Function(Evaluate value)? evaluate,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete implements CalculatorEvent {
  const factory Delete() = _$DeleteImpl;
}

/// @nodoc
abstract class _$$FlipSignImplCopyWith<$Res> {
  factory _$$FlipSignImplCopyWith(_$FlipSignImpl value, $Res Function(_$FlipSignImpl) then) =
      __$$FlipSignImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FlipSignImplCopyWithImpl<$Res> extends _$CalculatorEventCopyWithImpl<$Res, _$FlipSignImpl>
    implements _$$FlipSignImplCopyWith<$Res> {
  __$$FlipSignImplCopyWithImpl(_$FlipSignImpl _value, $Res Function(_$FlipSignImpl) _then) : super(_value, _then);

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FlipSignImpl implements FlipSign {
  const _$FlipSignImpl();

  @override
  String toString() {
    return 'CalculatorEvent.flipSign()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$FlipSignImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clear,
    required TResult Function() delete,
    required TResult Function() flipSign,
    required TResult Function(String input) input,
    required TResult Function() evaluate,
  }) {
    return flipSign();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clear,
    TResult? Function()? delete,
    TResult? Function()? flipSign,
    TResult? Function(String input)? input,
    TResult? Function()? evaluate,
  }) {
    return flipSign?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clear,
    TResult Function()? delete,
    TResult Function()? flipSign,
    TResult Function(String input)? input,
    TResult Function()? evaluate,
    required TResult orElse(),
  }) {
    if (flipSign != null) {
      return flipSign();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Clear value) clear,
    required TResult Function(Delete value) delete,
    required TResult Function(FlipSign value) flipSign,
    required TResult Function(Input value) input,
    required TResult Function(Evaluate value) evaluate,
  }) {
    return flipSign(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Clear value)? clear,
    TResult? Function(Delete value)? delete,
    TResult? Function(FlipSign value)? flipSign,
    TResult? Function(Input value)? input,
    TResult? Function(Evaluate value)? evaluate,
  }) {
    return flipSign?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Clear value)? clear,
    TResult Function(Delete value)? delete,
    TResult Function(FlipSign value)? flipSign,
    TResult Function(Input value)? input,
    TResult Function(Evaluate value)? evaluate,
    required TResult orElse(),
  }) {
    if (flipSign != null) {
      return flipSign(this);
    }
    return orElse();
  }
}

abstract class FlipSign implements CalculatorEvent {
  const factory FlipSign() = _$FlipSignImpl;
}

/// @nodoc
abstract class _$$InputImplCopyWith<$Res> {
  factory _$$InputImplCopyWith(_$InputImpl value, $Res Function(_$InputImpl) then) = __$$InputImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String input});
}

/// @nodoc
class __$$InputImplCopyWithImpl<$Res> extends _$CalculatorEventCopyWithImpl<$Res, _$InputImpl>
    implements _$$InputImplCopyWith<$Res> {
  __$$InputImplCopyWithImpl(_$InputImpl _value, $Res Function(_$InputImpl) _then) : super(_value, _then);

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
  }) {
    return _then(_$InputImpl(
      null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InputImpl implements Input {
  const _$InputImpl(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'CalculatorEvent.input(input: $input)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputImpl &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input);

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputImplCopyWith<_$InputImpl> get copyWith => __$$InputImplCopyWithImpl<_$InputImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clear,
    required TResult Function() delete,
    required TResult Function() flipSign,
    required TResult Function(String input) input,
    required TResult Function() evaluate,
  }) {
    return input(this.input);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clear,
    TResult? Function()? delete,
    TResult? Function()? flipSign,
    TResult? Function(String input)? input,
    TResult? Function()? evaluate,
  }) {
    return input?.call(this.input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clear,
    TResult Function()? delete,
    TResult Function()? flipSign,
    TResult Function(String input)? input,
    TResult Function()? evaluate,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(this.input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Clear value) clear,
    required TResult Function(Delete value) delete,
    required TResult Function(FlipSign value) flipSign,
    required TResult Function(Input value) input,
    required TResult Function(Evaluate value) evaluate,
  }) {
    return input(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Clear value)? clear,
    TResult? Function(Delete value)? delete,
    TResult? Function(FlipSign value)? flipSign,
    TResult? Function(Input value)? input,
    TResult? Function(Evaluate value)? evaluate,
  }) {
    return input?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Clear value)? clear,
    TResult Function(Delete value)? delete,
    TResult Function(FlipSign value)? flipSign,
    TResult Function(Input value)? input,
    TResult Function(Evaluate value)? evaluate,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(this);
    }
    return orElse();
  }
}

abstract class Input implements CalculatorEvent {
  const factory Input(final String input) = _$InputImpl;

  String get input;

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputImplCopyWith<_$InputImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EvaluateImplCopyWith<$Res> {
  factory _$$EvaluateImplCopyWith(_$EvaluateImpl value, $Res Function(_$EvaluateImpl) then) =
      __$$EvaluateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EvaluateImplCopyWithImpl<$Res> extends _$CalculatorEventCopyWithImpl<$Res, _$EvaluateImpl>
    implements _$$EvaluateImplCopyWith<$Res> {
  __$$EvaluateImplCopyWithImpl(_$EvaluateImpl _value, $Res Function(_$EvaluateImpl) _then) : super(_value, _then);

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EvaluateImpl implements Evaluate {
  const _$EvaluateImpl();

  @override
  String toString() {
    return 'CalculatorEvent.evaluate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$EvaluateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clear,
    required TResult Function() delete,
    required TResult Function() flipSign,
    required TResult Function(String input) input,
    required TResult Function() evaluate,
  }) {
    return evaluate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clear,
    TResult? Function()? delete,
    TResult? Function()? flipSign,
    TResult? Function(String input)? input,
    TResult? Function()? evaluate,
  }) {
    return evaluate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clear,
    TResult Function()? delete,
    TResult Function()? flipSign,
    TResult Function(String input)? input,
    TResult Function()? evaluate,
    required TResult orElse(),
  }) {
    if (evaluate != null) {
      return evaluate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Clear value) clear,
    required TResult Function(Delete value) delete,
    required TResult Function(FlipSign value) flipSign,
    required TResult Function(Input value) input,
    required TResult Function(Evaluate value) evaluate,
  }) {
    return evaluate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Clear value)? clear,
    TResult? Function(Delete value)? delete,
    TResult? Function(FlipSign value)? flipSign,
    TResult? Function(Input value)? input,
    TResult? Function(Evaluate value)? evaluate,
  }) {
    return evaluate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Clear value)? clear,
    TResult Function(Delete value)? delete,
    TResult Function(FlipSign value)? flipSign,
    TResult Function(Input value)? input,
    TResult Function(Evaluate value)? evaluate,
    required TResult orElse(),
  }) {
    if (evaluate != null) {
      return evaluate(this);
    }
    return orElse();
  }
}

abstract class Evaluate implements CalculatorEvent {
  const factory Evaluate() = _$EvaluateImpl;
}

/// @nodoc
mixin _$CalculatorState {
  String get equation => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get expression => throw _privateConstructorUsedError;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculatorStateCopyWith<CalculatorState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res, CalculatorState>;
  @useResult
  $Res call({String equation, String result, String expression});
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res, $Val extends CalculatorState> implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equation = null,
    Object? result = null,
    Object? expression = null,
  }) {
    return _then(_value.copyWith(
      equation: null == equation
          ? _value.equation
          : equation // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculatorStateImplCopyWith<$Res> implements $CalculatorStateCopyWith<$Res> {
  factory _$$CalculatorStateImplCopyWith(_$CalculatorStateImpl value, $Res Function(_$CalculatorStateImpl) then) =
      __$$CalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String equation, String result, String expression});
}

/// @nodoc
class __$$CalculatorStateImplCopyWithImpl<$Res> extends _$CalculatorStateCopyWithImpl<$Res, _$CalculatorStateImpl>
    implements _$$CalculatorStateImplCopyWith<$Res> {
  __$$CalculatorStateImplCopyWithImpl(_$CalculatorStateImpl _value, $Res Function(_$CalculatorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equation = null,
    Object? result = null,
    Object? expression = null,
  }) {
    return _then(_$CalculatorStateImpl(
      equation: null == equation
          ? _value.equation
          : equation // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CalculatorStateImpl implements _CalculatorState {
  const _$CalculatorStateImpl({this.equation = '0', this.result = '0', this.expression = ''});

  @override
  @JsonKey()
  final String equation;
  @override
  @JsonKey()
  final String result;
  @override
  @JsonKey()
  final String expression;

  @override
  String toString() {
    return 'CalculatorState(equation: $equation, result: $result, expression: $expression)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatorStateImpl &&
            (identical(other.equation, equation) || other.equation == equation) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.expression, expression) || other.expression == expression));
  }

  @override
  int get hashCode => Object.hash(runtimeType, equation, result, expression);

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith =>
      __$$CalculatorStateImplCopyWithImpl<_$CalculatorStateImpl>(this, _$identity);
}

abstract class _CalculatorState implements CalculatorState {
  const factory _CalculatorState({final String equation, final String result, final String expression}) =
      _$CalculatorStateImpl;

  @override
  String get equation;
  @override
  String get result;
  @override
  String get expression;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith => throw _privateConstructorUsedError;
}
