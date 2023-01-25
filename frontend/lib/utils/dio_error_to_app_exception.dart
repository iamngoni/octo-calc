import 'package:dio/dio.dart';

import '../features/calculator/models/app_exception.dart';

AppException dioErrorToAppException(DioError error) {
  late AppException exception;
  switch (error.type) {
    case DioErrorType.connectTimeout:
      exception = AppException(
        'Sorry Calculator is unable to communicate with the server at the moment, '
        'please check your internet connection 📡 and retry.',
        title: 'Connection Error',
      );
      break;
    case DioErrorType.sendTimeout:
      exception = AppException(
        'Sorry Calculator is unable to communicate with the server at the moment, '
        'please check your internet connection 📡 and retry.',
        title: 'Connection Error',
      );
      break;
    case DioErrorType.receiveTimeout:
      exception = AppException(
        'Sorry Calculator is unable to communicate with the server at the moment, '
        'please check your internet connection 📡 and retry.',
        title: 'Connection Error',
      );
      break;
    case DioErrorType.response:
      exception = AppException(
        "${error.response?.data['message']}",
      );
      break;
    case DioErrorType.other:
      exception = AppException(
        'Sorry Calculator is unable to communicate with the server at the moment, '
        'please check your internet connection 📡 and retry.',
        title: 'Network Error',
      );
      break;
    case DioErrorType.cancel:
      exception = AppException(
        'Sorry Calculator is unable to communicate with the server at the moment, '
        'please check your internet connection 📡 and retry.',
        title: 'Cancelled Request',
      );
      break;
  }

  return exception;
}
