// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/data/repositories/calculate_repository_impl.dart';
import 'package:calculator/presentation/bloc/calculator_bloc.dart';
import 'package:calculator/presentation/enums/button_type.dart';
import 'package:calculator/presentation/pages/calculator_screen.dart';
import 'package:calculator/presentation/widgets/calculator_button.dart';
import '../../calculator_test.mocks.dart';
import '../../helpers/helpers.dart';

void main() {
  late MockConnectivity mockConnectivity;
  late MockCalculatorLocalDatasource mockLocalDatasource;
  late MockCalculatorRemoteDatasource mockRemoteDatasource;

  setUp(() {
    mockConnectivity = MockConnectivity();
    mockLocalDatasource = MockCalculatorLocalDatasource();
    mockRemoteDatasource = MockCalculatorRemoteDatasource();
  });

  testWidgets('CalculatorScreen creates BlocProvider with correct dependencies', (WidgetTester tester) async {
    await tester.pumpApp(const CalculatorScreen());

    expect(find.byType(BlocProvider<CalculatorBloc>), findsOneWidget);
    expect(find.byType(CalculatorView), findsOneWidget);
  });

  testWidgets('CalculatorScreen initializes repository with correct datasources', (WidgetTester tester) async {
    await tester.pumpApp(
      BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc(
          repository: CalculatorRepositoryImpl(
            localDatasource: mockLocalDatasource,
            remoteDatasource: mockRemoteDatasource,
            connectivity: mockConnectivity,
          ),
        ),
        child: const CalculatorView(),
      ),
    );

    final blocProvider = tester.widget<BlocProvider<CalculatorBloc>>(
      find.byType(BlocProvider<CalculatorBloc>),
    );
    expect(blocProvider, isNotNull);
  });

  testWidgets('CalculatorScreen handles widget tree disposal properly', (WidgetTester tester) async {
    await tester.pumpApp(const CalculatorScreen());
    await tester.pumpApp(const SizedBox());
    expect(find.byType(CalculatorScreen), findsNothing);
  });

  testWidgets('CalculatorScreen buttonPressed triggers correct events', (WidgetTester tester) async {
    await tester.pumpApp(
      BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc(
          repository: CalculatorRepositoryImpl(
            localDatasource: mockLocalDatasource,
            remoteDatasource: mockRemoteDatasource,
            connectivity: mockConnectivity,
          ),
        ),
        child: const CalculatorView(),
      ),
    );

    // [1] 숫자 버튼을 누르고 식에 반영되는지 확인
    await tester.tapButton(ButtonType.one);

    // [2] 연산자 버튼을 누르고 식에 반영되는지 확인
    await tester.tapButton(ButtonType.plus);

    // [3] 또 다른 숫자 버튼 누름
    await tester.tapButton(ButtonType.two);

    // [4] '=' 버튼(결과 버튼) 누름
    await tester.tapButton(ButtonType.result);

    // [5] 결과가 정상적으로 표시되는지 확인
    expect(find.text('3'), findsWidgets); // '결과' 텍스트가 화면에 노출되는지 체크

    // [6] AC(초기화) 버튼도 누르고 결과가 '0'이 되는지 확인
    await tester.tapButton(ButtonType.clear);

    expect(find.text('0'), findsWidgets); // 초기화 후 결과가 0인지 체크
  });

  testWidgets('shows AC (not backspace) on the initial empty screen', (WidgetTester tester) async {
    await tester.pumpApp(
      BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc(
          repository: CalculatorRepositoryImpl(
            localDatasource: mockLocalDatasource,
            remoteDatasource: mockRemoteDatasource,
            connectivity: mockConnectivity,
          ),
        ),
        child: const CalculatorView(),
      ),
    );

    final clearFinder = find.byWidgetPredicate(
      (widget) => widget is CalculatorButton && widget.button == ButtonType.clear,
    );
    final deleteFinder = find.byWidgetPredicate(
      (widget) => widget is CalculatorButton && widget.button == ButtonType.delete,
    );

    expect(clearFinder, findsOneWidget);
    expect(deleteFinder, findsNothing);
  });

  testWidgets('CalculatorScreen buttonPressed for delete and flipSign', (WidgetTester tester) async {
    await tester.pumpApp(
      BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc(
          repository: CalculatorRepositoryImpl(
            localDatasource: mockLocalDatasource,
            remoteDatasource: mockRemoteDatasource,
            connectivity: mockConnectivity,
          ),
        ),
        child: const CalculatorView(),
      ),
    );

    // 숫자 '7' 입력
    await tester.tapButton(ButtonType.seven);

    // FlipSign(+/-) 버튼 누름
    await tester.tapButton(ButtonType.plusMinus);

    // 음수로 바뀌었는지 확인
    expect(find.text('-7'), findsWidgets);

    // Delete 버튼 누름
    final deleteOrClearButtonFinder = find.byWidgetPredicate(
      (widget) => widget is CalculatorButton && (widget.button == ButtonType.delete),
    );
    expect(deleteOrClearButtonFinder, findsOneWidget);
    await tester.ensureVisible(deleteOrClearButtonFinder);
    await tester.tap(deleteOrClearButtonFinder);
    await tester.pumpAndSettle();

    // 결과가 '0'인지 확인
    expect(find.text('0'), findsWidgets);
  });

  testWidgets('Press the remaining buttons and clear.', (WidgetTester tester) async {
    await tester.pumpApp(
      BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc(
          repository: CalculatorRepositoryImpl(
            localDatasource: mockLocalDatasource,
            remoteDatasource: mockRemoteDatasource,
            connectivity: mockConnectivity,
          ),
        ),
        child: const CalculatorView(),
      ),
    );

    // 예시: 45698 * 0 =
    final sequence = <ButtonType>[
      ButtonType.four,
      ButtonType.five,
      ButtonType.six,
      ButtonType.nine,
      ButtonType.eight,
      ButtonType.multiple,
      ButtonType.zero,
      ButtonType.result,
    ];

    for (final buttonType in sequence) {
      await tester.tapButton(buttonType);
    }

    // 결과가 0인지 확인
    expect(find.text('0'), findsWidgets);

    // 예시: 0.3 / 0.3 =
    final sequence2 = <ButtonType>[
      ButtonType.zero,
      ButtonType.dot,
      ButtonType.three,
      ButtonType.division,
      ButtonType.three,
      ButtonType.zero,
      ButtonType.percent,
      ButtonType.result,
    ];

    for (final buttonType in sequence2) {
      await tester.tapButton(buttonType);
    }

    // 결과가 1인지 확인
    expect(find.text('1'), findsWidgets);

    // 마지막에 clear(AC)로 초기화
    await tester.tapButton(ButtonType.minus);
    await tester.tapButton(ButtonType.clear);

    // 결과가 0인지 확인
    expect(find.text('0'), findsWidgets);
  });
}

extension _CalculatorInteraction on WidgetTester {
  Future<void> tapButton(ButtonType buttonType) async {
    final finder = find.byWidgetPredicate(
      (widget) => widget is CalculatorButton && widget.button == buttonType,
    );
    expect(finder, findsOneWidget, reason: '$buttonType should exist');
    await ensureVisible(finder);
    await tap(finder);
    await pumpAndSettle();
  }
}
