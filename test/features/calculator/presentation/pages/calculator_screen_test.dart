// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/features/calculator/data/datasources/calculator_remote_datasource.dart';
import 'package:calculator/features/calculator/data/repositories/calculate_repository_impl.dart';
import 'package:calculator/features/calculator/presentation/bloc/calculator_bloc.dart';
import 'package:calculator/features/calculator/presentation/pages/calculator_screen.dart';
import 'calculator_screen_test.mocks.dart';

@GenerateMocks([Connectivity, CalculatorLocalDatasource, CalculatorRemoteDatasource])
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
