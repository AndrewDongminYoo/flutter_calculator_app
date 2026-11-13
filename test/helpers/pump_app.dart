// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

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
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('ko'), Locale('en')],
        home: widget,
      ),
    );
  }
}
