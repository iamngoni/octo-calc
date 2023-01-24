abstract class CalculatorRepository {
  Future<Map> calculate(
      double firstNumber, double secondNumber, String operation);
  Future<Map> getPreviousCalculations();
}
