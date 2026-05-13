import 'package:dio/dio.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/dio_exception_ext.dart';
import '../models/news_article_dto.dart';
import 'news_remote_datasource.dart';

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  const NewsRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<NewsArticleDto>> getCountryNews(
    String cca2,
    String countryName,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/everything',
        queryParameters: {
          'q': countryName,
          'sortBy': 'publishedAt',
          'pageSize': AppConstants.newsPageSize,
          'language': 'en',
        },
      );
      return NewsResponseDto.fromJson(response.data!)
          .articles
          .where((a) => a.title != '[Removed]')
          .toList();
    } on DioException catch (e) {
      e.toAppException();
    }
  }
}
