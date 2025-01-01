// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/domain/entities/calculation_result.dart';

void main() {
  group('CalculationResult', () {
    test('should create entity with result value', () {
      final result = CalculationResult(result: 42.5);
      expect(result.result, 42.5);
    });

    test('should create entity from json', () {
      final json = {'result': 123.45};
      final result = CalculationResult.fromJson(json);
      expect(result.result, 123.45);
    });

    test('should handle integer values in json', () {
      final json = {'result': 100};
      final result = CalculationResult.fromJson(json);
      expect(result.result, 100.0);
    });

    test('should handle large numbers', () {
      final result = CalculationResult(result: 999999.999);
      expect(result.result, 999999.999);
    });

    test('should handle negative numbers', () {
      final result = CalculationResult(result: -42.5);
      expect(result.result, -42.5);
    });

    test('should handle zero', () {
      final result = CalculationResult(result: 0);
      expect(result.result, 0.0);
    });

    test('should compare equal results', () {
      final result1 = CalculationResult(result: 50.5);
      final result2 = CalculationResult(result: 50.5);
      expect(result1, equals(result2));
    });

    test('should not be equal with different results', () {
      final result1 = CalculationResult(result: 50.5);
      final result2 = CalculationResult(result: 50.6);
      expect(result1, isNot(equals(result2)));
    });
  });
  test('should handle very small decimal numbers', () {
    final result = CalculationResult(result: 0.0000001);
    expect(result.result, 0.0000001);
  });

  test('should handle maximum double value', () {
    final result = CalculationResult(result: double.maxFinite);
    expect(result.result, double.maxFinite);
  });

  test('should handle minimum double value', () {
    final result = CalculationResult(result: double.minPositive);
    expect(result.result, double.minPositive);
  });

  test('should convert to json correctly', () {
    final result = CalculationResult(result: 123.456);
    final json = result.toJson();
    expect(json, {'result': 123.456});
  });

  test('should handle NaN in fromJson', () {
    final json = {'result': double.nan};
    final result = CalculationResult.fromJson(json);
    expect(result.result.isNaN, true);
  });

  test('should handle infinity in fromJson', () {
    final json = {'result': double.infinity};
    final result = CalculationResult.fromJson(json);
    expect(result.result.isInfinite, true);
    expect(!result.result.isNegative, true);
  });

  test('should handle negative infinity in fromJson', () {
    final json = {'result': double.negativeInfinity};
    final result = CalculationResult.fromJson(json);
    expect(result.result.isInfinite, true);
    expect(result.result.isNegative, true);
  });

  test('should maintain precision in json conversion', () {
    final originalResult = CalculationResult(result: 3.14159265359);
    final json = originalResult.toJson();
    final parsedResult = CalculationResult.fromJson(json);
    expect(parsedResult.result, 3.14159265359);
  });
}
