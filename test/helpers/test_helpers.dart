import 'package:mocktail/mocktail.dart';

import 'package:global_explorer/core/network/network_info.dart';
import 'package:global_explorer/features/countries/data/datasources/countries_remote_datasource.dart';
import 'package:global_explorer/features/countries/domain/repositories/countries_repository.dart';

class MockCountriesRepository extends Mock implements CountriesRepository {}

class MockCountriesRemoteDatasource extends Mock
    implements CountriesRemoteDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
