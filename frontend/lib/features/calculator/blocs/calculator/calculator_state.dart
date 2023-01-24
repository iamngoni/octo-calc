part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {}

class CalculatorIdle extends CalculatorState {
  CalculatorIdle({this.result});
  final double? result;
}

class Calculating extends CalculatorState {}

class CalculatorException extends CalculatorState {
  CalculatorException(this.message);
  final String message;
}
