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

    // iOS 스타일 상태바 설정 (하얀색 아이콘)
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (BuildContext context, CalculatorState state) {
          return SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상단 메뉴 아이콘 (AppBar 대신)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.list_bullet,
                        size: 36,
                        color: Color(0xFFFFA00A),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                // 계산식 및 결과 표시 영역
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      width: context.getWidth(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AutoSizeText(
                        state.equation,
                        maxLines: 1,
                        minFontSize: 24,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontFamily: FontFamily.sFProDisplay,
                          fontSize: 48,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      alignment: Alignment.bottomRight,
                      width: context.getWidth(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AutoSizeText(
                        state.result,
                        maxLines: 1,
                        minFontSize: 40,
                        textAlign: TextAlign.right,
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
                // 버튼 영역
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            button: state.result != '0' ? ButtonType.clear : ButtonType.delete,
                            buttonColor: const Color(0xFF5C5C60),
                            buttonPressed: (String val) {
                              if (val == 'AC') {
                                bloc.add(const CalculatorEvent.clear());
                              } else {
                                bloc.add(const CalculatorEvent.delete());
                              }
                            },
                          ),
                          CalculatorButton(
                            button: ButtonType.plusMinus,
                            buttonColor: const Color(0xFF5C5C60),
                            buttonPressed: (_) => bloc.add(const CalculatorEvent.flipSign()),
                          ),
                          CalculatorButton(
                            button: ButtonType.percent,
                            buttonColor: const Color(0xFF5C5C60),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.division,
                            buttonColor: const Color(0xFFFFA00A),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            button: ButtonType.seven,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.eight,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.nine,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.multiple,
                            buttonColor: const Color(0xFFFFA00A),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            button: ButtonType.four,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.five,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.six,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.minus,
                            buttonColor: const Color(0xFFFFA00A),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            button: ButtonType.one,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.two,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.three,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.plus,
                            buttonColor: const Color(0xFFFFA00A),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            button: ButtonType.calculator,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) {},
                          ),
                          CalculatorButton(
                            button: ButtonType.zero,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.dot,
                            buttonColor: const Color(0xFF2B2B2D),
                            buttonPressed: (String val) => bloc.add(CalculatorEvent.input(val)),
                          ),
                          CalculatorButton(
                            button: ButtonType.result,
                            buttonColor: const Color(0xFFFFA00A),
                            buttonPressed: (_) => bloc.add(const CalculatorEvent.evaluate()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
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
