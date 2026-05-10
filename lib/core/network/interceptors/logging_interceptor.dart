import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoggingInterceptor extends PrettyDioLogger {
  LoggingInterceptor()
      : super(
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseHeader: false,
          responseBody: kDebugMode,
          error: true,
          compact: true,
        );
}
