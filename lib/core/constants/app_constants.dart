abstract final class AppConstants {
  static const countriesBaseUrl = 'https://restcountries.com/v3.1/';
  static const unsplashBaseUrl = 'https://api.unsplash.com/';
  static const newsBaseUrl = 'https://newsapi.org/v2/';

  static const connectTimeout = Duration(seconds: 10);
  static const receiveTimeout = Duration(seconds: 15);

  // Limits REST Countries payload from ~800KB to ~80KB
  static const countriesFields =
      'cca2,name,capital,region,subregion,population,area,currencies,languages,flags,latlng,timezones';

  static const unsplashPhotosPerPage = 8;
  static const newsPageSize = 10;
  static const searchDebounceMs = 350;

  // Adaptive layout breakpoints (dp)
  static const mobileBreakpoint = 600.0;
  static const tabletBreakpoint = 840.0;
}
