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
    this.isSelected = false,
  });

  final ButtonType button;
  final Color buttonColor;
  final ValueSetter<String> buttonPressed;

  /// iPhone처럼 대기 중인 연산자를 강조한다(흰 배경 + 연산자색 글리프).
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // 선택된 연산자는 배경/전경 색을 반전한다.
    final backgroundColor = isSelected ? Colors.white : buttonColor;
    final foregroundColor = isSelected ? buttonColor : Colors.white;

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
            backgroundColor: backgroundColor,
            disabledBackgroundColor: backgroundColor,
            elevation: 0,
            padding: EdgeInsets.zero,
          ),
          child: switch (button) {
            .delete => Assets.svgs.delete.svg(
              colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
              semanticsLabel: button.name,
              width: 40,
              height: 40,
            ),
            .calculator => Assets.svgs.calculator.svg(
              colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
              semanticsLabel: button.name,
              width: 40,
              height: 40,
            ),
            _ => Text(
              button.text,
              style: TextStyle(
                color: foregroundColor,
                fontFamily: FontFamily.sFProDisplay,
                fontSize: button.text.length > 1 ? 23 : 36,
                fontWeight: FontWeight.w500,
              ),
            ),
          },
        ),
      ),
    );
  }
}
