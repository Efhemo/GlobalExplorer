import 'dart:convert';

import 'package:drift/drift.dart' show Value;

import '../../../../database/app_database.dart';
import '../../../../database/daos/favorites_dao.dart';
import '../../../countries/domain/entities/country.dart';
import '../../domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  const FavoritesRepositoryImpl(this._dao);

  final FavoritesDao _dao;

  @override
  Stream<List<Country>> watchAllFavorites() =>
      _dao.watchAllFavorites().map((rows) => rows.map(_toCountry).toList());

  @override
  Stream<bool> watchIsFavorite(String cca2) => _dao.watchIsFavorite(cca2);

  @override
  Future<void> addFavorite(Country country) =>
      _dao.upsertFavorite(_toCompanion(country));

  @override
  Future<void> removeFavorite(String cca2) => _dao.removeFavorite(cca2);

  Country _toCountry(Favorite row) => Country(
        cca2: row.cca2,
        commonName: row.commonName,
        officialName: row.officialName,
        capital: row.capital,
        region: row.region,
        population: row.population,
        area: row.area,
        currencies: List<String>.from(jsonDecode(row.currencies) as List),
        languages: List<String>.from(jsonDecode(row.languages) as List),
        flagSvgUrl: row.flagSvgUrl,
        flagPngUrl: row.flagPngUrl,
      );

  FavoritesCompanion _toCompanion(Country c) => FavoritesCompanion(
        cca2: Value(c.cca2),
        commonName: Value(c.commonName),
        officialName: Value(c.officialName),
        capital: Value(c.capital),
        region: Value(c.region),
        population: Value(c.population),
        area: Value(c.area),
        flagSvgUrl: Value(c.flagSvgUrl),
        flagPngUrl: Value(c.flagPngUrl),
        currencies: Value(jsonEncode(c.currencies)),
        languages: Value(jsonEncode(c.languages)),
      );
}
