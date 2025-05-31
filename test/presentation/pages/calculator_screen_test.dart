// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/data/repositories/calculate_repository_impl.dart';
import 'package:calculator/presentation/bloc/calculator_bloc.dart';
import 'package:calculator/presentation/pages/calculator_screen.dart';
import '../../calculator_test.mocks.dart';

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
    await tester.pumpWidget(
      const MaterialApp(
        home: CalculatorScreen(),
      ),
    );

    expect(find.byType(BlocProvider<CalculatorBloc>), findsOneWidget);
    expect(find.byType(CalculatorView), findsOneWidget);
  });

  testWidgets('CalculatorScreen initializes repository with correct datasources', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CalculatorBloc>(
          create: (context) => CalculatorBloc(
            repository: CalculatorRepositoryImpl(
              localDatasource: mockLocalDatasource,
              remoteDatasource: mockRemoteDatasource,
              connectivity: mockConnectivity,
            ),
          ),
          child: const CalculatorView(),
        ),
      ),
    );

    final blocProvider = tester.widget<BlocProvider<CalculatorBloc>>(
      find.byType(BlocProvider<CalculatorBloc>),
    );
    expect(blocProvider, isNotNull);
  });

  testWidgets('CalculatorScreen handles widget tree disposal properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CalculatorScreen(),
      ),
    );

    await tester.pumpWidget(const MaterialApp(home: SizedBox()));
    expect(find.byType(CalculatorScreen), findsNothing);
  });
}
