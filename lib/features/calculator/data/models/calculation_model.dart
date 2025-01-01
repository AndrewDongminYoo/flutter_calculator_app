// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_model.freezed.dart';
part 'calculation_model.g.dart';

@freezed
abstract class CalculationModel with _$CalculationModel {
  factory CalculationModel({required double result}) = _CalculationModel;

  factory CalculationModel.fromJson(Map<String, dynamic> json) => _$CalculationModelFromJson(json);
}
