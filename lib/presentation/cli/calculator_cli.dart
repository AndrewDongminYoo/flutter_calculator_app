// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:io';

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_local_datasource.dart';

class CalculatorCLI {
  CalculatorCLI(this.datasource);

  final CalculatorLocalDatasource datasource;
  final List<String> history = [];

  void printBanner() {
    print('======================================');
    print('       CLI Calculator (v1.0)          ');
    print('======================================');
    print('Type "help" for usage instructions or "exit" to quit.');
  }

  String handleInput(String input) {
    switch (input.toLowerCase()) {
      case 'exit':
        return 'Goodbye!';
      case 'help':
        return showHelp();
      case 'history':
        return handleHistory();
      case 'clear':
        return clearConsole();
      default:
        try {
          final result = datasource.calculate(input);
          final resultMessage = 'Result: $result';
          history.add('$input = $result');
          return resultMessage;
        } catch (e) {
          return handleError(e);
        }
    }
  }

  String showHelp() {
    return '''
--------------------------------------
Instructions:
- Enter calculations (e.g., 2+3, 4*5/2).
- Supported operators: +, -, *, /.
- Commands:
  'help'     - Show usage instructions.
  'history'  - Show calculation history.
  'clear'    - Clear the console.
  'exit'     - Exit the application.
--------------------------------------
''';
  }

  String handleHistory() {
    if (history.isEmpty) {
      return 'No history available.';
    }
    final buffer = StringBuffer('Calculation History:\n');
    for (final entry in history) {
      buffer.writeln('- $entry');
    }
    return buffer.toString();
  }

  String clearConsole() {
    // Simulate clear operation
    return 'Console cleared.';
  }

  String handleError(Object e) {
    if (e is FormatException) {
      return 'ERROR: Invalid format. Please use a valid mathematical expression (e.g., 2+3).';
    } else if (e is UnsupportedError) {
      return 'ERROR: Unsupported character or operator in the input.';
    } else {
      return 'ERROR: An unexpected error occurred.';
    }
  }

  Future<void> run() async {
    printBanner();
    while (true) {
      stdout.write('> ');
      final input = stdin.readLineSync();
      if (input == null) break;

      final response = handleInput(input);
      print(response);
      if (response == 'Goodbye!') break;
    }
  }
}
