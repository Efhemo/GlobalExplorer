// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cca2Meta = const VerificationMeta('cca2');
  @override
  late final GeneratedColumn<String> cca2 = GeneratedColumn<String>(
    'cca2',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 3,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commonNameMeta = const VerificationMeta(
    'commonName',
  );
  @override
  late final GeneratedColumn<String> commonName = GeneratedColumn<String>(
    'common_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _officialNameMeta = const VerificationMeta(
    'officialName',
  );
  @override
  late final GeneratedColumn<String> officialName = GeneratedColumn<String>(
    'official_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capitalMeta = const VerificationMeta(
    'capital',
  );
  @override
  late final GeneratedColumn<String> capital = GeneratedColumn<String>(
    'capital',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _populationMeta = const VerificationMeta(
    'population',
  );
  @override
  late final GeneratedColumn<int> population = GeneratedColumn<int>(
    'population',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<double> area = GeneratedColumn<double>(
    'area',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _flagSvgUrlMeta = const VerificationMeta(
    'flagSvgUrl',
  );
  @override
  late final GeneratedColumn<String> flagSvgUrl = GeneratedColumn<String>(
    'flag_svg_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _flagPngUrlMeta = const VerificationMeta(
    'flagPngUrl',
  );
  @override
  late final GeneratedColumn<String> flagPngUrl = GeneratedColumn<String>(
    'flag_png_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currenciesMeta = const VerificationMeta(
    'currencies',
  );
  @override
  late final GeneratedColumn<String> currencies = GeneratedColumn<String>(
    'currencies',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languagesMeta = const VerificationMeta(
    'languages',
  );
  @override
  late final GeneratedColumn<String> languages = GeneratedColumn<String>(
    'languages',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    cca2,
    commonName,
    officialName,
    capital,
    region,
    population,
    area,
    flagSvgUrl,
    flagPngUrl,
    currencies,
    languages,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cca2')) {
      context.handle(
        _cca2Meta,
        cca2.isAcceptableOrUnknown(data['cca2']!, _cca2Meta),
      );
    } else if (isInserting) {
      context.missing(_cca2Meta);
    }
    if (data.containsKey('common_name')) {
      context.handle(
        _commonNameMeta,
        commonName.isAcceptableOrUnknown(data['common_name']!, _commonNameMeta),
      );
    } else if (isInserting) {
      context.missing(_commonNameMeta);
    }
    if (data.containsKey('official_name')) {
      context.handle(
        _officialNameMeta,
        officialName.isAcceptableOrUnknown(
          data['official_name']!,
          _officialNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_officialNameMeta);
    }
    if (data.containsKey('capital')) {
      context.handle(
        _capitalMeta,
        capital.isAcceptableOrUnknown(data['capital']!, _capitalMeta),
      );
    }
    if (data.containsKey('region')) {
      context.handle(
        _regionMeta,
        region.isAcceptableOrUnknown(data['region']!, _regionMeta),
      );
    } else if (isInserting) {
      context.missing(_regionMeta);
    }
    if (data.containsKey('population')) {
      context.handle(
        _populationMeta,
        population.isAcceptableOrUnknown(data['population']!, _populationMeta),
      );
    } else if (isInserting) {
      context.missing(_populationMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    }
    if (data.containsKey('flag_svg_url')) {
      context.handle(
        _flagSvgUrlMeta,
        flagSvgUrl.isAcceptableOrUnknown(
          data['flag_svg_url']!,
          _flagSvgUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_flagSvgUrlMeta);
    }
    if (data.containsKey('flag_png_url')) {
      context.handle(
        _flagPngUrlMeta,
        flagPngUrl.isAcceptableOrUnknown(
          data['flag_png_url']!,
          _flagPngUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_flagPngUrlMeta);
    }
    if (data.containsKey('currencies')) {
      context.handle(
        _currenciesMeta,
        currencies.isAcceptableOrUnknown(data['currencies']!, _currenciesMeta),
      );
    } else if (isInserting) {
      context.missing(_currenciesMeta);
    }
    if (data.containsKey('languages')) {
      context.handle(
        _languagesMeta,
        languages.isAcceptableOrUnknown(data['languages']!, _languagesMeta),
      );
    } else if (isInserting) {
      context.missing(_languagesMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cca2};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      cca2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cca2'],
      )!,
      commonName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}common_name'],
      )!,
      officialName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}official_name'],
      )!,
      capital: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}capital'],
      ),
      region: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region'],
      )!,
      population: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}population'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}area'],
      ),
      flagSvgUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flag_svg_url'],
      )!,
      flagPngUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flag_png_url'],
      )!,
      currencies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currencies'],
      )!,
      languages: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}languages'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final String cca2;
  final String commonName;
  final String officialName;
  final String? capital;
  final String region;
  final int population;
  final double? area;
  final String flagSvgUrl;
  final String flagPngUrl;
  final String currencies;
  final String languages;
  final DateTime addedAt;
  const Favorite({
    required this.cca2,
    required this.commonName,
    required this.officialName,
    this.capital,
    required this.region,
    required this.population,
    this.area,
    required this.flagSvgUrl,
    required this.flagPngUrl,
    required this.currencies,
    required this.languages,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cca2'] = Variable<String>(cca2);
    map['common_name'] = Variable<String>(commonName);
    map['official_name'] = Variable<String>(officialName);
    if (!nullToAbsent || capital != null) {
      map['capital'] = Variable<String>(capital);
    }
    map['region'] = Variable<String>(region);
    map['population'] = Variable<int>(population);
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<double>(area);
    }
    map['flag_svg_url'] = Variable<String>(flagSvgUrl);
    map['flag_png_url'] = Variable<String>(flagPngUrl);
    map['currencies'] = Variable<String>(currencies);
    map['languages'] = Variable<String>(languages);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      cca2: Value(cca2),
      commonName: Value(commonName),
      officialName: Value(officialName),
      capital: capital == null && nullToAbsent
          ? const Value.absent()
          : Value(capital),
      region: Value(region),
      population: Value(population),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
      flagSvgUrl: Value(flagSvgUrl),
      flagPngUrl: Value(flagPngUrl),
      currencies: Value(currencies),
      languages: Value(languages),
      addedAt: Value(addedAt),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      cca2: serializer.fromJson<String>(json['cca2']),
      commonName: serializer.fromJson<String>(json['commonName']),
      officialName: serializer.fromJson<String>(json['officialName']),
      capital: serializer.fromJson<String?>(json['capital']),
      region: serializer.fromJson<String>(json['region']),
      population: serializer.fromJson<int>(json['population']),
      area: serializer.fromJson<double?>(json['area']),
      flagSvgUrl: serializer.fromJson<String>(json['flagSvgUrl']),
      flagPngUrl: serializer.fromJson<String>(json['flagPngUrl']),
      currencies: serializer.fromJson<String>(json['currencies']),
      languages: serializer.fromJson<String>(json['languages']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cca2': serializer.toJson<String>(cca2),
      'commonName': serializer.toJson<String>(commonName),
      'officialName': serializer.toJson<String>(officialName),
      'capital': serializer.toJson<String?>(capital),
      'region': serializer.toJson<String>(region),
      'population': serializer.toJson<int>(population),
      'area': serializer.toJson<double?>(area),
      'flagSvgUrl': serializer.toJson<String>(flagSvgUrl),
      'flagPngUrl': serializer.toJson<String>(flagPngUrl),
      'currencies': serializer.toJson<String>(currencies),
      'languages': serializer.toJson<String>(languages),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  Favorite copyWith({
    String? cca2,
    String? commonName,
    String? officialName,
    Value<String?> capital = const Value.absent(),
    String? region,
    int? population,
    Value<double?> area = const Value.absent(),
    String? flagSvgUrl,
    String? flagPngUrl,
    String? currencies,
    String? languages,
    DateTime? addedAt,
  }) => Favorite(
    cca2: cca2 ?? this.cca2,
    commonName: commonName ?? this.commonName,
    officialName: officialName ?? this.officialName,
    capital: capital.present ? capital.value : this.capital,
    region: region ?? this.region,
    population: population ?? this.population,
    area: area.present ? area.value : this.area,
    flagSvgUrl: flagSvgUrl ?? this.flagSvgUrl,
    flagPngUrl: flagPngUrl ?? this.flagPngUrl,
    currencies: currencies ?? this.currencies,
    languages: languages ?? this.languages,
    addedAt: addedAt ?? this.addedAt,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      cca2: data.cca2.present ? data.cca2.value : this.cca2,
      commonName: data.commonName.present
          ? data.commonName.value
          : this.commonName,
      officialName: data.officialName.present
          ? data.officialName.value
          : this.officialName,
      capital: data.capital.present ? data.capital.value : this.capital,
      region: data.region.present ? data.region.value : this.region,
      population: data.population.present
          ? data.population.value
          : this.population,
      area: data.area.present ? data.area.value : this.area,
      flagSvgUrl: data.flagSvgUrl.present
          ? data.flagSvgUrl.value
          : this.flagSvgUrl,
      flagPngUrl: data.flagPngUrl.present
          ? data.flagPngUrl.value
          : this.flagPngUrl,
      currencies: data.currencies.present
          ? data.currencies.value
          : this.currencies,
      languages: data.languages.present ? data.languages.value : this.languages,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('cca2: $cca2, ')
          ..write('commonName: $commonName, ')
          ..write('officialName: $officialName, ')
          ..write('capital: $capital, ')
          ..write('region: $region, ')
          ..write('population: $population, ')
          ..write('area: $area, ')
          ..write('flagSvgUrl: $flagSvgUrl, ')
          ..write('flagPngUrl: $flagPngUrl, ')
          ..write('currencies: $currencies, ')
          ..write('languages: $languages, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    cca2,
    commonName,
    officialName,
    capital,
    region,
    population,
    area,
    flagSvgUrl,
    flagPngUrl,
    currencies,
    languages,
    addedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.cca2 == this.cca2 &&
          other.commonName == this.commonName &&
          other.officialName == this.officialName &&
          other.capital == this.capital &&
          other.region == this.region &&
          other.population == this.population &&
          other.area == this.area &&
          other.flagSvgUrl == this.flagSvgUrl &&
          other.flagPngUrl == this.flagPngUrl &&
          other.currencies == this.currencies &&
          other.languages == this.languages &&
          other.addedAt == this.addedAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<String> cca2;
  final Value<String> commonName;
  final Value<String> officialName;
  final Value<String?> capital;
  final Value<String> region;
  final Value<int> population;
  final Value<double?> area;
  final Value<String> flagSvgUrl;
  final Value<String> flagPngUrl;
  final Value<String> currencies;
  final Value<String> languages;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.cca2 = const Value.absent(),
    this.commonName = const Value.absent(),
    this.officialName = const Value.absent(),
    this.capital = const Value.absent(),
    this.region = const Value.absent(),
    this.population = const Value.absent(),
    this.area = const Value.absent(),
    this.flagSvgUrl = const Value.absent(),
    this.flagPngUrl = const Value.absent(),
    this.currencies = const Value.absent(),
    this.languages = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String cca2,
    required String commonName,
    required String officialName,
    this.capital = const Value.absent(),
    required String region,
    required int population,
    this.area = const Value.absent(),
    required String flagSvgUrl,
    required String flagPngUrl,
    required String currencies,
    required String languages,
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cca2 = Value(cca2),
       commonName = Value(commonName),
       officialName = Value(officialName),
       region = Value(region),
       population = Value(population),
       flagSvgUrl = Value(flagSvgUrl),
       flagPngUrl = Value(flagPngUrl),
       currencies = Value(currencies),
       languages = Value(languages);
  static Insertable<Favorite> custom({
    Expression<String>? cca2,
    Expression<String>? commonName,
    Expression<String>? officialName,
    Expression<String>? capital,
    Expression<String>? region,
    Expression<int>? population,
    Expression<double>? area,
    Expression<String>? flagSvgUrl,
    Expression<String>? flagPngUrl,
    Expression<String>? currencies,
    Expression<String>? languages,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cca2 != null) 'cca2': cca2,
      if (commonName != null) 'common_name': commonName,
      if (officialName != null) 'official_name': officialName,
      if (capital != null) 'capital': capital,
      if (region != null) 'region': region,
      if (population != null) 'population': population,
      if (area != null) 'area': area,
      if (flagSvgUrl != null) 'flag_svg_url': flagSvgUrl,
      if (flagPngUrl != null) 'flag_png_url': flagPngUrl,
      if (currencies != null) 'currencies': currencies,
      if (languages != null) 'languages': languages,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith({
    Value<String>? cca2,
    Value<String>? commonName,
    Value<String>? officialName,
    Value<String?>? capital,
    Value<String>? region,
    Value<int>? population,
    Value<double?>? area,
    Value<String>? flagSvgUrl,
    Value<String>? flagPngUrl,
    Value<String>? currencies,
    Value<String>? languages,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return FavoritesCompanion(
      cca2: cca2 ?? this.cca2,
      commonName: commonName ?? this.commonName,
      officialName: officialName ?? this.officialName,
      capital: capital ?? this.capital,
      region: region ?? this.region,
      population: population ?? this.population,
      area: area ?? this.area,
      flagSvgUrl: flagSvgUrl ?? this.flagSvgUrl,
      flagPngUrl: flagPngUrl ?? this.flagPngUrl,
      currencies: currencies ?? this.currencies,
      languages: languages ?? this.languages,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cca2.present) {
      map['cca2'] = Variable<String>(cca2.value);
    }
    if (commonName.present) {
      map['common_name'] = Variable<String>(commonName.value);
    }
    if (officialName.present) {
      map['official_name'] = Variable<String>(officialName.value);
    }
    if (capital.present) {
      map['capital'] = Variable<String>(capital.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (population.present) {
      map['population'] = Variable<int>(population.value);
    }
    if (area.present) {
      map['area'] = Variable<double>(area.value);
    }
    if (flagSvgUrl.present) {
      map['flag_svg_url'] = Variable<String>(flagSvgUrl.value);
    }
    if (flagPngUrl.present) {
      map['flag_png_url'] = Variable<String>(flagPngUrl.value);
    }
    if (currencies.present) {
      map['currencies'] = Variable<String>(currencies.value);
    }
    if (languages.present) {
      map['languages'] = Variable<String>(languages.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('cca2: $cca2, ')
          ..write('commonName: $commonName, ')
          ..write('officialName: $officialName, ')
          ..write('capital: $capital, ')
          ..write('region: $region, ')
          ..write('population: $population, ')
          ..write('area: $area, ')
          ..write('flagSvgUrl: $flagSvgUrl, ')
          ..write('flagPngUrl: $flagPngUrl, ')
          ..write('currencies: $currencies, ')
          ..write('languages: $languages, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites];
}

typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      required String cca2,
      required String commonName,
      required String officialName,
      Value<String?> capital,
      required String region,
      required int population,
      Value<double?> area,
      required String flagSvgUrl,
      required String flagPngUrl,
      required String currencies,
      required String languages,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<String> cca2,
      Value<String> commonName,
      Value<String> officialName,
      Value<String?> capital,
      Value<String> region,
      Value<int> population,
      Value<double?> area,
      Value<String> flagSvgUrl,
      Value<String> flagPngUrl,
      Value<String> currencies,
      Value<String> languages,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cca2 => $composableBuilder(
    column: $table.cca2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commonName => $composableBuilder(
    column: $table.commonName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officialName => $composableBuilder(
    column: $table.officialName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get capital => $composableBuilder(
    column: $table.capital,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get flagSvgUrl => $composableBuilder(
    column: $table.flagSvgUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get flagPngUrl => $composableBuilder(
    column: $table.flagPngUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencies => $composableBuilder(
    column: $table.currencies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cca2 => $composableBuilder(
    column: $table.cca2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commonName => $composableBuilder(
    column: $table.commonName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officialName => $composableBuilder(
    column: $table.officialName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get capital => $composableBuilder(
    column: $table.capital,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flagSvgUrl => $composableBuilder(
    column: $table.flagSvgUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flagPngUrl => $composableBuilder(
    column: $table.flagPngUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencies => $composableBuilder(
    column: $table.currencies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languages => $composableBuilder(
    column: $table.languages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cca2 =>
      $composableBuilder(column: $table.cca2, builder: (column) => column);

  GeneratedColumn<String> get commonName => $composableBuilder(
    column: $table.commonName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get officialName => $composableBuilder(
    column: $table.officialName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get capital =>
      $composableBuilder(column: $table.capital, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => column,
  );

  GeneratedColumn<double> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get flagSvgUrl => $composableBuilder(
    column: $table.flagSvgUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get flagPngUrl => $composableBuilder(
    column: $table.flagPngUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencies => $composableBuilder(
    column: $table.currencies,
    builder: (column) => column,
  );

  GeneratedColumn<String> get languages =>
      $composableBuilder(column: $table.languages, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
          Favorite,
          PrefetchHooks Function()
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> cca2 = const Value.absent(),
                Value<String> commonName = const Value.absent(),
                Value<String> officialName = const Value.absent(),
                Value<String?> capital = const Value.absent(),
                Value<String> region = const Value.absent(),
                Value<int> population = const Value.absent(),
                Value<double?> area = const Value.absent(),
                Value<String> flagSvgUrl = const Value.absent(),
                Value<String> flagPngUrl = const Value.absent(),
                Value<String> currencies = const Value.absent(),
                Value<String> languages = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion(
                cca2: cca2,
                commonName: commonName,
                officialName: officialName,
                capital: capital,
                region: region,
                population: population,
                area: area,
                flagSvgUrl: flagSvgUrl,
                flagPngUrl: flagPngUrl,
                currencies: currencies,
                languages: languages,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String cca2,
                required String commonName,
                required String officialName,
                Value<String?> capital = const Value.absent(),
                required String region,
                required int population,
                Value<double?> area = const Value.absent(),
                required String flagSvgUrl,
                required String flagPngUrl,
                required String currencies,
                required String languages,
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion.insert(
                cca2: cca2,
                commonName: commonName,
                officialName: officialName,
                capital: capital,
                region: region,
                population: population,
                area: area,
                flagSvgUrl: flagSvgUrl,
                flagPngUrl: flagPngUrl,
                currencies: currencies,
                languages: languages,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
      Favorite,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
}
