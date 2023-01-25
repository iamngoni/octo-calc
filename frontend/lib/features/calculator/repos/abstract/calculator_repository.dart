import '../../models/calculator_operation.dart';

abstract class CalculatorRepository {
  Future<CalculatorOperation> calculate(
    double firstNumber,
    double secondNumber,
    String operation,
  );
  Future<List<CalculatorOperation>> getPreviousCalculations();
}
