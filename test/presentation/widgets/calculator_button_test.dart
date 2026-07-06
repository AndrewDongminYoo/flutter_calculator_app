// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/presentation/enums/button_type.dart';
import 'package:calculator/presentation/widgets/calculator_button.dart';
import '../../helpers/helpers.dart';

void main() {
  group('CalculatorButton', () {
    late ValueSetter<String> onPressed;

    setUp(() {
      onPressed = (String value) {};
    });

    testWidgets('renders button with correct text', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: Column(
            children: [
              CalculatorButton(
                button: ButtonType.zero,
                buttonColor: Colors.grey,
                buttonPressed: onPressed,
              ),
            ],
          ),
        ),
      );

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('calls buttonPressed with correct value when tapped', (WidgetTester tester) async {
      String? pressedValue;

      await tester.pumpApp(
        Scaffold(
          body: Column(
            children: [
              CalculatorButton(
                button: ButtonType.one,
                buttonColor: Colors.grey,
                buttonPressed: (value) => pressedValue = value,
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(pressedValue, equals('1'));
    });

    testWidgets('applies correct font size for single character', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: Column(
            children: [
              CalculatorButton(
                button: ButtonType.five,
                buttonColor: Colors.grey,
                buttonPressed: onPressed,
              ),
            ],
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style?.fontSize, equals(36));
    });

    testWidgets('applies correct font size for multiple characters', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: Column(
            children: [
              CalculatorButton(
                button: ButtonType.clear,
                buttonColor: Colors.grey,
                buttonPressed: onPressed,
              ),
            ],
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style?.fontSize, equals(23));
    });

    testWidgets('has correct button color', (WidgetTester tester) async {
      const Color testColor = Colors.blue;

      await tester.pumpApp(
        Scaffold(
          body: Column(
            children: [
              CalculatorButton(
                button: ButtonType.zero,
                buttonColor: testColor,
                buttonPressed: onPressed,
              ),
            ],
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final style = button.style;
      final backgroundColor = style?.backgroundColor?.resolve({});
      expect(backgroundColor, equals(testColor));
    });

    testWidgets('uses a circle shape by default', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: Column(
            children: [
              CalculatorButton(
                button: ButtonType.zero,
                buttonColor: Colors.grey,
                buttonPressed: onPressed,
              ),
            ],
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.shape?.resolve({}), isA<CircleBorder>());
    });

    testWidgets('uses a stadium shape when wide', (WidgetTester tester) async {
      await tester.pumpApp(
        Scaffold(
          body: Column(
            children: [
              CalculatorButton(
                button: ButtonType.zero,
                buttonColor: Colors.grey,
                buttonPressed: onPressed,
                wide: true,
              ),
            ],
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.shape?.resolve({}), isA<StadiumBorder>());
    });
  });
}
