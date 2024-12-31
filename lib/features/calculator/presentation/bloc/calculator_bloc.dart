// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_expressions/math_expressions.dart';

// 🌎 Project imports:
part 'calculator_event.dart';
part 'calculator_state.dart';
part 'calculator_bloc.freezed.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<Clear>(_onClear);
    on<Delete>(_onDelete);
    on<FlipSign>(_onFlipSign);
    on<Input>(_onInput);
    on<Evaluate>(_onEvaluate);
  }

  void _onClear(Clear event, Emitter<CalculatorState> emit) {
    // 모든 값을 초기화
    emit(state.copyWith(equation: '0', result: '0', expression: ''));
  }

  void _onDelete(Delete event, Emitter<CalculatorState> emit) {
    // 마지막 문자열 제거
    final currentEquation = state.equation;
    if (currentEquation.isNotEmpty && currentEquation != '0') {
      final newEquation = currentEquation.length > 1 ? currentEquation.substring(0, currentEquation.length - 1) : '0';
      emit(state.copyWith(equation: newEquation));
    }
  }

  void _onFlipSign(FlipSign event, Emitter<CalculatorState> emit) {
    // +/- 부호 전환
    final currentEquation = state.equation;
    if (currentEquation.isEmpty || currentEquation == '0') {
      return;
    }
    if (currentEquation.startsWith('-')) {
      emit(state.copyWith(equation: currentEquation.substring(1)));
    } else {
      emit(state.copyWith(equation: '-$currentEquation'));
    }
  }

  void _onInput(Input event, Emitter<CalculatorState> emit) {
    // 숫자, 연산자 입력
    final buttonText = event.input;
    final currentEquation = state.equation;

    if (currentEquation == '0') {
      // 0인 상태에서 새로 입력 시 해당 값으로 대체
      emit(state.copyWith(equation: buttonText));
    } else {
      emit(state.copyWith(equation: currentEquation + buttonText));
    }
  }

  void _onEvaluate(Evaluate event, Emitter<CalculatorState> emit) {
    final expression = state.equation.replaceAll('×', '*').replaceAll('÷', '/').replaceAll('%', '%');

    try {
      final p = Parser();
      final exp = p.parse(expression);
      final cm = ContextModel();

      var result = '${exp.evaluate(EvaluationType.REAL, cm)}';

      // 소수점 제거 로직(소수점 이하가 0이면 정수로 표시)
      if (result.contains('.')) {
        final splitDecimal = result.split('.');
        if (int.parse(splitDecimal[1]) == 0) {
          result = splitDecimal[0];
        }
      }

      emit(
        state.copyWith(
          result: result,
          expression: expression,
        ),
      );
    } catch (e) {
      emit(state.copyWith(result: e.runtimeType.toString(), expression: expression));
    }
  }
}
