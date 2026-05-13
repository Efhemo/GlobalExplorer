import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../entities/country_image.dart';

abstract interface class ImagesRepository {
  Future<Either<Failure, List<CountryImage>>> getCountryImages(String query);
}
