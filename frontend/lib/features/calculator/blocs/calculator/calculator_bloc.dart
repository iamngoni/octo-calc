import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/calculator_operation.dart';
import '../../repos/abstract/calculator_repository.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc({required this.repository}) : super(CalculatorIdle()) {
    on<Calculate>((Calculate event, Emitter<CalculatorState> emit) async {
      try {
        emit(Calculating());
        final CalculatorOperation calculatorOperation =
            await repository.calculate(
          event.firstNumber,
          event.secondNumber,
          event.operation,
        );
        emit(CalculatorIdle(calculatorOperation: calculatorOperation));
      } catch (e, stackTrace) {
        log(e.toString(), stackTrace: stackTrace);
        emit(CalculatorException(e.toString()));
      }
    });
  }

  final CalculatorRepository repository;
}
