// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/presentation/bloc/calculator_bloc.dart';

void main() {
  group('CalculatorState', () {
    test('should create with default values', () {
      const state = CalculatorState();
      expect(state.equation, equals('0'));
      expect(state.result, equals('0'));
      expect(state.expression, equals(''));
    });

    test('should create with custom values', () {
      const state = CalculatorState(
        equation: '2+2',
        result: '4',
        expression: '2+2',
      );
      expect(state.equation, equals('2+2'));
      expect(state.result, equals('4'));
      expect(state.expression, equals('2+2'));
    });

    test('should compare equal states', () {
      const state1 = CalculatorState(
        equation: '3×4',
        result: '12',
        expression: '3*4',
      );
      const state2 = CalculatorState(
        equation: '3×4',
        result: '12',
        expression: '3*4',
      );
      expect(state1, equals(state2));
    });

    test('should not be equal with different equations', () {
      const state1 = CalculatorState(equation: '1+1');
      const state2 = CalculatorState(equation: '2+2');
      expect(state1, isNot(equals(state2)));
    });

    test('should not be equal with different results', () {
      const state1 = CalculatorState(result: '2');
      const state2 = CalculatorState(result: '3');
      expect(state1, isNot(equals(state2)));
    });

    test('should not be equal with different expressions', () {
      const state1 = CalculatorState(expression: '1+1');
      const state2 = CalculatorState(expression: '2+2');
      expect(state1, isNot(equals(state2)));
    });

    test('should handle empty values', () {
      const state = CalculatorState(
        equation: '',
        result: '',
      );
      expect(state.equation, equals(''));
      expect(state.result, equals(''));
      expect(state.expression, equals(''));
    });

    test('should handle special characters', () {
      const state = CalculatorState(
        equation: '2÷3×4',
        result: '2.6666',
        expression: '2/3*4',
      );
      expect(state.equation, equals('2÷3×4'));
      expect(state.result, equals('2.6666'));
      expect(state.expression, equals('2/3*4'));
    });
  });
}
