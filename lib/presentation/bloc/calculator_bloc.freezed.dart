// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
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
class $CalculatorEventCopyWith<$Res> {
  $CalculatorEventCopyWith(CalculatorEvent _, $Res Function(CalculatorEvent) __);
}

/// Adds pattern-matching-related methods to [CalculatorEvent].
extension CalculatorEventPatterns on CalculatorEvent {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Clear value)? clear,
    TResult Function(Delete value)? delete,
    TResult Function(FlipSign value)? flipSign,
    TResult Function(Input value)? input,
    TResult Function(Evaluate value)? evaluate,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Clear() when clear != null:
        return clear(_that);
      case Delete() when delete != null:
        return delete(_that);
      case FlipSign() when flipSign != null:
        return flipSign(_that);
      case Input() when input != null:
        return input(_that);
      case Evaluate() when evaluate != null:
        return evaluate(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Clear value) clear,
    required TResult Function(Delete value) delete,
    required TResult Function(FlipSign value) flipSign,
    required TResult Function(Input value) input,
    required TResult Function(Evaluate value) evaluate,
  }) {
    final _that = this;
    switch (_that) {
      case Clear():
        return clear(_that);
      case Delete():
        return delete(_that);
      case FlipSign():
        return flipSign(_that);
      case Input():
        return input(_that);
      case Evaluate():
        return evaluate(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Clear value)? clear,
    TResult? Function(Delete value)? delete,
    TResult? Function(FlipSign value)? flipSign,
    TResult? Function(Input value)? input,
    TResult? Function(Evaluate value)? evaluate,
  }) {
    final _that = this;
    switch (_that) {
      case Clear() when clear != null:
        return clear(_that);
      case Delete() when delete != null:
        return delete(_that);
      case FlipSign() when flipSign != null:
        return flipSign(_that);
      case Input() when input != null:
        return input(_that);
      case Evaluate() when evaluate != null:
        return evaluate(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clear,
    TResult Function()? delete,
    TResult Function()? flipSign,
    TResult Function(String input)? input,
    TResult Function()? evaluate,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Clear() when clear != null:
        return clear();
      case Delete() when delete != null:
        return delete();
      case FlipSign() when flipSign != null:
        return flipSign();
      case Input() when input != null:
        return input(_that.input);
      case Evaluate() when evaluate != null:
        return evaluate();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clear,
    required TResult Function() delete,
    required TResult Function() flipSign,
    required TResult Function(String input) input,
    required TResult Function() evaluate,
  }) {
    final _that = this;
    switch (_that) {
      case Clear():
        return clear();
      case Delete():
        return delete();
      case FlipSign():
        return flipSign();
      case Input():
        return input(_that.input);
      case Evaluate():
        return evaluate();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clear,
    TResult? Function()? delete,
    TResult? Function()? flipSign,
    TResult? Function(String input)? input,
    TResult? Function()? evaluate,
  }) {
    final _that = this;
    switch (_that) {
      case Clear() when clear != null:
        return clear();
      case Delete() when delete != null:
        return delete();
      case FlipSign() when flipSign != null:
        return flipSign();
      case Input() when input != null:
        return input(_that.input);
      case Evaluate() when evaluate != null:
        return evaluate();
      case _:
        return null;
    }
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

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputCopyWith<Input> get copyWith => _$InputCopyWithImpl<Input>(this, _$identity);

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
abstract mixin class $InputCopyWith<$Res> implements $CalculatorEventCopyWith<$Res> {
  factory $InputCopyWith(Input value, $Res Function(Input) _then) = _$InputCopyWithImpl;
  @useResult
  $Res call({String input});
}

/// @nodoc
class _$InputCopyWithImpl<$Res> implements $InputCopyWith<$Res> {
  _$InputCopyWithImpl(this._self, this._then);

  final Input _self;
  final $Res Function(Input) _then;

  /// Create a copy of CalculatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? input = null,
  }) {
    return _then(Input(
      null == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      _$CalculatorStateCopyWithImpl<CalculatorState>(this as CalculatorState, _$identity);

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
  factory $CalculatorStateCopyWith(CalculatorState value, $Res Function(CalculatorState) _then) =
      _$CalculatorStateCopyWithImpl;
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
    return _then(_self.copyWith(
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
    ));
  }
}

/// Adds pattern-matching-related methods to [CalculatorState].
extension CalculatorStatePatterns on CalculatorState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CalculatorState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalculatorState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CalculatorState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalculatorState():
        return $default(_that);
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CalculatorState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalculatorState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String equation, String result, String expression)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalculatorState() when $default != null:
        return $default(_that.equation, _that.result, _that.expression);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String equation, String result, String expression) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalculatorState():
        return $default(_that.equation, _that.result, _that.expression);
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String equation, String result, String expression)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalculatorState() when $default != null:
        return $default(_that.equation, _that.result, _that.expression);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CalculatorState implements CalculatorState {
  const _CalculatorState({this.equation = '0', this.result = '0', this.expression = ''});

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
  factory _$CalculatorStateCopyWith(_CalculatorState value, $Res Function(_CalculatorState) _then) =
      __$CalculatorStateCopyWithImpl;
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
    return _then(_CalculatorState(
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
    ));
  }
}

// dart format on
