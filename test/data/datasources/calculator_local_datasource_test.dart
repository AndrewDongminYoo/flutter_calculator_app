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
        expect(() => datasource.calculate('3+5a'), throwsA(isA<UnsupportedError>()));
      });

      test('should return Infinity for division by zero', () {
        final result = datasource.calculate('3/0');
        expect(result, equals(double.infinity));
      });

      test('should throw UnsupportedError for unsupported operators', () {
        expect(() => datasource.calculate('3%2'), throwsA(isA<UnsupportedError>()));
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
        expect(() => datasource.tokenize('2+3a'), throwsA(isA<UnsupportedError>()));
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
  });
}
