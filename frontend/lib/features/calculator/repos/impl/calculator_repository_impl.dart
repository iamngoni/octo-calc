import 'package:dio/dio.dart';

import '../../../../utils/dio_error_to_app_exception.dart';
import '../../models/app_exception.dart';
import '../../models/calculator_operation.dart';
import '../abstract/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  @override
  Future<CalculatorOperation> calculate(
    double firstNumber,
    double secondNumber,
    String operation,
  ) async {
    try {
      final Response<Map<String, dynamic>> response = await dio.post(
        '/calculate',
        data: {
          'num_one': firstNumber,
          'num_two': secondNumber,
          'operation': operation,
        },
      );

      final Map<String, dynamic> responseData = response.data!;
      final CalculatorOperation calculatorOperation =
          CalculatorOperation.fromJson(
        (responseData['data'] as Map<String, dynamic>)['operation']
            as Map<String, dynamic>,
      );

      return calculatorOperation;
    } on DioError catch (e) {
      throw dioErrorToAppException(e);
    } catch (e) {
      throw AppException('App Failure');
    }
  }

  @override
  Future<List<CalculatorOperation>> getPreviousCalculations() async {
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
        '/calculate',
      );

      final Map<String, dynamic> responseData = response.data!;
      final List<CalculatorOperation> calculatorOperations =
          ((responseData['data'] as Map<String, dynamic>)['operations'] as List)
              .map<CalculatorOperation>(
                (operation) => CalculatorOperation.fromJson(
                  operation as Map<String, dynamic>,
                ),
              )
              .toList();

      return calculatorOperations;
    } on DioError catch (e) {
      throw dioErrorToAppException(e);
    } catch (e) {
      throw AppException('App Failure');
    }
  }

  final Dio dio = Dio()
    ..options.baseUrl = 'http://127.0.0.1:8000/api/1.0'
    ..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
}
