// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import 'package:calculator/domain/repositories/calculator_repository.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';
part 'calculator_bloc.freezed.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc({required CalculatorRepository repository})
    : _repository = repository,
      super(const CalculatorState()) {
    on<Clear>(_onClear);
    on<Delete>(_onDelete);
    on<FlipSign>(_onFlipSign);
    on<Input>(_onInput);
    on<Evaluate>(_onEvaluate);
    on<Paste>(_onPaste);
  }

  final CalculatorRepository _repository;

  void _onClear(Clear event, Emitter<CalculatorState> emit) {
    // 모든 값을 초기화
    emit(state.copyWith(equation: '0', result: '0', expression: ''));
  }

  void _onDelete(Delete event, Emitter<CalculatorState> emit) {
    // 마지막 문자열 제거
    final currentEquation = state.equation;
    if (currentEquation.isNotEmpty && currentEquation != '0') {
      final newEquation = currentEquation.length > 1 ? currentEquation.substring(0, currentEquation.length - 1) : '0';
      // 식이 바뀌었으므로 직전 계산 결과는 더 이상 이 식의 결과가 아니다.
      emit(state.copyWith(equation: newEquation, expression: ''));
    }
  }

  void _onFlipSign(FlipSign event, Emitter<CalculatorState> emit) {
    // +/- 부호 전환: 전체 식이 아니라 말단 피연산자에만 적용한다.
    final currentEquation = state.equation;
    if (currentEquation.isEmpty || currentEquation == '0') {
      return;
    }

    // 식 끝의 숫자(피연산자)를 찾는다.
    final match = RegExp(r'(\d*\.?\d+)$').firstMatch(currentEquation);
    if (match == null) {
      return;
    }

    final start = match.start;
    final number = match.group(0)!;
    final prefix = currentEquation.substring(0, start);

    // 피연산자 바로 앞의 '-'가 (뺄셈이 아닌) 부호인지 판별한다.
    final signedByMinus = start > 0 && currentEquation[start - 1] == '-';
    final minusIsSign = signedByMinus && (start == 1 || '+-×÷*/'.contains(currentEquation[start - 2]));

    if (minusIsSign) {
      // 기존 부호 제거
      emit(state.copyWith(equation: prefix.substring(0, prefix.length - 1) + number, expression: ''));
    } else {
      // 부호 추가
      emit(state.copyWith(equation: '$prefix-$number', expression: ''));
    }
  }

  void _onInput(Input event, Emitter<CalculatorState> emit) {
    // 숫자, 연산자 입력
    final buttonText = event.input;
    final currentEquation = state.equation;

    // 식이 바뀌었으므로 직전 계산 결과는 더 이상 이 식의 결과가 아니다.
    if (currentEquation == '0') {
      // 0인 상태에서 새로 입력 시 해당 값으로 대체
      emit(state.copyWith(equation: buttonText, expression: ''));
    } else {
      emit(state.copyWith(equation: currentEquation + buttonText, expression: ''));
    }
  }

  void _onPaste(Paste event, Emitter<CalculatorState> emit) {
    // 클립보드에는 통화 기호나 천 단위 구분자가 섞여 있을 수 있으므로 숫자 모양만 남긴다.
    final cleaned = event.text.replaceAll(RegExp('[^0-9.-]'), '');
    if (cleaned.isEmpty) {
      return;
    }
    emit(state.copyWith(equation: cleaned, result: '0', expression: ''));
  }

  Future<void> _onEvaluate(Evaluate event, Emitter<CalculatorState> emit) async {
    final expression = state.equation.replaceAll('×', '*').replaceAll('÷', '/');

    try {
      final value = await _repository.calculate(expression);

      // 0으로 나누기 등으로 나온 비유한 값(Infinity/NaN)은 사용자용 에러 라벨로 표시한다.
      if (!value.isFinite) {
        emit(state.copyWith(result: 'Error', expression: expression));
        return;
      }

      // 소수점 이하가 0이면 정수로 표시한다. double.toString() 문자열을 파싱하면 지수 표기(1e-7 등)에서
      // 깨지므로 수치로 판정하고, toStringAsFixed(0)으로 정수 문자열을 만든다(큰 값에서도 오버플로가 없다).
      final result = value == value.roundToDouble() ? value.toStringAsFixed(0) : '$value';

      emit(
        state.copyWith(
          result: result,
          expression: expression,
        ),
      );
    } catch (_) {
      // Dart 예외 타입명을 노출하지 않고 사용자용 에러 라벨을 표시한다.
      emit(state.copyWith(result: 'Error', expression: expression));
    }
  }
}
