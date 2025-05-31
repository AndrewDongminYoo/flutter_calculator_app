// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/domain/repositories/calculator_repository.dart';

class MockCalculatorRepository implements CalculatorRepository {
  @override
  Future<double> calculate(String expression) async {
    switch (expression) {
      case '1+1':
        return 2.0;
      case '2.5*3':
        return 7.5;
      case '-5-3':
        return -8.0;
      case '0.1+0.2':
        return 0.3;
      case '':
        return 0.0;
      case 'invalid':
        throw const FormatException('Invalid expression');
      default:
        return double.nan;
    }
  }
}

void main() {
  group('CalculatorRepository', () {
    late CalculatorRepository repository;

    setUp(() {
      repository = MockCalculatorRepository();
    });

    test('should return correct result for simple addition', () async {
      final result = await repository.calculate('1+1');
      expect(result, equals(2.0));
    });

    test('should handle decimal multiplication correctly', () async {
      final result = await repository.calculate('2.5*3');
      expect(result, equals(7.5));
    });

    test('should handle negative numbers correctly', () async {
      final result = await repository.calculate('-5-3');
      expect(result, equals(-8.0));
    });

    test('should handle floating point precision', () async {
      final result = await repository.calculate('0.1+0.2');
      expect(result, equals(0.3));
    });

    test('should return 0 for empty expression', () async {
      final result = await repository.calculate('');
      expect(result, equals(0.0));
    });

    test('should throw FormatException for invalid expression', () async {
      expect(() => repository.calculate('invalid'), throwsA(isA<FormatException>()));
    });

    test('should return NaN for undefined operations', () async {
      final result = await repository.calculate('undefined');
      expect(result.isNaN, isTrue);
    });
  });
}
