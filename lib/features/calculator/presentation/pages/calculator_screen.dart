// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:math_expressions/math_expressions.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/presentation/enums/button_type.dart';
import 'package:calculator/features/calculator/presentation/widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = '0';
  String result = '0';
  String expression = '';

  void buttonPressed(String buttonText) {
    // used to check if the result contains a decimal
    String doesContainDecimal(String result) {
      if (result.contains('.')) {
        final splitDecimal = result.split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          // ignore: parameter_assignments
          return splitDecimal[0];
        }
      }
      return result;
    }

    setState(() {
      if (buttonText == 'AC') {
        equation = '0';
        result = '0';
      } else if (buttonText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (buttonText == '+/-') {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          final p = Parser();
          final exp = p.parse(expression);

          final cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal(result);
          }
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        leading: const Icon(Icons.list_sharp, size: 40, color: Color(0xFFFFA00A)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        equation,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        result.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  button: result != '0' ? ButtonType.clear : ButtonType.delete,
                  buttonColor: const Color(0xFF5C5C60),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.plusMinus,
                  buttonColor: const Color(0xFF5C5C60),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.percent,
                  buttonColor: const Color(0xFF5C5C60),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.division,
                  buttonColor: const Color(0xFFFFA00A),
                  buttonPressed: buttonPressed,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  button: ButtonType.seven,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.eight,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.nine,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.multiple,
                  buttonColor: const Color(0xFFFFA00A),
                  buttonPressed: buttonPressed,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  button: ButtonType.four,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.five,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.six,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.minus,
                  buttonColor: const Color(0xFFFFA00A),
                  buttonPressed: buttonPressed,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  button: ButtonType.one,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.two,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.three,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.plus,
                  buttonColor: const Color(0xFFFFA00A),
                  buttonPressed: buttonPressed,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  button: ButtonType.empty,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.zero,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.dot,
                  buttonColor: const Color(0xFF2B2B2D),
                  buttonPressed: buttonPressed,
                ),
                CalculatorButton(
                  button: ButtonType.result,
                  buttonColor: const Color(0xFFFFA00A),
                  buttonPressed: buttonPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
