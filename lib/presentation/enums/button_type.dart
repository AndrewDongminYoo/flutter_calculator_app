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
  dot('.');

  const ButtonType(this.text);
  final String text;
}
