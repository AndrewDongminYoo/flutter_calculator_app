// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/presentation/enums/button_type.dart';

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
        child: SizedBox.square(
          dimension: 80,
          child: ElevatedButton(
            onPressed: () {
              buttonPressed(button.text);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: buttonColor,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            ),
            child: Text(
              button.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SFProDisplay',
                fontSize: button.text.length > 1 ? 23 : 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
