// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:calculator/core/utils/size_utils.dart';
import 'package:calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/data/datasources/calculator_remote_datasource.dart';
import 'package:calculator/data/repositories/calculate_repository_impl.dart';
import 'package:calculator/gen/fonts.gen.dart';
import 'package:calculator/presentation/bloc/calculator_bloc.dart';
import 'package:calculator/presentation/enums/button_type.dart';
import 'package:calculator/presentation/widgets/calculator_button.dart';

/// 식 말단이 산술 연산자로 끝나면 그 연산자 글리프를, 아니면 빈 문자열을 반환한다.
///
/// iPhone처럼 대기 중인 연산자 버튼을 강조하기 위해 사용한다.
String _pendingOperator(String equation) {
  if (equation.isEmpty) {
    return '';
  }
  final last = equation[equation.length - 1];
  return const ['÷', '×', '-', '+'].contains(last) ? last : '';
}

/// 식과 결과를 같은 규격(화면 폭 전체, 오른쪽 아래 정렬, 한 줄 축소)으로 표시한다.
Widget _display(BuildContext context, String value, {required double minFontSize, required TextStyle style}) {
  return Container(
    alignment: Alignment.bottomRight,
    width: context.getWidth(),
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: AutoSizeText(value, maxLines: 1, minFontSize: minFontSize, textAlign: TextAlign.right, style: style),
  );
}

