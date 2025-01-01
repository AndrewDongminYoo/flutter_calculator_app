// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/features/calculator/data/datasources/calculator_remote_datasource.dart';
import 'package:calculator/features/calculator/domain/repositories/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  CalculatorRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final CalculatorLocalDatasource localDatasource;
  final CalculatorRemoteDatasource remoteDatasource;

  @override
  Future<double> calculate(String expression) async {
    throw UnimplementedError();
  }
}
