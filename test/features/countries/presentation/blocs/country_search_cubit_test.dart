import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:global_explorer/core/utils/debouncer.dart';
import 'package:global_explorer/features/countries/domain/usecases/search_countries.dart';
import 'package:global_explorer/features/countries/presentation/blocs/country_search/country_search_cubit.dart';
import 'package:global_explorer/features/countries/presentation/blocs/country_search/country_search_state.dart';

import '../../../../helpers/mock_country.dart';

void main() {
  late CountrySearchCubit cubit;

  CountrySearchCubit buildCubit() => CountrySearchCubit(
        searchCountries: const SearchCountries(),
        debouncer: Debouncer(duration: const Duration(milliseconds: 350)),
      );

  setUp(() => cubit = buildCubit());
  tearDown(() => cubit.close());

  test('initial state has empty query and empty results', () {
    expect(cubit.state, const CountrySearchState());
    expect(cubit.state.isSearching, isFalse);
  });

  group('onQueryChanged debounce', () {
    test('does NOT emit before 350ms elapses', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('can', tCountries);
        async.elapse(const Duration(milliseconds: 300));
        // still the initial state — debounce hasn't fired yet
        expect(cubit.state.query, isEmpty);
      });
    });

    test('emits after 350ms elapses', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('can', tCountries);
        async.elapse(const Duration(milliseconds: 400));
        expect(cubit.state.query, 'can');
      });
    });

    test('rapid typing cancels previous timer — only last query fires', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('c', tCountries);
        async.elapse(const Duration(milliseconds: 100));
        cubit.onQueryChanged('ca', tCountries);
        async.elapse(const Duration(milliseconds: 100));
        cubit.onQueryChanged('can', tCountries);
        async.elapse(const Duration(milliseconds: 400));
        // only 'can' should have been emitted
        expect(cubit.state.query, 'can');
      });
    });
  });

  group('onQueryChanged results', () {
    test('empty query returns all countries', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('', tCountries);
        async.elapse(const Duration(milliseconds: 400));
        expect(cubit.state.results, tCountries);
        expect(cubit.state.isSearching, isFalse);
      });
    });

    test('matches on common name (case-insensitive)', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('CANADA', tCountries);
        async.elapse(const Duration(milliseconds: 400));
        expect(cubit.state.results.length, 1);
        expect(cubit.state.results.first.cca2, 'CA');
      });
    });

    test('matches on capital', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('paris', tCountries);
        async.elapse(const Duration(milliseconds: 400));
        expect(cubit.state.results.length, 1);
        expect(cubit.state.results.first.cca2, 'FR');
      });
    });

    test('matches on region', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('europe', tCountries);
        async.elapse(const Duration(milliseconds: 400));
        expect(cubit.state.results.length, 1);
        expect(cubit.state.results.first.cca2, 'FR');
      });
    });

    test('no match returns empty results', () {
      fakeAsync((async) {
        cubit = buildCubit();
        cubit.onQueryChanged('zzz', tCountries);
        async.elapse(const Duration(milliseconds: 400));
        expect(cubit.state.results, isEmpty);
      });
    });
  });
}
