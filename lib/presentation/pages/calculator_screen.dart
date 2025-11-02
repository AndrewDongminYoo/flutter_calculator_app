// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:calculator/core/utils/size_utils.dart';
import 'package:calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/data/datasources/calculator_remote_datasource.dart';
import 'package:calculator/data/repositories/calculate_repository_impl.dart';
import 'package:calculator/l10n/l10n.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          elevation: 0,
          title: Text(context.l10n.calculatorAppBarTitle),
          backgroundColor: Colors.black54,
          leading: const Icon(Icons.list_sharp, size: 40, color: Color(0xFFFFA00A)),
        ),
        body: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (BuildContext context, CalculatorState state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    width: context.getWidth(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AutoSizeText(
                      state.equation,
                      maxLines: 1,
                      minFontSize: 20,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontFamily: 'SFProDisplay',
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    width: context.getWidth(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AutoSizeText(
                      state.result,
                      maxLines: 1,
                      minFontSize: 30,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                        fontSize: 80,
                      ),
                    ),
                  ),
                  Row(
                    spacing: 10,
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
                  const SizedBox(height: 10),
                  Row(
                    spacing: 10,
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
                  const SizedBox(height: 10),
                  Row(
                    spacing: 10,
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
                  const SizedBox(height: 10),
                  Row(
                    spacing: 10,
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
                  const SizedBox(height: 10),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        button: ButtonType.empty,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
