// Mocks generated by Mockito 5.4.6 from annotations
// in calculator/test/calculator_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

// 🎯 Dart imports:
import 'dart:async' as _i6;

// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart' as _i7;
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// 🌎 Project imports:
import 'package:calculator/data/datasources/calculator_datasource.dart' as _i2;
import 'package:calculator/data/datasources/calculator_local_datasource.dart' as _i3;
import 'package:calculator/data/datasources/calculator_remote_datasource.dart' as _i4;
import 'package:calculator/domain/repositories/calculator_repository.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CalculatorDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalculatorDatasource extends _i1.Mock implements _i2.CalculatorDatasource {
  MockCalculatorDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double calculate(String? expression) => (super.noSuchMethod(
        Invocation.method(
          #calculate,
          [expression],
        ),
        returnValue: 0.0,
      ) as double);
}

/// A class which mocks [CalculatorLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalculatorLocalDatasource extends _i1.Mock implements _i3.CalculatorLocalDatasource {
  MockCalculatorLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double calculate(String? expression) => (super.noSuchMethod(
        Invocation.method(
          #calculate,
          [expression],
        ),
        returnValue: 0.0,
      ) as double);

  @override
  List<String> tokenize(String? expression) => (super.noSuchMethod(
        Invocation.method(
          #tokenize,
          [expression],
        ),
        returnValue: <String>[],
      ) as List<String>);

  @override
  double evaluate(List<String>? tokens) => (super.noSuchMethod(
        Invocation.method(
          #evaluate,
          [tokens],
        ),
        returnValue: 0.0,
      ) as double);
}

/// A class which mocks [CalculatorRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalculatorRemoteDatasource extends _i1.Mock implements _i4.CalculatorRemoteDatasource {
  MockCalculatorRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double calculate(String? expression) => (super.noSuchMethod(
        Invocation.method(
          #calculate,
          [expression],
        ),
        returnValue: 0.0,
      ) as double);
}

/// A class which mocks [CalculatorRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalculatorRepository extends _i1.Mock implements _i5.CalculatorRepository {
  MockCalculatorRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<double> calculate(String? expression) => (super.noSuchMethod(
        Invocation.method(
          #calculate,
          [expression],
        ),
        returnValue: _i6.Future<double>.value(0.0),
      ) as _i6.Future<double>);
}

/// A class which mocks [Connectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivity extends _i1.Mock implements _i7.Connectivity {
  MockConnectivity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Stream<List<_i8.ConnectivityResult>> get onConnectivityChanged => (super.noSuchMethod(
        Invocation.getter(#onConnectivityChanged),
        returnValue: _i6.Stream<List<_i8.ConnectivityResult>>.empty(),
      ) as _i6.Stream<List<_i8.ConnectivityResult>>);

  @override
  _i6.Future<List<_i8.ConnectivityResult>> checkConnectivity() => (super.noSuchMethod(
        Invocation.method(
          #checkConnectivity,
          [],
        ),
        returnValue: _i6.Future<List<_i8.ConnectivityResult>>.value(<_i8.ConnectivityResult>[]),
      ) as _i6.Future<List<_i8.ConnectivityResult>>);
}
