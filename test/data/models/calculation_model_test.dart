// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:calculator/data/models/calculation_model.dart';

void main() {
  group('CalculationModel', () {
    test('should create model with result value', () {
      final model = CalculationModel(result: 42);
      expect(model.result, 42.0);
    });

    test('should create model from json', () {
      final json = {'result': 123.45};
      final model = CalculationModel.fromJson(json);
      expect(model.result, 123.45);
    });

    test('should convert model to json', () {
      final model = CalculationModel(result: 99.99);
      final json = model.toJson();
      expect(json, {'result': 99.99});
    });

    test('should handle integer values as doubles', () {
      final json = {'result': 100};
      final model = CalculationModel.fromJson(json);
      expect(model.result, 100.0);
    });

    test('should compare equal models', () {
      final model1 = CalculationModel(result: 50);
      final model2 = CalculationModel(result: 50);
      expect(model1, equals(model2));
    });
  });
}
