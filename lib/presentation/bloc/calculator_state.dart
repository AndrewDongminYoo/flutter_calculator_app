part of 'calculator_bloc.dart';

@Freezed(copyWith: true)
sealed class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    @Default('0') String equation,
    @Default('0') String result,
    @Default('') String expression,
  }) = _CalculatorState;
}
