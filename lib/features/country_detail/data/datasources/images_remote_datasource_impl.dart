import 'package:dio/dio.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/dio_exception_ext.dart';
import '../models/unsplash_photo_dto.dart';
import 'images_remote_datasource.dart';

class ImagesRemoteDatasourceImpl implements ImagesRemoteDatasource {
  const ImagesRemoteDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<UnsplashPhotoDto>> getCountryImages(String query) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/search/photos',
        queryParameters: {
          'query': query,
          'per_page': AppConstants.unsplashPhotosPerPage,
          'orientation': 'landscape',
        },
      );
      return UnsplashSearchResponseDto.fromJson(response.data!).results;
    } on DioException catch (e) {
      e.toAppException();
    }
  }
}
