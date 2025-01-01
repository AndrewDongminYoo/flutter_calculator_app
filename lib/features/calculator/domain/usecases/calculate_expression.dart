// 🌎 Project imports:
import 'package:calculator/features/calculator/domain/repositories/calculator_repository.dart';

class CalculateExpression {
  CalculateExpression(this.repository);

  final CalculatorRepository repository;

  Future<double> call(String expression) async {
    return repository.calculate(expression);
  }
}
