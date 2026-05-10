import '../../../../core/errors/either.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/country.dart';
import '../../domain/repositories/countries_repository.dart';
import '../datasources/countries_remote_datasource.dart';

class CountriesRepositoryImpl implements CountriesRepository {
  const CountriesRepositoryImpl({
    required CountriesRemoteDatasource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  final CountriesRemoteDatasource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, List<Country>>> getAllCountries() async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dtos = await _remoteDataSource.getAllCountries();
      final countries = dtos.map((d) => d.toDomain()).toList()
        ..sort((a, b) => a.commonName.compareTo(b.commonName));
      return Right(countries);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, Country>> getCountryByCode(String cca2) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dto = await _remoteDataSource.getCountryByCode(cca2);
      return Right(dto.toDomain());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }
}
