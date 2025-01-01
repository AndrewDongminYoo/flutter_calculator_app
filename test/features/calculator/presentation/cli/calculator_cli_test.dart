// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/features/calculator/presentation/cli/calculator_cli.dart';
import 'calculator_cli_test.mocks.dart';

@GenerateMocks([CalculatorLocalDatasource])
void main() {
  late MockCalculatorLocalDatasource mockDatasource;
  late CalculatorCLI calculatorCli;

  setUp(() {
    mockDatasource = MockCalculatorLocalDatasource();
    calculatorCli = CalculatorCLI(mockDatasource);
  });

  group('CalculatorCLI', () {
    test('should print the banner on startup', () {
      // Capture stdout
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      // Run test in zone
      Zone.current.fork(specification: spec).run(() {
        calculatorCli.printBanner();
      });

      // Verify banner output
      expect(printOutput, contains('       CLI Calculator (v1.0)          '));
      expect(printOutput, contains('Type "help" for usage instructions or "exit" to quit.'));
    });

    test('should handle help command', () {
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      Zone.current.fork(specification: spec).run(() {
        calculatorCli.showHelp();
      });

      expect(printOutput, contains('Instructions:'));
      expect(printOutput, contains('- Supported operators: +, -, *, /.'));
    });

    test('should calculate expressions and save to history', () async {
      when(mockDatasource.calculate('2+3')).thenReturn(5);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        final result = mockDatasource.calculate('2+3');
        // ignore: avoid_print
        print('Result: $result');
        calculatorCli.history.add('2+3 = $result');
      });

      // Verify output
      expect(printOutput, contains('Result: 5.0'));
      expect(calculatorCli.history, contains('2+3 = 5.0'));
    });

    test('should handle history command', () {
      calculatorCli.history.addAll(['2+3 = 5.0', '4*2 = 8.0']);

      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      Zone.current.fork(specification: spec).run(() {
        calculatorCli.handleHistory();
      });

      // Verify history output
      expect(printOutput, contains('- 2+3 = 5.0'));
      expect(printOutput, contains('- 4*2 = 8.0'));
    });

    test('should handle errors gracefully', () {
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      Zone.current.fork(specification: spec).run(() {
        calculatorCli.handleError(const FormatException('Invalid input'));
      });

      expect(printOutput, contains('ERROR: Invalid format. Please use a valid mathematical expression (e.g., 2+3).'));
    });
  });

  test('should handle clear command', () {
    final printOutput = <String>[];
    final spec = ZoneSpecification(
      print: (_, __, ___, String msg) => printOutput.add(msg),
    );

    Zone.current.fork(specification: spec).run(() {
      calculatorCli.clearConsole();
    });

    expect(printOutput, isNotEmpty);
  });

  test('should handle empty history', () {
    final printOutput = <String>[];
    final spec = ZoneSpecification(
      print: (_, __, ___, String msg) => printOutput.add(msg),
    );

    Zone.current.fork(specification: spec).run(() {
      calculatorCli.history.clear();
      calculatorCli.handleHistory();
    });

    expect(printOutput, contains('No history available.'));
  });

  test('should handle UnsupportedError gracefully', () {
    final printOutput = <String>[];
    final spec = ZoneSpecification(
      print: (_, __, ___, String msg) => printOutput.add(msg),
    );

    Zone.current.fork(specification: spec).run(() {
      calculatorCli.handleError(UnsupportedError('Invalid operator'));
    });

    expect(printOutput, contains('ERROR: Unsupported character or operator in the input.'));
  });

  test('should handle generic errors gracefully', () {
    final printOutput = <String>[];
    final spec = ZoneSpecification(
      print: (_, __, ___, String msg) => printOutput.add(msg),
    );

    Zone.current.fork(specification: spec).run(() {
      calculatorCli.handleError(Exception('Unknown error'));
    });

    expect(printOutput, contains('ERROR: An unexpected error occurred.'));
  });

  test('should handle calculation with multiple operations', () async {
    when(mockDatasource.calculate('2+3*4')).thenReturn(14);

    calculatorCli.history.clear();
    final printOutput = <String>[];
    final spec = ZoneSpecification(
      print: (_, __, ___, String msg) => printOutput.add(msg),
    );

    await Zone.current.fork(specification: spec).run(() async {
      final result = mockDatasource.calculate('2+3*4');
      // ignore: avoid_print
      print('Result: $result');
      calculatorCli.history.add('2+3*4 = $result');
    });

    expect(printOutput, contains('Result: 14.0'));
    expect(calculatorCli.history, contains('2+3*4 = 14.0'));
    verify(mockDatasource.calculate('2+3*4')).called(1);
  });
}
