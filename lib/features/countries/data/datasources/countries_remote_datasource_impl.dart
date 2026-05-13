import 'package:dio/dio.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/dio_exception_ext.dart';
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
      e.toAppException();
    }
  }

  @override
  Future<CountryDto> getCountryByCode(String cca2) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/alpha/$cca2');
      return CountryDto.fromJson(response.data!);
    } on DioException catch (e) {
      e.toAppException();
    }
  }
}
