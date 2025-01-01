#!/usr/bin/env dart

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart';
import 'package:calculator/features/calculator/presentation/cli/calculator_cli.dart';

void main() async {
  final calculatorCLI = CalculatorCLI(CalculatorLocalDatasource());
  await calculatorCLI.run();
}
