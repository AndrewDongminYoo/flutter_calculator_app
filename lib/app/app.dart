// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// 🌎 Project imports:
import 'package:calculator/gen/fonts.gen.dart';
import 'package:calculator/presentation/pages/calculator_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: FontFamily.sFProDisplay,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // 앱 자체 문구는 글리프와 숫자뿐이라 ARB가 없다. 델리게이트는 복사·붙여넣기 같은
      // 시스템 제공 라벨을 기기 로케일에 맞춰 표시하기 위해 등록한다.
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko'), Locale('en')],
      home: const CalculatorScreen(),
    );
  }
}
