enum ButtonType {
  // 1행
  clear('AC'),
  delete('⌫'),
  plusMinus('+/-'),
  percent('%'),

  // 4열
  division('÷'),
  multiple('×'),
  minus('-'),
  plus('+'),
  result('='),

  // 숫자들
  one('1'),
  two('2'),
  three('3'),
  four('4'),
  five('5'),
  six('6'),
  seven('7'),
  eight('8'),
  nine('9'),
  zero('0'),

  // 소수점
  dot('.'),

  // 아무 역할 없는 버튼. 나중에 공학계산기 기능 추가 시 사용.
  calculator('')
  ;

  const ButtonType(this.text);
  final String text;
}
