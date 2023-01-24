part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class Calculate extends CalculatorEvent {
  Calculate({
    required this.firstNumber,
    required this.secondNumber,
    required this.operation,
  });
  final double firstNumber;
  final double secondNumber;
  final String operation;
}
