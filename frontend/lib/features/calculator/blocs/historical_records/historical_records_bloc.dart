import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/app_exception.dart';
import '../../models/calculator_operation.dart';
import '../../repos/abstract/calculator_repository.dart';

part 'historical_records_event.dart';
part 'historical_records_state.dart';

class HistoricalRecordsBloc
    extends Bloc<HistoricalRecordsEvent, HistoricalRecordsState> {
  HistoricalRecordsBloc({required this.repository})
      : super(HistoricalRecordsInitial()) {
    on<FetchRecords>(
      (FetchRecords event, Emitter<HistoricalRecordsState> emit) async {
        try {
          emit(FetchingHistoricalRecords());
          final List<CalculatorOperation> calculatorOperations =
              await repository.getPreviousCalculations();
          emit(HistoricalRecordsFetched(operations: calculatorOperations));
        } on AppException catch (e, stackTrace) {
          log(e.toString(), stackTrace: stackTrace);
          emit(HistoricalRecordsException(e));
        } catch (e, stackTrace) {
          log(e.toString(), stackTrace: stackTrace);
          emit(HistoricalRecordsException(AppException(e.toString())));
        }
      },
    );
  }

  final CalculatorRepository repository;
}
