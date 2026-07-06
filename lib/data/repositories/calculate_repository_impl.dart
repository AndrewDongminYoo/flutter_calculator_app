// 🎯 Dart imports:
import 'dart:developer';

// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/data/datasources/calculator_remote_datasource.dart';
import 'package:calculator/domain/repositories/calculator_repository.dart';

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
    // iPhone식 단항 퍼센트("50%" → "0.5")로 정규화한다. 로컬/원격 datasource가
    // 모두 처리할 수 있도록 괄호 없이 리터럴 값으로 치환한다.
    final normalized = _normalizePercent(expression);

    final result = await connectivity.checkConnectivity();
    final connected = result.any((ConnectivityResult con) => con != ConnectivityResult.none);

    log('Internet Connection is ${connected ? 'connected' : 'disconnected'}');
    log('So, It calculates using a ${connected ? 'remote' : 'local'} datasource');

    if (!connected) {
      // Offline status: Use local data source
      return localDatasource.calculate(normalized);
    } else {
      try {
        // Online status: Use remote data source
        return remoteDatasource.calculate(normalized);
      } catch (e) {
        // Use local data source when remote call fails
        return localDatasource.calculate(normalized);
      }
    }
  }

  /// 단항 퍼센트를 리터럴 분수로 변환한다.
  ///
  /// 예: `50%` → `0.5`, `89%*98%` → `0.89*0.98`.
  /// 로컬 datasource가 괄호를 지원하지 않으므로 값 자체로 치환한다.
  String _normalizePercent(String expression) {
    return expression.replaceAllMapped(
      RegExp(r'(\d+\.?\d*)%'),
      (Match match) => '${double.parse(match.group(1)!) / 100}',
    );
  }
}
