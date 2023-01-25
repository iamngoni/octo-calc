class CalculatorOperation {
  CalculatorOperation({
    required this.numOne,
    required this.numTwo,
    required this.result,
    required this.operation,
  });

  factory CalculatorOperation.fromJson(Map<String, dynamic> json) {
    return CalculatorOperation(
      numOne: json['num_one'] as double,
      numTwo: json['num_two'] as double,
      result: json['result'] as double,
      operation: json['operation'] as String,
    );
  }
  final double numOne;
  final double numTwo;
  final double result;
  final String operation;
}
