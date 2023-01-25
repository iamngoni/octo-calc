part of 'historical_records_bloc.dart';

@immutable
abstract class HistoricalRecordsState {}

class HistoricalRecordsInitial extends HistoricalRecordsState {}

class FetchingHistoricalRecords extends HistoricalRecordsState {}

class HistoricalRecordsFetched extends HistoricalRecordsState {
  HistoricalRecordsFetched({required this.operations});
  final List<CalculatorOperation> operations;
}

class HistoricalRecordsException extends HistoricalRecordsState {
  HistoricalRecordsException(this.exception);
  final AppException exception;
}
