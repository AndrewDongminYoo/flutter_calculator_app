// 🎯 Dart imports:
import 'dart:ui';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/app/app.dart';
import 'package:calculator/presentation/pages/calculator_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (WidgetTester tester) async {
      // Calculator is portrait-only; default test surface (800×600) triggers
      // overflow because AspectRatio(1) buttons become 185px tall × 5 rows.
      tester.view.physicalSize = const Size(1170, 2532); // 390×844 logical at 3.0 dpr
      tester.view.devicePixelRatio = 3.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const App());
      expect(find.byType(CalculatorScreen), findsOneWidget);
    });
  });
}
