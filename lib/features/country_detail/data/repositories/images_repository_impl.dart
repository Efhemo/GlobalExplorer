import '../../../../core/errors/either.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/country_image.dart';
import '../../domain/repositories/images_repository.dart';
import '../datasources/images_remote_datasource.dart';

class ImagesRepositoryImpl implements ImagesRepository {
  const ImagesRepositoryImpl(this._datasource);

  final ImagesRemoteDatasource _datasource;

  @override
  Future<Either<Failure, List<CountryImage>>> getCountryImages(
    String query,
  ) async {
    try {
      final dtos = await _datasource.getCountryImages(query);
      return Right(dtos.map((d) => d.toDomain()).toList());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }
}
