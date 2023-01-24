import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/calculator/blocs/calculator/calculator_bloc.dart';
import 'package:frontend/features/calculator/repos/impl/calculator_repository_impl.dart';

List<BlocProvider> providers = [
  BlocProvider(
    create: (_) => CalculatorBloc(repository: CalculatorRepositoryImpl()),
  )
];
