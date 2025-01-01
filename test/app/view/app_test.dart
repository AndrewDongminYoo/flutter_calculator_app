// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/app/app.dart';
import 'package:calculator/features/calculator/presentation/pages/calculator_screen.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CalculatorScreen), findsOneWidget);
    });
  });
}
