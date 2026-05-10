import 'package:dio/dio.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/country_dto.dart';
import 'countries_remote_datasource.dart';

class CountriesRemoteDatasourceImpl implements CountriesRemoteDatasource {
  const CountriesRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<CountryDto>> getAllCountries() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/all',
        queryParameters: {'fields': AppConstants.countriesFields},
      );
      return (response.data ?? [])
          .map((json) => CountryDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<CountryDto> getCountryByCode(String cca2) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/alpha/$cca2');
      return CountryDto.fromJson(response.data!);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Never _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      throw const NetworkException();
    }
    throw ServerException(
      e.message ?? 'Unexpected server error',
      statusCode: e.response?.statusCode,
    );
  }
}
