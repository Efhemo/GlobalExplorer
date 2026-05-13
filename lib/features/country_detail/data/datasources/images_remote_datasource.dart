import '../models/unsplash_photo_dto.dart';

abstract interface class ImagesRemoteDatasource {
  Future<List<UnsplashPhotoDto>> getCountryImages(String query);
}
