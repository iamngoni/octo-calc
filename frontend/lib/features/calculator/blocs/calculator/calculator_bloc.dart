import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:frontend/features/calculator/repos/abstract/calculator_repository.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc({required this.repository}) : super(CalculatorIdle()) {
    on<Calculate>((Calculate event, Emitter<CalculatorState> emit) async {
      try {
        emit(Calculating());
        await repository.calculate(
          event.firstNumber,
          event.secondNumber,
          event.operation,
        );
        emit(CalculatorIdle());
      } catch (e, stackTrace) {
        log(e.toString(), stackTrace: stackTrace);
        emit(CalculatorException(e.toString()));
      }
    });
  }

  final CalculatorRepository repository;
}
