import 'package:dio/dio.dart';
import 'package:frontend/features/calculator/repos/abstract/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  @override
  Future<Map> calculate(
    double firstNumber,
    double secondNumber,
    String operation,
  ) async {
    await dio.post(
      'calculate',
      data: {
        'num_one': firstNumber,
        'num_two': secondNumber,
        'operation': operation,
      },
    );
    return {};
  }

  @override
  Future<Map> getPreviousCalculations() {
    // TODO: implement getPreviousCalculations
    throw UnimplementedError();
  }

  final Dio dio = Dio()
    ..options.baseUrl = 'http://142.93.36.21:9003/api/1.0'
    ..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
}
