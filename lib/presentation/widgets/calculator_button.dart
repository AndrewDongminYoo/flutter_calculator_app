// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:calculator/gen/assets.gen.dart';
import 'package:calculator/gen/fonts.gen.dart';
import 'package:calculator/presentation/enums/button_type.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.button,
    required this.buttonColor,
    required this.buttonPressed,
  });

  final ButtonType button;
  final Color buttonColor;
  final ValueSetter<String> buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          onPressed: () {
            buttonPressed(button.text);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            maximumSize: const Size.square(90),
            minimumSize: const Size.square(80),
            backgroundColor: buttonColor,
            disabledBackgroundColor: buttonColor,
            elevation: 0,
            padding: EdgeInsets.zero,
          ),
          child: switch (button) {
            .delete => Assets.svgs.delete.svg(
              colorFilter: const .mode(Colors.white, .srcIn),
              semanticsLabel: button.name,
              width: 40,
              height: 40,
            ),
            .calculator => Assets.svgs.calculator.svg(
              colorFilter: const .mode(Colors.white, .srcIn),
              semanticsLabel: button.name,
              width: 40,
              height: 40,
            ),
            _ => Text(
              button.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: FontFamily.sFProDisplay,
                fontSize: button.text.length > 1 ? 28 : 42,
                fontWeight: FontWeight.w500,
              ),
            ),
          },
        ),
      ),
    );
  }
}
