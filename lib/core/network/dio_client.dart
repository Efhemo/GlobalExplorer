import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/app_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

abstract final class DioClient {
  static Dio createCountriesClient() {
    final dio = _base(AppConstants.countriesBaseUrl);
    dio.interceptors.addAll([
      if (kDebugMode) LoggingInterceptor(),
    ]);
    return dio;
  }

  static Dio createUnsplashClient() {
    final key = dotenv.env['UNSPLASH_ACCESS_KEY'] ?? '';
    final dio = _base(AppConstants.unsplashBaseUrl);
    dio.interceptors.addAll([
      AuthInterceptor(
        headerKey: 'Authorization',
        headerValue: 'Client-ID $key',
      ),
      if (kDebugMode) LoggingInterceptor(),
    ]);
    return dio;
  }

  static Dio createNewsClient() {
    final key = dotenv.env['NEWS_API_KEY'] ?? '';
    final dio = _base(
      AppConstants.newsBaseUrl,
      queryParameters: {'apiKey': key},
    );
    dio.interceptors.addAll([
      if (kDebugMode) LoggingInterceptor(),
    ]);
    return dio;
  }

  static Dio _base(
    String baseUrl, {
    Map<String, dynamic>? queryParameters,
  }) =>
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: AppConstants.connectTimeout,
          receiveTimeout: AppConstants.receiveTimeout,
          headers: const {'Accept': 'application/json'},
          queryParameters: queryParameters,
        ),
      );
}
