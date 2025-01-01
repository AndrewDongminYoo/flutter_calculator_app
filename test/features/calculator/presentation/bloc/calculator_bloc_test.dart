// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/presentation/bloc/calculator_bloc.dart';

void main() {
  group('CalculatorBloc', () {
    late CalculatorBloc calculatorBloc;

    setUp(() {
      calculatorBloc = CalculatorBloc();
    });

    tearDown(() async {
      await calculatorBloc.close();
    });

    test('initial state is correct', () {
      expect(calculatorBloc.state.equation, equals('0'));
      expect(calculatorBloc.state.result, equals('0'));
      expect(calculatorBloc.state.expression, equals(''));
    });

    blocTest<CalculatorBloc, CalculatorState>(
      'emits correct state when Clear event is added',
      build: () => calculatorBloc,
      act: (bloc) => bloc.add(const Clear()),
      expect: () => [
        const CalculatorState(),
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits correct state when Delete event is added with non-empty equation',
      build: () => calculatorBloc,
      seed: () => const CalculatorState(equation: '123'),
      act: (bloc) => bloc.add(const Delete()),
      expect: () => [
        const CalculatorState(equation: '12'),
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits correct state when Delete event is added with single digit',
      build: () => calculatorBloc,
      seed: () => const CalculatorState(equation: '5'),
      act: (bloc) => bloc.add(const Delete()),
      expect: () => [
        const CalculatorState(),
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits correct state when FlipSign event is added to positive number',
      build: () => calculatorBloc,
      seed: () => const CalculatorState(equation: '42'),
      act: (bloc) => bloc.add(const FlipSign()),
      expect: () => [
        const CalculatorState(equation: '-42'),
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits correct state when Input event is added to initial state',
      build: () => calculatorBloc,
      act: (bloc) => bloc.add(const Input('5')),
      expect: () => [
        const CalculatorState(equation: '5'),
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits correct state for complex calculation',
      build: () => calculatorBloc,
      seed: () => const CalculatorState(equation: '2×3+4'),
      act: (bloc) => bloc.add(const Evaluate()),
      expect: () => [
        const CalculatorState(
          equation: '2×3+4',
          expression: '2*3+4',
          result: '10',
        ),
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'handles decimal calculations correctly',
      build: () => calculatorBloc,
      seed: () => const CalculatorState(equation: '10÷3'),
      act: (bloc) => bloc.add(const Evaluate()),
      expect: () => [
        predicate<CalculatorState>(
          (state) =>
              state.equation == '10÷3' &&
              state.expression == '10/3' &&
              double.parse(state.result) - 3.3333333333333335 < 0.000001,
        ),
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'handles invalid expressions gracefully',
      build: () => calculatorBloc,
      seed: () => const CalculatorState(equation: '1÷0'),
      act: (bloc) => bloc.add(const Evaluate()),
      expect: () => [
        predicate<CalculatorState>(
          (state) =>
              state.equation == '1÷0' && state.expression == '1/0' && double.parse(state.result) == double.infinity,
        ),
      ],
    );
  });
}
