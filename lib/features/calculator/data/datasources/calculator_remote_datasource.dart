// 📦 Package imports:
import 'package:math_expressions/math_expressions.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_datasource.dart';

class CalculatorRemoteDatasource implements CalculatorDatasource {
  final _parser = ShuntingYardParser();
  final _contextModel = ContextModel();

  /// Evaluates a mathematical expression and returns the result.
  ///
  /// Parameters:
  ///   expression: A string containing a valid mathematical expression
  /// Returns:
  ///   A `Future<double>` containing the calculated result
  /// Throws:
  ///   CalculatorException if evaluation fails.
  @override
  double calculate(String expression) {
    try {
      final parsed = _parser.parse(expression);
      return parsed.evaluate(EvaluationType.REAL, _contextModel) as double;
    } catch (exception) {
      throw Exception('Failed to evaluate expression: $exception');
    }
  }
}
