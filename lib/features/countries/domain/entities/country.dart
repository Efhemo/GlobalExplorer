import 'package:equatable/equatable.dart';

class Country extends Equatable {
  const Country({
    required this.cca2,
    required this.commonName,
    required this.officialName,
    required this.region,
    required this.population,
    required this.flagSvgUrl,
    required this.flagPngUrl,
    required this.currencies,
    required this.languages,
    this.capital,
    this.subregion,
    this.area,
  });

  final String cca2;
  final String commonName;
  final String officialName;
  final String? capital;
  final String region;
  final String? subregion;
  final int population;
  final double? area;
  final List<String> currencies;
  final List<String> languages;
  final String flagSvgUrl;
  final String flagPngUrl;

  // cca2 is the stable unique identifier
  @override
  List<Object?> get props => [cca2];
}
