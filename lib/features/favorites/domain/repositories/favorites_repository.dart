import '../../../countries/domain/entities/country.dart';

abstract interface class FavoritesRepository {
  Stream<List<Country>> watchAllFavorites();
  Stream<bool> watchIsFavorite(String cca2);
  Future<void> addFavorite(Country country);
  Future<void> removeFavorite(String cca2);
}
