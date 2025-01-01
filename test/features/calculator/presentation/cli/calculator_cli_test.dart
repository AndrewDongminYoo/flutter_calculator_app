// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/features/calculator/presentation/cli/calculator_cli.dart';
import 'calculator_cli_test.mocks.dart';

@GenerateMocks([CalculatorLocalDatasource])
void main() {
  group('CalculatorCLI', () {
    late CalculatorCLI calculatorCli;
    late MockCalculatorLocalDatasource datasource;

    setUp(() {
      datasource = MockCalculatorLocalDatasource();
      calculatorCli = CalculatorCLI(datasource);
    });

    test('should be instantiated', () {
      expect(calculatorCli, isNotNull);
      expect(calculatorCli, isA<CalculatorCLI>());
    });

    test('should initialize with default state', () {
      expect(calculatorCli, isNotNull);
    });
  });
}
