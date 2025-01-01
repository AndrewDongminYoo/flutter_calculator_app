// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_datasource.dart';

class CalculatorLocalDatasource implements CalculatorDatasource {
  @override
  Future<double> calculate(String expression) async {
    final parts = expression.split(' ');
    if (parts.length != 3) {
      throw const FormatException(
        'Input must be in the format: number operator number',
      );
    }

    final num1 = double.tryParse(parts[0]);
    final operator = parts[1];
    final num2 = double.tryParse(parts[2]);

    if (num1 == null || num2 == null) {
      throw const FormatException('Invalid number format');
    }

    switch (operator) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        if (num2 == 0) throw ArgumentError('Cannot divide by zero');
        return num1 / num2;
      default:
        throw UnsupportedError('Unsupported operator: $operator');
    }
  }
}
