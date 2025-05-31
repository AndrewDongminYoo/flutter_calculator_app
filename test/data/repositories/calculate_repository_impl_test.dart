// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
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
}
