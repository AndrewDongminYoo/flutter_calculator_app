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
    return SizedBox.square(
      dimension: 80,
      child: Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: ElevatedButton(
            onPressed: () {
              buttonPressed(button.text);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: buttonColor,
            ),
            child: Text(
              button.text,
              style: TextStyle(
                fontSize: button.text.length > 1 ? 22 : 34,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
