import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../entities/country.dart';

abstract interface class CountriesRepository {
  Future<Either<Failure, List<Country>>> getAllCountries();
  Future<Either<Failure, Country>> getCountryByCode(String cca2);
}
