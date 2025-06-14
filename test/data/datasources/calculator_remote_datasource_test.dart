// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_remote_datasource.dart';

void main() {
  late CalculatorRemoteDatasource datasource;

  setUp(() {
    datasource = CalculatorRemoteDatasource();
  });

  group('calculate', () {
    test('should return correct result for basic addition', () {
      final result = datasource.calculate('2+2');
      expect(result, equals(4.0));
    });

    test('should return correct result for complex expression', () {
      final result = datasource.calculate('(5*3)+(10/2)');
      expect(result, equals(20.0));
    });

    test('should handle decimal numbers correctly', () {
      final result = datasource.calculate('1.5 + 2.7');
      expect(result, equals(4.2));
    });

    test('should handle negative numbers correctly', () {
      final result = datasource.calculate('-5 + 3');
      expect(result, equals(-2.0));
    });

    test('should throw exception for invalid expression', () {
      expect(
        () async => datasource.calculate('2//2'),
        throwsException,
      );
    });

    test('should handle parentheses correctly', () {
      final result = datasource.calculate('2*(3+4)');
      expect(result, equals(14.0));
    });

    test('should handle exponents correctly', () {
      final result = datasource.calculate('2^3');
      expect(result, equals(8.0));
    });

    test('should return infinity for division by zero', () {
      final result = datasource.calculate('1/0');
      expect(result, double.infinity);
    });
  });
}
