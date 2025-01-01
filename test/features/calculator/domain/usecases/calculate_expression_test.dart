// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:calculator/features/calculator/domain/repositories/calculator_repository.dart';
import 'package:calculator/features/calculator/domain/usecases/calculate_expression.dart';
import 'calculate_expression_test.mocks.dart';

@GenerateMocks([CalculatorRepository])
void main() {
  late CalculateExpression calculateExpression;
  late MockCalculatorRepository mockRepository;

  setUp(() {
    mockRepository = MockCalculatorRepository();
    calculateExpression = CalculateExpression(mockRepository);
  });

  test('should return calculated result from repository', () async {
    const expression = '2 + 2';
    const expectedResult = 4.0;

    when(mockRepository.calculate(expression)).thenAnswer((_) async => expectedResult);

    final result = await calculateExpression(expression);

    expect(result, expectedResult);
    verify(mockRepository.calculate(expression));
  });

  test('should handle decimal results', () async {
    const expression = '5 / 2';
    const expectedResult = 2.5;

    when(mockRepository.calculate(expression)).thenAnswer((_) async => expectedResult);

    final result = await calculateExpression(expression);

    expect(result, expectedResult);
  });

  test('should propagate repository exceptions', () async {
    const expression = 'invalid';

    when(mockRepository.calculate(expression)).thenThrow(Exception('Invalid expression'));

    expect(() => calculateExpression(expression), throwsException);
  });
}
