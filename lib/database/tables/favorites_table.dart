import 'package:drift/drift.dart';

class Favorites extends Table {
  TextColumn get cca2 => text().withLength(min: 2, max: 3)();
  TextColumn get commonName => text()();
  TextColumn get officialName => text()();
  TextColumn get capital => text().nullable()();
  TextColumn get region => text()();
  IntColumn get population => integer()();
  RealColumn get area => real().nullable()();
  TextColumn get flagSvgUrl => text()();
  TextColumn get flagPngUrl => text()();
  // Stored as JSON-encoded List<String> — avoids a join table for simple lists
  TextColumn get currencies => text()();
  TextColumn get languages => text()();
  DateTimeColumn get addedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {cca2};
}
