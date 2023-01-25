import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/calculator/blocs/calculator/calculator_bloc.dart';
import 'features/calculator/blocs/historical_records/historical_records_bloc.dart';
import 'features/calculator/repos/impl/calculator_repository_impl.dart';

List<BlocProvider> providers = [
  BlocProvider<CalculatorBloc>(
    create: (_) => CalculatorBloc(
      repository: CalculatorRepositoryImpl(),
    ),
  ),
  BlocProvider<HistoricalRecordsBloc>(
    create: (_) => HistoricalRecordsBloc(
      repository: CalculatorRepositoryImpl(),
    )..add(FetchRecords()),
  )
];
