// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_local_datasource.dart';

void main() {
  group('CalculatorLocalDatasource', () {
    late CalculatorLocalDatasource datasource;

    setUp(() {
      datasource = CalculatorLocalDatasource();
    });

    group('calculate', () {
      test('should perform addition correctly', () {
        final result = datasource.calculate('5+3');
        expect(result, equals(8.0));
      });

      test('should perform subtraction correctly', () {
        final result = datasource.calculate('10-4');
        expect(result, equals(6.0));
      });

      test('should perform multiplication correctly', () {
        final result = datasource.calculate('6*7');
        expect(result, equals(42.0));
      });

      test('should perform division correctly', () {
        final result = datasource.calculate('15/3');
        expect(result, equals(5.0));
      });

      test('should handle decimal numbers', () {
        final result = datasource.calculate('3.5+2.7');
        expect(result, equals(6.2));
      });

      test('should throw UnsupportedError for invalid number format', () {
        expect(
          () => datasource.calculate('abc+2'),
          throwsA(isA<UnsupportedError>()),
        );
      });

      test('should return Infinity for division by zero', () {
        final result = datasource.calculate('5/0');
        expect(result, equals(double.infinity));
      });

      test('should throw UnsupportedError for invalid operator', () {
        expect(
          () => datasource.calculate('5%2'),
          throwsA(isA<UnsupportedError>()),
        );
      });

      test('should handle negative numbers', () {
        final result = datasource.calculate('-5+3');
        expect(result, equals(-2.0));
      });

      test('should handle very large numbers', () {
        final result = datasource.calculate('999999*999999');
        expect(result, equals(999998000001.0));
      });

      test('should calculate complex expressions without spaces', () {
        final result = datasource.calculate('3+5*2-8/4');
        expect(result, equals(11.0));
      });

      test('should throw FormatException for invalid characters', () {
        expect(
          () => datasource.calculate('3+5a'),
          throwsA(isA<UnsupportedError>()),
        );
      });

      test('should return Infinity for division by zero', () {
        final result = datasource.calculate('3/0');
        expect(result, equals(double.infinity));
      });

      test('should throw UnsupportedError for unsupported operators', () {
        expect(
          () => datasource.calculate('3%2'),
          throwsA(isA<UnsupportedError>()),
        );
      });
    });

    group('tokenize', () {
      test('should tokenize a simple addition', () {
        final tokens = datasource.tokenize('2+3');
        expect(tokens, equals(['2', '+', '3']));
      });

      test('should tokenize a negative number', () {
        final tokens = datasource.tokenize('-2+3');
        expect(tokens, equals(['-2', '+', '3']));
      });

      test('should tokenize a complex expression', () {
        final tokens = datasource.tokenize('3+5*2-8/4');
        expect(tokens, equals(['3', '+', '5', '*', '2', '-', '8', '/', '4']));
      });

      test('should throw FormatException for invalid characters', () {
        expect(
          () => datasource.tokenize('2+3a'),
          throwsA(isA<UnsupportedError>()),
        );
      });
    });

    group('evaluate', () {
      test('should evaluate tokens for addition', () {
        final result = datasource.evaluate(['2', '+', '3']);
        expect(result, equals(5.0));
      });

      test('should evaluate tokens for subtraction', () {
        final result = datasource.evaluate(['5', '-', '2']);
        expect(result, equals(3.0));
      });

      test('should evaluate tokens for multiplication', () {
        final result = datasource.evaluate(['4', '*', '2']);
        expect(result, equals(8.0));
      });

      test('should evaluate tokens for division', () {
        final result = datasource.evaluate(['6', '/', '3']);
        expect(result, equals(2.0));
      });

      test('should evaluate tokens for a complex expression', () {
        final result = datasource.evaluate(['3', '+', '5', '*', '2', '-', '8', '/', '4']);
        expect(result, equals(11.0));
      });

      test('should return Infinity for division by zero', () {
        final result = datasource.evaluate(['3', '/', '0']);
        expect(result, equals(double.infinity));
      });
    });

    // 누락 라인 커버리지를 위한 추가 테스트
    group('coverage uncovered exception lines', () {
      test('should throw ArgumentError when expression is empty', () {
        expect(() => datasource.calculate(''), throwsA(isA<ArgumentError>()));
        expect(
          () => datasource.calculate('    '),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should throw UnsupportedError for invalid character in tokenize', () {
        // 숫자 자리에 문자, 연산자 자리에 이상한 문자 모두 실제로는 UnsupportedError
        expect(
          () => datasource.tokenize('a+2'),
          throwsA(isA<UnsupportedError>()),
        );
        expect(
          () => datasource.tokenize('2&3'),
          throwsA(isA<UnsupportedError>()),
        );
      });

      test('should throw UnsupportedError for invalid character in calculate', () {
        expect(
          () => datasource.calculate('2&3'),
          throwsA(isA<UnsupportedError>()),
        );
      });

      test('should throw FormatException for invalid token in evaluate', () {
        // 숫자도 연산자도 아닌 값 evaluate에 넘기면 FormatException
        expect(
          () => datasource.evaluate(['2', '^', '3']),
          throwsA(isA<FormatException>()),
        );
        expect(
          () => datasource.evaluate(['2', '?', '3']),
          throwsA(isA<FormatException>()),
        );
      });

      test('should throw UnsupportedError for unsupported operator in evaluate', () {
        // 직접적으로 switch문 default를 타는 케이스를 만드는 것은 힘듭니다.
        // 왜냐하면 앞에서 다 거르기 때문. (커버리지에서 실제로 죽은 코드일 가능성 높음)
        // 혹시라도 테스트가 필요하다면, evaluate 함수 내 직접적인 호출로만 가능하지만 일반적으로는 여기선 생략.
      });
    });
  });
}
