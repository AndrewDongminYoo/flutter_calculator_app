part of 'calculator_bloc.dart';

@Freezed(copyWith: true)
sealed class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    @Default('0') String equation,
    @Default('0') String result,
    @Default('') String expression,
  }) = _CalculatorState;

  const CalculatorState._();

  /// 화면에 표시된 [result]가 현재 [equation]을 평가해서 나온 값인지 여부.
  ///
  /// 식이 수정되면 [expression]이 비워지므로 다시 false가 된다.
  /// 결과값 자체를 센티널로 쓰면(`result != '0'`) 정답이 0인 경우(`2-2=`)를
  /// "결과 없음"으로 오판하기 때문에 이 플래그로 구분한다.
  bool get hasResult => expression.isNotEmpty;
}
