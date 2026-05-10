import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/country.dart';

part 'country_dto.g.dart';

@JsonSerializable(createToJson: false)
class CountryNameDto {
  const CountryNameDto({required this.common, required this.official});

  final String common;
  final String official;

  factory CountryNameDto.fromJson(Map<String, dynamic> json) =>
      _$CountryNameDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class CurrencyDto {
  const CurrencyDto({required this.name, this.symbol});

  final String name;
  final String? symbol;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class CountryFlagsDto {
  const CountryFlagsDto({required this.png, required this.svg, this.alt});

  final String png;
  final String svg;
  final String? alt;

  factory CountryFlagsDto.fromJson(Map<String, dynamic> json) =>
      _$CountryFlagsDtoFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class CountryDto {
  const CountryDto({
    required this.cca2,
    required this.name,
    required this.flags,
    required this.region,
    this.capital,
    this.subregion,
    this.population,
    this.area,
    this.currencies,
    this.languages,
  });

  final String cca2;
  final CountryNameDto name;
  final CountryFlagsDto flags;
  final String region;
  final String? subregion;
  final List<String>? capital;
  final int? population;
  final double? area;
  // API returns Map<currencyCode, CurrencyDto> — e.g. {"USD": {"name": "...", "symbol": "$"}}
  final Map<String, CurrencyDto>? currencies;
  // API returns Map<langCode, langName> — e.g. {"eng": "English"}
  final Map<String, String>? languages;

  factory CountryDto.fromJson(Map<String, dynamic> json) =>
      _$CountryDtoFromJson(json);

  Country toDomain() => Country(
        cca2: cca2,
        commonName: name.common,
        officialName: name.official,
        capital: capital?.isNotEmpty == true ? capital!.first : null,
        region: region,
        subregion: subregion,
        population: population ?? 0,
        area: area,
        currencies: currencies?.values.map((c) => c.name).toList() ?? [],
        languages: languages?.values.toList() ?? [],
        flagSvgUrl: flags.svg,
        flagPngUrl: flags.png,
      );
}
