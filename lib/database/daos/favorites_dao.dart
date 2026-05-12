import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/favorites_table.dart';

part 'favorites_dao.g.dart';

@DriftAccessor(tables: [Favorites])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(super.db);

  Stream<List<Favorite>> watchAllFavorites() =>
      (select(favorites)
            ..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
          .watch();

  Stream<bool> watchIsFavorite(String cca2) =>
      (select(favorites)..where((t) => t.cca2.equals(cca2)))
          .watchSingleOrNull()
          .map((row) => row != null);

  Future<List<Favorite>> getAllFavorites() =>
      (select(favorites)..orderBy([(t) => OrderingTerm.desc(t.addedAt)])).get();

  Future<void> upsertFavorite(FavoritesCompanion entry) =>
      into(favorites).insertOnConflictUpdate(entry);

  Future<int> removeFavorite(String cca2) =>
      (delete(favorites)..where((t) => t.cca2.equals(cca2))).go();
}
