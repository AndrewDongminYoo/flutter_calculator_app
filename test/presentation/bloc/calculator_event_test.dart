// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/presentation/bloc/calculator_bloc.dart';

void main() {
  group('CalculatorEvent', () {
    test('Clear event should be created', () {
      const event = CalculatorEvent.clear();
      expect(event, isA<Clear>());
    });

    test('Delete event should be created', () {
      const event = CalculatorEvent.delete();
      expect(event, isA<Delete>());
    });

    test('FlipSign event should be created', () {
      const event = CalculatorEvent.flipSign();
      expect(event, isA<FlipSign>());
    });

    test('Input event should be created with numeric value', () {
      const event = CalculatorEvent.input('5');
      expect(event, isA<Input>());
      expect((event as Input).input, equals('5'));
    });

    test('Input event should be created with operator', () {
      const event = CalculatorEvent.input('+');
      expect(event, isA<Input>());
      expect((event as Input).input, equals('+'));
    });

    test('Input event should be created with decimal point', () {
      const event = CalculatorEvent.input('.');
      expect(event, isA<Input>());
      expect((event as Input).input, equals('.'));
    });

    test('Evaluate event should be created', () {
      const event = CalculatorEvent.evaluate();
      expect(event, isA<Evaluate>());
    });
  });
}
