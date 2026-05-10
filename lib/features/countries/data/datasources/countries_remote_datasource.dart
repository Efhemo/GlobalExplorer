import '../models/country_dto.dart';

abstract interface class CountriesRemoteDatasource {
  Future<List<CountryDto>> getAllCountries();
  Future<CountryDto> getCountryByCode(String cca2);
}
