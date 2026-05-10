// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryNameDto _$CountryNameDtoFromJson(Map<String, dynamic> json) =>
    CountryNameDto(
      common: json['common'] as String,
      official: json['official'] as String,
    );

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) => CurrencyDto(
  name: json['name'] as String,
  symbol: json['symbol'] as String?,
);

CountryFlagsDto _$CountryFlagsDtoFromJson(Map<String, dynamic> json) =>
    CountryFlagsDto(
      png: json['png'] as String,
      svg: json['svg'] as String,
      alt: json['alt'] as String?,
    );

CountryDto _$CountryDtoFromJson(Map<String, dynamic> json) => CountryDto(
  cca2: json['cca2'] as String,
  name: CountryNameDto.fromJson(json['name'] as Map<String, dynamic>),
  flags: CountryFlagsDto.fromJson(json['flags'] as Map<String, dynamic>),
  region: json['region'] as String,
  capital: (json['capital'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  subregion: json['subregion'] as String?,
  population: (json['population'] as num?)?.toInt(),
  area: (json['area'] as num?)?.toDouble(),
  currencies: (json['currencies'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, CurrencyDto.fromJson(e as Map<String, dynamic>)),
  ),
  languages: (json['languages'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);
