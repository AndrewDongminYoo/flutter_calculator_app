// Mocks generated by Mockito 5.4.5 from annotations
// in calculator/test/features/calculator/presentation/cli/calculator_cli_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

// 📦 Package imports:
import 'package:mockito/mockito.dart' as _i1;

// 🌎 Project imports:
import 'package:calculator/features/calculator/data/datasources/calculator_local_datasource.dart' as _i2;

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

/// A class which mocks [CalculatorLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalculatorLocalDatasource extends _i1.Mock implements _i2.CalculatorLocalDatasource {
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
