// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';

void main() {
  group('CalculatorLocalDatasource', () {
    late CalculatorLocalDatasource datasource;

    setUp(() {
      datasource = CalculatorLocalDatasource();
    });

    test('should perform addition correctly', () async {
      final result = await datasource.calculate('5+3');
      expect(result, equals(8.0));
    });

    test('should perform subtraction correctly', () async {
      final result = await datasource.calculate('10-4');
      expect(result, equals(6.0));
    });

    test('should perform multiplication correctly', () async {
      final result = await datasource.calculate('6*7');
      expect(result, equals(42.0));
    });

    test('should perform division correctly', () async {
      final result = await datasource.calculate('15/3');
      expect(result, equals(5.0));
    });

    test('should handle decimal numbers', () async {
      final result = await datasource.calculate('3.5+2.7');
      expect(result, equals(6.2));
    });

    test('should throw FormatException for invalid number format', () async {
      expect(
        () => datasource.calculate('abc+2'),
        throwsA(isA<FormatException>()),
      );
    });

    test('should throw ArgumentError for division by zero', () async {
      expect(
        () => datasource.calculate('5/0'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw UnsupportedError for invalid operator', () async {
      expect(
        () => datasource.calculate('5%2'),
        throwsA(isA<UnsupportedError>()),
      );
    });

    test('should handle negative numbers', () async {
      final result = await datasource.calculate('-5+3');
      expect(result, equals(-2.0));
    });

    test('should handle very large numbers', () async {
      final result = await datasource.calculate('999999*999999');
      expect(result, equals(999998000001.0));
    });
  });
}
