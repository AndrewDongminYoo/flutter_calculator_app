// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_datasource.dart';

class CalculatorLocalDatasource implements CalculatorDatasource {
  @override
  Future<double> calculate(String expression) async {
    final tokens = tokenize(expression);
    return evaluate(tokens);
  }

  List<String> tokenize(String expression) {
    final tokens = <String>[];
    final buffer = StringBuffer();

    for (var i = 0; i < expression.length; i++) {
      final char = expression[i];

      if ('0123456789.'.contains(char)) {
        buffer.write(char); // Add a number or a decimal point
      } else if ('+-*/'.contains(char)) {
        if (buffer.isNotEmpty) {
          tokens.add(buffer.toString());
          buffer.clear();
        }
        if (char == '-' && (i == 0 || '+-*/'.contains(expression[i - 1]))) {
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

    // Token verification: Check if the numbers and operators are arranged in the correct order
    for (var i = 0; i < tokens.length; i++) {
      final token = tokens[i];
      if (i.isEven) {
        if (double.tryParse(token) == null) {
          throw FormatException('Invalid number: $token');
        }
      } else {
        if (!'+-*/'.contains(token)) {
          throw FormatException('Invalid operator: $token');
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
          throw UnsupportedError('Unsupported operator: $operator');
      }
    }

    for (final token in tokens) {
      if (double.tryParse(token) != null) {
        values.add(double.parse(token));
      } else if ('+-*/'.contains(token)) {
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
