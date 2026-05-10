import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor({required this.headerKey, required this.headerValue});

  final String headerKey;
  final String headerValue;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[headerKey] = headerValue;
    handler.next(options);
  }
}
