// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_result.freezed.dart';
part 'calculation_result.g.dart';

/// Represents the result of a calculation.
///
/// This class is used to encapsulate the result of a calculation, which is a
/// [double] value.
@freezed
abstract class CalculationResult with _$CalculationResult {
  factory CalculationResult({required double result}) = _CalculationResult;

  factory CalculationResult.fromJson(Map<String, dynamic> json) => _$CalculationResultFromJson(json);
}
