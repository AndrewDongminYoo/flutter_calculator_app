// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mockito/annotations.dart';

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_datasource.dart';
import 'package:calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/data/datasources/calculator_remote_datasource.dart';
import 'package:calculator/domain/repositories/calculator_repository.dart';

@GenerateMocks([
  CalculatorDatasource,
  CalculatorLocalDatasource,
  CalculatorRemoteDatasource,
  CalculatorRepository,
  Connectivity,
])
void main() {}
