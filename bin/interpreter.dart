#!/usr/bin/env dart
// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:io';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';

void main() async {
  print('CLI Calculator');
  print('Enter a calculation (e.g., 2+3):');

  void showHelp() {
    print('Instructions:');
    print('- Enter calculations in the format: number operator number');
    print('- Supported operators: +, -, *, /');
    print("- Type 'exit' to quit the application");
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
      break;
    }

    try {
      final result = CalculatorLocalDatasource().calculate(input);
      print('Result: $result');
    } catch (e) {
      handleError(e);
    }
  }
}
