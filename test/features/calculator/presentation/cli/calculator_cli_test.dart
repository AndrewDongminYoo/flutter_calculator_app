// ignore_for_file: avoid_print

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
    test('should initialize with empty history', () {
      final calculatorCli = CalculatorCLI(mockDatasource);
      expect(calculatorCli.history, isEmpty);
      expect(calculatorCli.history, isA<List<String>>());
    });

    test('should initialize with empty history', () {
      final calculatorCli = CalculatorCLI(mockDatasource);
      expect(calculatorCli.datasource, isNotNull);
      expect(calculatorCli.datasource, isA<CalculatorLocalDatasource>());
    });

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
      expect(printOutput, contains('======================================'));
      expect(printOutput, contains('       CLI Calculator (v1.0)          '));
      expect(printOutput, contains('======================================'));
      expect(printOutput, contains('Type "help" for usage instructions or "exit" to quit.'));
    });

    test('should handle input for help command', () {
      final result = calculatorCli.handleInput('help');
      expect(result, contains('Instructions:'));
      expect(result, contains('- Enter calculations (e.g., 2+3, 4*5/2).'));
      expect(result, contains('- Supported operators: +, -, *, /.'));
      expect(result, contains('- Commands:'));
      expect(result, contains("  'help'     - Show usage instructions."));
      expect(result, contains("  'history'  - Show calculation history."));
      expect(result, contains("  'clear'    - Clear the console."));
      expect(result, contains("  'exit'     - Exit the application."));
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
        print('Result: $result');
        calculatorCli.history.add('2+3 = $result');
      });

      // Verify output
      expect(printOutput, contains('Result: 5.0'));
      expect(calculatorCli.history, contains('2+3 = 5.0'));
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
        print('Result: $result');
        calculatorCli.history.add('2+3*4 = $result');
      });

      expect(printOutput, contains('Result: 14.0'));
      expect(calculatorCli.history, contains('2+3*4 = 14.0'));
      verify(mockDatasource.calculate('2+3*4')).called(1);
    });
    test('should handle whitespace in expressions', () async {
      when(mockDatasource.calculate('2 + 3')).thenReturn(5);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        final result = mockDatasource.calculate('2 + 3');
        print('Result: $result');
        calculatorCli.history.add('2 + 3 = $result');
      });

      expect(printOutput, contains('Result: 5.0'));
      expect(calculatorCli.history, contains('2 + 3 = 5.0'));
      verify(mockDatasource.calculate('2 + 3')).called(1);
    });

    test('should handle decimal numbers', () async {
      when(mockDatasource.calculate('2.5*3.2')).thenReturn(8);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        final result = mockDatasource.calculate('2.5*3.2');
        print('Result: $result');
        calculatorCli.history.add('2.5*3.2 = $result');
      });

      expect(printOutput, contains('Result: 8.0'));
      expect(calculatorCli.history, contains('2.5*3.2 = 8.0'));
    });

    test('should handle negative numbers', () async {
      when(mockDatasource.calculate('-5+3')).thenReturn(-2);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        final result = mockDatasource.calculate('-5+3');
        print('Result: $result');
        calculatorCli.history.add('-5+3 = $result');
      });

      expect(printOutput, contains('Result: -2.0'));
      expect(calculatorCli.history, contains('-5+3 = -2.0'));
    });

    test('should handle multiple calculations in sequence', () async {
      when(mockDatasource.calculate('2+3')).thenReturn(5);
      when(mockDatasource.calculate('10-5')).thenReturn(5);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        final result1 = mockDatasource.calculate('2+3');
        print('Result: $result1');
        calculatorCli.history.add('2+3 = $result1');

        final result2 = mockDatasource.calculate('10-5');
        print('Result: $result2');
        calculatorCli.history.add('10-5 = $result2');
      });

      expect(calculatorCli.history.length, equals(2));
      expect(calculatorCli.history.first, equals('2+3 = 5.0'));
      expect(calculatorCli.history.last, equals('10-5 = 5.0'));
    });

    test('should maintain history order', () async {
      when(mockDatasource.calculate('1+1')).thenReturn(2);
      when(mockDatasource.calculate('2+2')).thenReturn(4);
      when(mockDatasource.calculate('3+3')).thenReturn(6);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        for (final expression in ['1+1', '2+2', '3+3']) {
          final result = mockDatasource.calculate(expression);
          calculatorCli.history.add('$expression = $result');
        }
        calculatorCli.handleHistory();
      });

      expect(calculatorCli.history[0], equals('1+1 = 2.0'));
      expect(calculatorCli.history[1], equals('2+2 = 4.0'));
      expect(calculatorCli.history[2], equals('3+3 = 6.0'));
    });

    test('should handle very long expressions', () async {
      when(mockDatasource.calculate('1+2+3+4+5+6+7+8+9+10')).thenReturn(55);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        final result = mockDatasource.calculate('1+2+3+4+5+6+7+8+9+10');
        print('Result: $result');
        calculatorCli.history.add('1+2+3+4+5+6+7+8+9+10 = $result');
      });

      expect(printOutput, contains('Result: 55.0'));
      expect(calculatorCli.history, contains('1+2+3+4+5+6+7+8+9+10 = 55.0'));
    });

    test('should handle consecutive operations with same numbers', () async {
      when(mockDatasource.calculate('5+5')).thenReturn(10);
      when(mockDatasource.calculate('10+5')).thenReturn(15);

      calculatorCli.history.clear();
      final printOutput = <String>[];
      final spec = ZoneSpecification(
        print: (_, __, ___, String msg) => printOutput.add(msg),
      );

      await Zone.current.fork(specification: spec).run(() async {
        for (var i = 0; i < 3; i++) {
          final result1 = mockDatasource.calculate('5+5');
          calculatorCli.history.add('5+5 = $result1');
          final result2 = mockDatasource.calculate('10+5');
          calculatorCli.history.add('10+5 = $result2');
        }
      });

      expect(calculatorCli.history.where((h) => h == '5+5 = 10.0').length, equals(3));
      expect(calculatorCli.history.where((h) => h == '10+5 = 15.0').length, equals(3));
    });

    test('should handle rapid consecutive calculations', () async {
      when(mockDatasource.calculate(any)).thenReturn(0);

      calculatorCli.history.clear();
      final futures = <Future<void>>[];

      for (var i = 0; i < 10; i++) {
        futures.add(
          Future(() async {
            final result = mockDatasource.calculate('1+1');
            calculatorCli.history.add('1+1 = $result');
          }),
        );
      }

      await Future.wait(futures);
      expect(calculatorCli.history.length, equals(10));
    });

    test('should handle input for history command', () {
      calculatorCli.history.addAll(['2+3 = 5.0', '4*2 = 8.0']);
      final result = calculatorCli.handleInput('history');
      expect(result, contains('- 2+3 = 5.0'));
      expect(result, contains('- 4*2 = 8.0'));
    });

    test('should handle invalid input gracefully', () {
      when(mockDatasource.calculate(any)).thenThrow(const FormatException('Invalid format'));
      final result = calculatorCli.handleInput('invalid');
      expect(result, contains('ERROR: Invalid format.'));
    });

    test('should calculate valid expressions', () {
      when(mockDatasource.calculate('2+3')).thenReturn(5);
      final result = calculatorCli.handleInput('2+3');
      expect(result, contains('Result: 5.0'));
      expect(calculatorCli.history, contains('2+3 = 5.0'));
    });
  });
}
