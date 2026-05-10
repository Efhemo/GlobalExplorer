import 'package:global_explorer/features/countries/domain/entities/country.dart';

const tCountry = Country(
  cca2: 'CA',
  commonName: 'Canada',
  officialName: 'Canada',
  capital: 'Ottawa',
  region: 'Americas',
  subregion: 'North America',
  population: 38000000,
  area: 9984670.0,
  currencies: ['Canadian Dollar'],
  languages: ['English', 'French'],
  flagSvgUrl: 'https://flagcdn.com/ca.svg',
  flagPngUrl: 'https://flagcdn.com/w320/ca.png',
);

const tCountry2 = Country(
  cca2: 'FR',
  commonName: 'France',
  officialName: 'French Republic',
  capital: 'Paris',
  region: 'Europe',
  subregion: 'Western Europe',
  population: 67000000,
  area: 551695.0,
  currencies: ['Euro'],
  languages: ['French'],
  flagSvgUrl: 'https://flagcdn.com/fr.svg',
  flagPngUrl: 'https://flagcdn.com/w320/fr.png',
);

const tCountries = [tCountry, tCountry2];
