part of 'calculator_bloc.dart';

@freezed
class CalculatorEvent with _$CalculatorEvent {
  // 모든 값 초기화
  const factory clear() = Clear;

  // 마지막 문자 하나 지우기
  const factory delete() = Delete;

  // 부호 전환 (+/-)
  const factory flipSign() = FlipSign;

  // 버튼(%, ÷, ×, -, +, 숫자, .) 입력
  const factory input(String input) = Input;

  // = 입력 (수식 계산)
  const factory evaluate() = Evaluate;

  // 클립보드 텍스트를 식으로 붙여넣기 (숫자로 정제한 뒤 식 전체를 대체)
  const factory paste(String text) = Paste;
}
