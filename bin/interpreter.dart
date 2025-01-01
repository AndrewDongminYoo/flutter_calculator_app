#!/usr/bin/env dart
// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:io';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';

void main() async {
  print('======================================');
  print('       CLI Calculator (v1.0)          ');
  print('======================================');
  print('Type "help" for usage instructions or "exit" to quit.');

  final history = <String>[]; // Save the calculation record

  void handleHistory() {
    if (history.isEmpty) {
      print('No history available.');
    } else {
      print('Calculation History:');
      for (final entry in history) {
        print('- $entry');
      }
    }
  }

  void clearConsole() {
    if (Platform.isWindows) {
      print(Process.runSync('cls', [], runInShell: true).stdout);
    } else {
      print(Process.runSync('clear', [], runInShell: true).stdout);
    }
  }

  void showHelp() {
    print('--------------------------------------');
    print('Instructions:');
    print('- Enter calculations (e.g., 2+3, 4*5/2).');
    print('- Supported operators: +, -, *, /.');
    print('- Commands:');
    print("  'help'     - Show usage instructions.");
    print("  'history'  - Show calculation history.");
    print("  'clear'    - Clear the console.");
    print("  'exit'     - Exit the application.");
    print('--------------------------------------');
  }

  void handleError(Object e) {
    if (e is FormatException) {
      print('ERROR: Invalid format. Please use a valid mathematical expression (e.g., 2+3).');
    } else if (e is UnsupportedError) {
      print('ERROR: Unsupported character or operator in the input.');
    } else {
      print('ERROR: An unexpected error occurred.');
    }
  }

  while (true) {
    stdout.write('> ');
    final input = stdin.readLineSync();
    if (input == null || input.toLowerCase() == 'exit') {
      print('Goodbye!');
      break;
    }
    if (input.toLowerCase() == 'help') {
      showHelp();
      continue;
    }
    if (input.toLowerCase() == 'history') {
      handleHistory();
      continue;
    }
    if (input.toLowerCase() == 'clear') {
      clearConsole();
      continue;
    }

    try {
      final result = CalculatorLocalDatasource().calculate(input);
      print('Result: $result');
      history.add('$input = $result');
    } catch (e) {
      handleError(e);
    }
  }
}
