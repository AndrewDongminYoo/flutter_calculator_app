#!/usr/bin/env dart
// ignore_for_file: avoid_print

// 🎯 Dart imports:
import 'dart:io';

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_local_datasource.dart';

void main(List<String> args) {
  // Display help message if no arguments are provided
  if (args.isEmpty || args.contains('--help')) {
    print('Usage: dart run calculator:calculate <expression>');
    print('Example: dart run calculator:calculate "2+3"');
    return;
  }

  final expression = args.join(' ');
  // Add before processing
  if (expression.trim().isEmpty) {
    print('Expression cannot be empty');
    exitCode = 1;
    return;
  }

  final datasource = CalculatorLocalDatasource();

  try {
    final result = datasource.calculate(expression);
    print('Result: $result');
  } catch (e) {
    print('ERROR: ${e.runtimeType} - $e');
    exitCode = 1;
  }
}
