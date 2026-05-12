import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../../database/app_database.dart';
import '../../features/countries/data/datasources/countries_remote_datasource.dart';
import '../../features/countries/data/datasources/countries_remote_datasource_impl.dart';
import '../../features/countries/data/repositories/countries_repository_impl.dart';
import '../../features/countries/domain/repositories/countries_repository.dart';
import '../../features/countries/domain/usecases/search_countries.dart';
import '../../features/countries/presentation/blocs/countries_list/countries_list_bloc.dart';
import '../../features/countries/presentation/blocs/country_search/country_search_cubit.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Infrastructure
  sl.registerLazySingleton(Connectivity.new);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Dio clients: one per base URL
  sl.registerLazySingleton(
    DioClient.createCountriesClient,
    instanceName: 'countries',
  );
  sl.registerLazySingleton(
    DioClient.createUnsplashClient,
    instanceName: 'unsplash',
  );
  sl.registerLazySingleton(DioClient.createNewsClient, instanceName: 'news');

  // countries feature
  sl.registerLazySingleton<CountriesRemoteDatasource>(
    () => CountriesRemoteDatasourceImpl(sl(instanceName: 'countries')),
  );
  sl.registerLazySingleton<CountriesRepository>(
    () => CountriesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton(SearchCountries.new);
  sl.registerFactory(() => CountriesListBloc(repository: sl()));
  sl.registerFactory(() => CountrySearchCubit(searchCountries: sl()));
}
