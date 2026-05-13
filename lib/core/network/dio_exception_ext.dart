import 'package:dio/dio.dart';

import '../errors/exceptions.dart';

extension DioExceptionExt on DioException {
  Never toAppException() {
    if (type == DioExceptionType.connectionError ||
        type == DioExceptionType.connectionTimeout) {
      throw const NetworkException();
    }
    throw ServerException(
      message ?? 'Unexpected error',
      statusCode: response?.statusCode,
    );
  }
}
