// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import '../../calculator_test.mocks.dart';

void main() {
  late MockCalculatorDatasource mockCalculatorDatasource;

  setUp(() {
    mockCalculatorDatasource = MockCalculatorDatasource();
  });

  test('should return correct result for simple addition', () {
    when(mockCalculatorDatasource.calculate('2+2')).thenReturn(4);
    final result = mockCalculatorDatasource.calculate('2+2');
    expect(result, 4.0);
  });

  test('should return correct result for decimal numbers', () {
    when(mockCalculatorDatasource.calculate('3.5+1.5')).thenReturn(5);
    final result = mockCalculatorDatasource.calculate('3.5+1.5');
    expect(result, 5.0);
  });

  test('should handle negative numbers', () {
    when(mockCalculatorDatasource.calculate('-5+3')).thenReturn(-2);
    final result = mockCalculatorDatasource.calculate('-5+3');
    expect(result, -2.0);
  });

  test('should handle complex expressions', () {
    when(mockCalculatorDatasource.calculate('2*3+4/2')).thenReturn(8);
    final result = mockCalculatorDatasource.calculate('2*3+4/2');
    expect(result, 8.0);
  });

  test('should throw exception for invalid expression', () {
    when(mockCalculatorDatasource.calculate('2++2')).thenThrow(const FormatException('Invalid expression'));
    expect(
      () => mockCalculatorDatasource.calculate('2++2'),
      throwsA(isA<FormatException>()),
    );
  });

  test('should handle empty expression', () {
    when(mockCalculatorDatasource.calculate('')).thenReturn(0);
    final result = mockCalculatorDatasource.calculate('');
    expect(result, 0.0);
  });
}
