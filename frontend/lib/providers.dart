import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/calculator/blocs/calculator/calculator_bloc.dart';
import 'features/calculator/repos/impl/calculator_repository_impl.dart';

List<BlocProvider> providers = [
  BlocProvider<CalculatorBloc>(
    create: (_) => CalculatorBloc(repository: CalculatorRepositoryImpl()),
  )
];
