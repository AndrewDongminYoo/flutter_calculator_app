part of 'calculator_bloc.dart';

@freezed
class CalculatorEvent with _$CalculatorEvent {
  // 모든 값 초기화
  const factory CalculatorEvent.clear() = Clear;

  // 마지막 문자 하나 지우기
  const factory CalculatorEvent.delete() = Delete;

  // 부호 전환 (+/-)
  const factory CalculatorEvent.flipSign() = FlipSign;

  // 버튼(%, ÷, ×, -, +, 숫자, .) 입력
  const factory CalculatorEvent.input(String input) = Input;

  // = 입력 (수식 계산)
  const factory CalculatorEvent.evaluate() = Evaluate;

  // 클립보드 텍스트를 식으로 붙여넣기 (숫자로 정제한 뒤 식 전체를 대체)
  const factory CalculatorEvent.paste(String text) = Paste;
}
