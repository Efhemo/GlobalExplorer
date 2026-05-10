import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:global_explorer/core/errors/either.dart';
import 'package:global_explorer/core/errors/exceptions.dart';
import 'package:global_explorer/core/errors/failures.dart';
import 'package:global_explorer/features/countries/data/repositories/countries_repository_impl.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  late CountriesRepositoryImpl repository;
  late MockCountriesRemoteDatasource mockDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockDatasource = MockCountriesRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CountriesRepositoryImpl(
      remoteDataSource: mockDatasource,
      networkInfo: mockNetworkInfo,
    );
  });

  void setOnline() =>
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

  void setOffline() =>
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

  group('getAllCountries', () {
    test('returns Left(NetworkFailure) when offline', () async {
      setOffline();
      final result = await repository.getAllCountries();
      expect(result, isA<Left>());
      expect((result as Left).value, isA<NetworkFailure>());
      verifyNever(() => mockDatasource.getAllCountries());
    });

    test('returns Right(countries) when online and datasource succeeds',
        () async {
      setOnline();
      when(() => mockDatasource.getAllCountries()).thenAnswer((_) async => []);
      final result = await repository.getAllCountries();
      expect(result, isA<Right>());
    });

    test('returns Left(NetworkFailure) when datasource throws NetworkException',
        () async {
      setOnline();
      when(() => mockDatasource.getAllCountries())
          .thenThrow(const NetworkException());
      final result = await repository.getAllCountries();
      expect(result, isA<Left>());
      expect((result as Left).value, isA<NetworkFailure>());
    });

    test(
        'returns Left(ServerFailure) when datasource throws ServerException with status code',
        () async {
      setOnline();
      when(() => mockDatasource.getAllCountries())
          .thenThrow(const ServerException('Server error', statusCode: 500));
      final result = await repository.getAllCountries();
      expect(result, isA<Left>());
      final failure = (result as Left).value as ServerFailure;
      expect(failure.statusCode, 500);
    });
  });
}
