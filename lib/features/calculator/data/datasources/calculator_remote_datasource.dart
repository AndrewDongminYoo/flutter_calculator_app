// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_datasource.dart';

class CalculatorRemoteDatasource implements CalculatorDatasource {
  @override
  Future<double> calculate(String expression) async {
    // HTTP API 호출 등 구현
    throw UnimplementedError();
  }
}
