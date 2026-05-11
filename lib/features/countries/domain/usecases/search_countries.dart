import '../entities/country.dart';

class SearchCountries {
  const SearchCountries();

  List<Country> call(List<Country> countries, String query) {
    if (query.isEmpty) return countries;
    final q = query.toLowerCase().trim();
    return countries.where((c) {
      return c.commonName.toLowerCase().contains(q) ||
          c.officialName.toLowerCase().contains(q) ||
          (c.capital?.toLowerCase().contains(q) ?? false) ||
          c.region.toLowerCase().contains(q) ||
          (c.subregion?.toLowerCase().contains(q) ?? false);
    }).toList();
  }
}
