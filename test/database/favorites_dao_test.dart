import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global_explorer/database/app_database.dart';
import 'package:global_explorer/database/daos/favorites_dao.dart';

void main() {
  late AppDatabase db;
  late FavoritesDao dao;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = db.favoritesDao;
  });

  tearDown(() => db.close());

  const tEntry = FavoritesCompanion(
    cca2: Value('CA'),
    commonName: Value('Canada'),
    officialName: Value('Canada'),
    capital: Value('Calgary'),
    region: Value('Americas'),
    population: Value(38000000),
    flagSvgUrl: Value('https://flagcdn.com/ca.svg'),
    flagPngUrl: Value('https://flagcdn.com/w320/ca.png'),
    currencies: Value('["Canadian Dollar"]'),
    languages: Value('["English","French"]'),
  );

  group('FavoritesDao', () {
    test('watchAllFavorites emits empty list initially', () async {
      expect(dao.watchAllFavorites(), emits(isEmpty));
    });

    test('upsertFavorite adds a row to the database', () async {
      await dao.upsertFavorite(tEntry);
      final results = await dao.getAllFavorites();
      expect(results.length, 1);
      expect(results.first.cca2, 'CA');
      expect(results.first.commonName, 'Canada');
    });

    test('upsertFavorite is idempotent i.e no crash on double insert', () async {
      await dao.upsertFavorite(tEntry);
      await dao.upsertFavorite(tEntry);
      final results = await dao.getAllFavorites();
      expect(results.length, 1);
    });

    test('removeFavorite deletes the row', () async {
      await dao.upsertFavorite(tEntry);
      await dao.removeFavorite('CA');
      expect(await dao.getAllFavorites(), isEmpty);
    });

    test('watchIsFavorite emits false when not favorited', () {
      expect(dao.watchIsFavorite('CA'), emits(false));
    });

    test('watchIsFavorite emits true after upsert', () async {
      await dao.upsertFavorite(tEntry);
      expect(dao.watchIsFavorite('CA'), emits(true));
    });

    test('watchAllFavorites updates reactively after upsert', () async {
      final counts = <int>[];
      final sub = dao.watchAllFavorites().map((l) => l.length).listen(counts.add);

      await pumpEventQueue(); // allow initial empty emission
      await dao.upsertFavorite(tEntry);
      await pumpEventQueue(); // allow reactive update emission

      await sub.cancel();
      expect(counts, containsAllInOrder([0, 1]));
    });

  });
}
