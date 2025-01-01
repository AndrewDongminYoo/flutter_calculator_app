// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/features/calculator/data/datasources/calculator_remote_datasource.dart';
import 'package:calculator/features/calculator/domain/repositories/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  CalculatorRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
    required this.connectivity,
  });

  final CalculatorLocalDatasource localDatasource;
  final CalculatorRemoteDatasource remoteDatasource;
  final Connectivity connectivity;

  @override
  Future<double> calculate(String expression) async {
    final result = await connectivity.checkConnectivity();
    final isConnected = result.any((ConnectivityResult con) => con != ConnectivityResult.none);

    if (!isConnected) {
      // Offline status: Use local data source
      return localDatasource.calculate(expression);
    } else {
      try {
        // Online status: Use remote data source
        return await remoteDatasource.calculate(expression);
      } catch (e) {
        // Use local data source when remote call fails
        return localDatasource.calculate(expression);
      }
    }
  }
}
