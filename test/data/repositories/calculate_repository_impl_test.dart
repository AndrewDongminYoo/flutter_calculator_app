// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/data/repositories/calculate_repository_impl.dart';
import '../../calculator_test.mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockCalculatorLocalDatasource mockLocalDatasource;
  late MockCalculatorRemoteDatasource mockRemoteDatasource;
  late MockConnectivity mockConnectivity;
  late CalculatorRepositoryImpl repository;

  setUp(() {
    mockLocalDatasource = MockCalculatorLocalDatasource();
    mockRemoteDatasource = MockCalculatorRemoteDatasource();
    mockConnectivity = MockConnectivity();
    repository = CalculatorRepositoryImpl(
      localDatasource: mockLocalDatasource,
      remoteDatasource: mockRemoteDatasource,
      connectivity: mockConnectivity,
    );
  });

  test('should use remote datasource when online', () async {
    const expression = '2+2';
    const result = 4.0;

    when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);
    when(mockRemoteDatasource.calculate(expression)).thenAnswer((_) => result);

    final actual = await repository.calculate(expression);

    expect(actual, equals(result));
    verify(mockRemoteDatasource.calculate(expression));
    verifyNever(mockLocalDatasource.calculate(expression));
  });

  test('should use local datasource when offline', () async {
    const expression = '3*3';
    const result = 9.0;

    when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);
    when(mockLocalDatasource.calculate(expression)).thenAnswer((_) => result);

    final actual = await repository.calculate(expression);

    expect(actual, equals(result));
    verify(mockLocalDatasource.calculate(expression));
    verifyNever(mockRemoteDatasource.calculate(expression));
  });

  test('should fallback to local datasource when remote fails', () async {
    const expression = '5-2';
    const result = 3.0;

    when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.mobile]);
    when(mockRemoteDatasource.calculate(expression)).thenThrow(Exception('Remote error'));
    when(mockLocalDatasource.calculate(expression)).thenAnswer((_) => result);

    final actual = await repository.calculate(expression);

    expect(actual, equals(result));
    verify(mockRemoteDatasource.calculate(expression));
    verify(mockLocalDatasource.calculate(expression));
  });

  test('should handle multiple connectivity results', () async {
    const expression = '1+1';
    const result = 2.0;

    when(mockConnectivity.checkConnectivity()).thenAnswer(
      (_) async => [ConnectivityResult.wifi, ConnectivityResult.mobile],
    );
    when(mockRemoteDatasource.calculate(expression)).thenAnswer((_) => result);

    final actual = await repository.calculate(expression);

    expect(actual, equals(result));
    verify(mockRemoteDatasource.calculate(expression));
    verifyNever(mockLocalDatasource.calculate(expression));
  });

  test('normalizes unary percent before delegating to a datasource', () async {
    when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);
    when(mockLocalDatasource.calculate('0.5')).thenAnswer((_) => 0.5);

    final actual = await repository.calculate('50%');

    expect(actual, equals(0.5));
    verify(mockLocalDatasource.calculate('0.5'));
  });

  test('evaluates percent end to end through the real local datasource', () async {
    final realRepository = CalculatorRepositoryImpl(
      localDatasource: CalculatorLocalDatasource(),
      remoteDatasource: mockRemoteDatasource,
      connectivity: mockConnectivity,
    );
    when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);

    expect(await realRepository.calculate('50%'), equals(0.5));
    expect(await realRepository.calculate('200*10%'), equals(20.0));
    // 선행 0이 없는 소수 퍼센트(예: '.' '5' '%')도 처리한다.
    expect(await realRepository.calculate('.5%'), equals(0.005));
  });
}
