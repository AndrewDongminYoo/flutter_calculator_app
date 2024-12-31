// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/features/counter/counter.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, equals(0));
    });

    blocTest<CounterCubit, int>(
      'emits [1] when increment is called',
      build: CounterCubit.new,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => <Matcher>[equals(1)],
    );

    blocTest<CounterCubit, int>(
      'emits [-1] when decrement is called',
      build: CounterCubit.new,
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () => <Matcher>[equals(-1)],
    );
  });
}
