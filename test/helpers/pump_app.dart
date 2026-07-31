// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    // Calculator is portrait-only; default test surface (800×600) triggers
    // overflow because AspectRatio(1) buttons become 185px tall × 5 rows.
    view.physicalSize = const Size(1170, 2532); // 390×844 logical at 3.0 dpr
    view.devicePixelRatio = 3.0;
    addTearDown(view.resetPhysicalSize);
    addTearDown(view.resetDevicePixelRatio);

    return pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ko'), Locale('en')],
        home: widget,
      ),
    );
  }
}
