import 'package:global_explorer/features/country_detail/domain/repositories/images_repository.dart';
import 'package:global_explorer/features/country_detail/domain/repositories/news_repository.dart';
import 'package:global_explorer/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'package:global_explorer/core/network/network_info.dart';
import 'package:global_explorer/features/countries/data/datasources/countries_remote_datasource.dart';
import 'package:global_explorer/features/countries/domain/repositories/countries_repository.dart';

class MockCountriesRepository extends Mock implements CountriesRepository {}

class MockCountriesRemoteDatasource extends Mock
    implements CountriesRemoteDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}


class MockImagesRepository extends Mock implements ImagesRepository {}

class MockNewsRepository extends Mock implements NewsRepository {}

class MockFavoritesRepository extends Mock implements FavoritesRepository {}
