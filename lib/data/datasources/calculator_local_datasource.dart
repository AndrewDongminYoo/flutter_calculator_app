// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_datasource.dart';

class CalculatorLocalDatasource implements CalculatorDatasource {
  @override
  double calculate(String expression) {
    /// Validates that the input expression is not an empty string.
    ///
    /// Throws an [ArgumentError] if the expression is empty or contains only whitespace.
    /// This prevents processing of invalid or blank mathematical expressions.
    if (expression.trim().isEmpty) {
      throw ArgumentError('Expression cannot be empty');
    }
    final tokens = tokenize(expression);
    return evaluate(tokens);
  }

  /// A constant string containing valid numeric characters for parsing mathematical expressions.
  ///
  /// Includes digits 0-9 and the decimal point for supporting numeric parsing.
  static const String _validNumbers = '0123456789.';

  /// A constant string containing valid mathematical operators for parsing expressions.
  ///
  /// Includes basic arithmetic operators: addition (+), subtraction (-), multiplication (*), and division (/).
  static const String _validOperators = '+-*/';

  List<String> tokenize(String expression) {
    final tokens = <String>[];
    final buffer = StringBuffer();

    for (var i = 0; i < expression.length; i++) {
      final char = expression[i];

      if (_validNumbers.contains(char)) {
        buffer.write(char); // Add a number or a decimal point
      } else if (_validOperators.contains(char)) {
        if (buffer.isNotEmpty) {
          tokens.add(buffer.toString());
          buffer.clear();
        }
        if (char == '-' && (i == 0 || _validOperators.contains(expression[i - 1]))) {
          // Negative water processing
          buffer.write(char);
        } else {
          tokens.add(char);
        }
      } else {
        throw UnsupportedError('Invalid character: $char');
      }
    }

    if (buffer.isNotEmpty) {
      tokens.add(buffer.toString()); // Add the last number
    }

    // Explicitly cleaning up buffers
    buffer.clear();

    // Token verification: Check if the numbers and operators are arranged in the correct order
    for (var i = 0; i < tokens.length; i++) {
      final token = tokens[i];
      if (i.isEven) {
        if (double.tryParse(token) == null) {
          // coverage:ignore-start
          throw FormatException('Invalid number: $token');
          // coverage:ignore-end
        }
      } else {
        if (!_validOperators.contains(token)) {
          // coverage:ignore-start
          throw FormatException('Invalid operator: $token');
          // coverage:ignore-end
        }
      }
    }

    return tokens;
  }

  double evaluate(List<String> tokens) {
    final values = <double>[];
    final operators = <String>[];

    int precedence(String op) {
      if (op == '+' || op == '-') return 1;
      if (op == '*' || op == '/') return 2;
      return 0;
    }

    void applyOperator() {
      final right = values.removeLast();
      final left = values.removeLast();
      final operator = operators.removeLast();

      switch (operator) {
        case '+':
          values.add(left + right);
        case '-':
          values.add(left - right);
        case '*':
          values.add(left * right);
        case '/':
          values.add(right == 0 ? double.infinity : left / right);
        default:
          // This should never happen, but just in case
          // coverage:ignore-start
          throw UnsupportedError('Unsupported operator: $operator');
        // coverage:ignore-end
      }
    }

    for (final token in tokens) {
      if (double.tryParse(token) != null) {
        values.add(double.parse(token));
      } else if (_validOperators.contains(token)) {
        while (operators.isNotEmpty && precedence(operators.last) >= precedence(token)) {
          applyOperator();
        }
        operators.add(token);
      } else {
        throw FormatException('Invalid token: $token');
      }
    }

    while (operators.isNotEmpty) {
      applyOperator();
    }

    return values.single;
  }
}