/// 결과 텍스트를 롱탭했을 때 iOS 네이티브 스타일의 복사 메뉴를 표시한다.
///
/// bloc과 로케일은 화면 컨텍스트에서 미리 읽는다. 메뉴는 루트 오버레이(= BlocProvider 바깥)에
/// 삽입되므로 빌더 컨텍스트에서는 둘 다 조회할 수 없다.
void _showCopyMenu(BuildContext context, Offset globalPosition, CalculatorState state) {
  final bloc = context.read<CalculatorBloc>();
  final localizations = CupertinoLocalizations.of(context);
  // 계산된 결과가 있을 때만 복사를 제공하고, 그 외에는 붙여넣기를 제공한다.
  final canCopy = state.hasResult;

  void close() => ContextMenuController.removeAny();

  Future<void> copy() async {
    await Clipboard.setData(ClipboardData(text: state.result));
    close();
  }

  Future<void> paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data?.text case final pasted?) {
      bloc.add(CalculatorEvent.paste(pasted));
    }
    close();
  }

  unawaited(HapticFeedback.mediumImpact());
  ContextMenuController().show(
    context: context,
    contextMenuBuilder: (_) => Stack(
      children: [
        // 메뉴 외부를 탭하면 닫힘
        Positioned.fill(
          child: GestureDetector(onTapDown: (_) => close(), behavior: HitTestBehavior.opaque),
        ),
        CupertinoTextSelectionToolbar(
          anchorAbove: globalPosition - const Offset(0, 8),
          anchorBelow: globalPosition + const Offset(0, 8),
          children: [
            CupertinoTextSelectionToolbarButton(
              onPressed: canCopy ? copy : paste,
              child: Text(canCopy ? localizations.copyButtonLabel : localizations.pasteButtonLabel),
            ),
          ],
        ),
      ],
    ),
  );
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      create: (BuildContext context) {
        return CalculatorBloc(
          repository: CalculatorRepositoryImpl(
            localDatasource: CalculatorLocalDatasource(),
            remoteDatasource: CalculatorRemoteDatasource(),
            connectivity: Connectivity(),
          ),
        );
      },
      child: const CalculatorView(),
    );
  }
}

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalculatorBloc>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (BuildContext context, CalculatorState state) {
          // 대기 중인 연산자(식 말단의 연산자)를 강조 표시에 사용한다.
          final pendingOperator = _pendingOperator(state.equation);
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                // 계산식 및 결과 표시 영역 (키패드 바로 위에 하단 정렬)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _display(
                        context,
                        state.equation,
                        minFontSize: 24,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontFamily: FontFamily.sFProDisplay,
                          fontSize: 48,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onLongPressStart: (details) => _showCopyMenu(context, details.globalPosition, state),
                        child: _display(
                          context,
                          state.result,
                          minFontSize: 40,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: FontFamily.sFProDisplay,
                            fontSize: 96,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                // 버튼 영역: iPhone처럼 4열 그리드에 '0'이 두 칸을 차지하도록
                // unit 크기를 계산해 배치한다.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      const gap = 12.0;
                      // iOS 계산기 팔레트에 맞춘 색상.
                      const digitColor = Color(0xFF333333);
                      const functionColor = Color(0xFFA5A5A5);
                      const operatorColor = Color(0xFFFF9F0A);
                      // 4열 + 3 간격을 제외한 폭을 4등분한 것이 버튼 한 칸(unit)이다.
                      final unit = (constraints.maxWidth - gap * 3) / 4;

                      SizedBox cell(Widget child, {bool wide = false}) {
                        return SizedBox(
                          width: wide ? unit * 2 + gap : unit,
                          height: unit,
                          child: child,
                        );
                      }

                      CalculatorButton digit(ButtonType type) {
                        return CalculatorButton(
                          button: type,
                          buttonColor: digitColor,
                          buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                        );
                      }

                      CalculatorButton operatorButton(ButtonType type) {
                        return CalculatorButton(
                          button: type,
                          buttonColor: operatorColor,
                          isSelected: pendingOperator == type.text,
                          buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                        );
                      }

                      // iOS 함수 키(AC/⌫/±/%)는 밝은 회색 배경에 검정 글리프를 쓴다.
                      CalculatorButton functionButton(ButtonType type, ValueSetter<String> onPressed) {
                        return CalculatorButton(
                          button: type,
                          buttonColor: functionColor,
                          foregroundColor: Colors.black,
                          buttonPressed: onPressed,
                        );
                      }

                      return Column(
                        children: [
                          Row(
                            spacing: gap,
                            children: [
                              cell(
                                functionButton(
                                  // 빈 화면이거나 결과가 있으면 AC(전체 지움), 식을 입력 중이면 ⌫(백스페이스).
                                  (state.hasResult || state.equation == '0') ? ButtonType.clear : ButtonType.delete,
                                  (String val) {
                                    if (val == 'AC') {
                                      bloc.add(const CalculatorEvent.clear());
                                    } else {
                                      bloc.add(const CalculatorEvent.delete());
                                    }
                                  },
                                ),
                              ),
                              cell(
                                functionButton(ButtonType.plusMinus, (_) => bloc.add(const CalculatorEvent.flipSign())),
                              ),
                              cell(
                                functionButton(
                                  ButtonType.percent,
                                  (String val) => bloc.add(CalculatorEvent.input(val)),
                                ),
                              ),
                              cell(operatorButton(ButtonType.division)),
                            ],
                          ),
                          const SizedBox(height: gap),
                          Row(
                            spacing: gap,
                            children: [
                              cell(digit(ButtonType.seven)),
                              cell(digit(ButtonType.eight)),
                              cell(digit(ButtonType.nine)),
                              cell(operatorButton(ButtonType.multiple)),
                            ],
                          ),
                          const SizedBox(height: gap),
                          Row(
                            spacing: gap,
                            children: [
                              cell(digit(ButtonType.four)),
                              cell(digit(ButtonType.five)),
                              cell(digit(ButtonType.six)),
                              cell(operatorButton(ButtonType.minus)),
                            ],
                          ),
                          const SizedBox(height: gap),
                          Row(
                            spacing: gap,
                            children: [
                              cell(digit(ButtonType.one)),
                              cell(digit(ButtonType.two)),
                              cell(digit(ButtonType.three)),
                              cell(operatorButton(ButtonType.plus)),
                            ],
                          ),
                          const SizedBox(height: gap),
                          Row(
                            spacing: gap,
                            children: [
                              cell(
                                CalculatorButton(
                                  button: ButtonType.zero,
                                  buttonColor: digitColor,
                                  wide: true,
                                  // iPhone처럼 '0' 글리프를 첫 칸 중앙(위 숫자 열과 정렬)에 둔다.
                                  contentPadding: EdgeInsets.only(right: unit + gap),
                                  buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                                ),
                                wide: true,
                              ),
                              cell(digit(ButtonType.dot)),
                              cell(
                                CalculatorButton(
                                  button: ButtonType.result,
                                  buttonColor: operatorColor,
                                  buttonPressed: (_) => bloc.add(const CalculatorEvent.evaluate()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
