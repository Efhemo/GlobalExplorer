import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:global_explorer/core/errors/either.dart';
import 'package:global_explorer/core/errors/failures.dart';
import 'package:global_explorer/features/countries/presentation/blocs/countries_list/countries_list_bloc.dart';
import 'package:global_explorer/features/countries/presentation/blocs/countries_list/countries_list_event.dart';
import 'package:global_explorer/features/countries/presentation/blocs/countries_list/countries_list_state.dart';

import '../../../../helpers/mock_country.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late MockCountriesRepository mockRepository;

  setUp(() => mockRepository = MockCountriesRepository());

  CountriesListBloc buildBloc() =>
      CountriesListBloc(repository: mockRepository);

  test('initial state is CountriesListInitial', () {
    expect(buildBloc().state, isA<CountriesListInitial>());
  });

  group('CountriesListFetchRequested', () {
    blocTest<CountriesListBloc, CountriesListState>(
      'emits [Loading, Loaded] when fetch succeeds',
      build: () {
        when(() => mockRepository.getAllCountries())
            .thenAnswer((_) async => const Right(tCountries));
        return buildBloc();
      },
      act: (b) => b.add(const CountriesListFetchRequested()),
      expect: () => [
        isA<CountriesListLoading>(),
        isA<CountriesListLoaded>(),
      ],
      verify: (_) => verify(() => mockRepository.getAllCountries()).called(1),
    );

    blocTest<CountriesListBloc, CountriesListState>(
      'Loaded state contains the full country list',
      build: () {
        when(() => mockRepository.getAllCountries())
            .thenAnswer((_) async => const Right(tCountries));
        return buildBloc();
      },
      act: (b) => b.add(const CountriesListFetchRequested()),
      expect: () => [
        isA<CountriesListLoading>(),
        isA<CountriesListLoaded>().having(
          (s) => s.countries,
          'countries',
          tCountries,
        ),
      ],
    );

    blocTest<CountriesListBloc, CountriesListState>(
      'emits [Loading, Error] on NetworkFailure',
      build: () {
        when(() => mockRepository.getAllCountries())
            .thenAnswer((_) async => const Left(NetworkFailure()));
        return buildBloc();
      },
      act: (b) => b.add(const CountriesListFetchRequested()),
      expect: () => [
        isA<CountriesListLoading>(),
        isA<CountriesListError>().having(
          (s) => s.message,
          'message',
          'No internet connection',
        ),
      ],
    );

    blocTest<CountriesListBloc, CountriesListState>(
      'emits [Loading, Error] on ServerFailure',
      build: () {
        when(() => mockRepository.getAllCountries()).thenAnswer(
          (_) async =>
              const Left(ServerFailure('Internal server error', statusCode: 500)),
        );
        return buildBloc();
      },
      act: (b) => b.add(const CountriesListFetchRequested()),
      expect: () => [
        isA<CountriesListLoading>(),
        isA<CountriesListError>().having(
          (s) => s.message,
          'message',
          'Internal server error',
        ),
      ],
    );
  });
}
