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
    return SizedBox(
      width: 75,
      height: 75,
      child: ElevatedButton(
        onPressed: () {
          buttonPressed(button.text);
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(75)),
          ),
          backgroundColor: buttonColor,
        ),
        child: Text(
          button.text,
          style: const TextStyle(fontSize: 27, color: Colors.white, letterSpacing: -4),
        ),
      ),
    );
  }
}
