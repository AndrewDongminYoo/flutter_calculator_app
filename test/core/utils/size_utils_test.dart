// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/core/utils/size_utils.dart';
import '../../helpers/helpers.dart';

void main() {
  group('ContextSize extension tests', () {
    testWidgets('getWidth returns correct screen width', (tester) async {
      await tester.pumpApp(
        Builder(
          builder: (BuildContext context) {
            expect(context.getWidth(), 800.0);
            return const Scaffold();
          },
        ),
      );
    });

    testWidgets('getHeight returns correct screen height', (tester) async {
      await tester.pumpApp(
        Builder(
          builder: (BuildContext context) {
            expect(context.getHeight(), 600.0);
            return const Scaffold();
          },
        ),
      );
    });

    testWidgets('getBottom returns correct bottom inset when keyboard is shown', (tester) async {
      const keyboardHeight = 300.0;
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(viewInsets: EdgeInsets.only(bottom: keyboardHeight)),
          child: MaterialApp(
            home: Builder(
              builder: (BuildContext context) {
                expect(context.getBottom(), keyboardHeight);
                return const Scaffold();
              },
            ),
          ),
        ),
      );
    });

    testWidgets('getBottom returns zero when keyboard is hidden', (tester) async {
      await tester.pumpApp(
        Builder(
          builder: (BuildContext context) {
            expect(context.getBottom(), 0.0);
            return const Scaffold();
          },
        ),
      );
    });
  });
}
