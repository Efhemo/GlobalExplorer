import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:global_explorer/features/countries/domain/entities/country.dart';
import 'package:global_explorer/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:global_explorer/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:global_explorer/features/favorites/presentation/cubit/favorites_state.dart';

import '../../../helpers/mock_country.dart';

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

void main() {
  setUpAll(() => registerFallbackValue(tCountry));

  late MockFavoritesRepository repository;
  late StreamController<List<Country>> favoritesController;

  setUp(() {
    repository = MockFavoritesRepository();
    favoritesController = StreamController<List<Country>>.broadcast();

    when(() => repository.watchAllFavorites())
        .thenAnswer((_) => favoritesController.stream);
  });

  tearDown(() {
    favoritesController.close();
  });

  FavoritesCubit buildCubit() =>
      FavoritesCubit(repository: repository);

  group('FavoritesCubit', () {
    test('initial state is FavoritesInitial', () {
      final cubit = buildCubit();
      expect(cubit.state, isA<FavoritesInitial>());
      cubit.close();
    });

    blocTest<FavoritesCubit, FavoritesState>(
      'emits FavoritesLoaded with countries when stream emits a list',
      build: buildCubit,
      act: (cubit) => favoritesController.add(tCountries),
      expect: () => [FavoritesLoaded(tCountries)],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'emits FavoritesLoaded with empty list when stream emits empty',
      build: buildCubit,
      act: (cubit) => favoritesController.add(const []),
      expect: () => [const FavoritesLoaded([])],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'emits multiple FavoritesLoaded states as stream updates',
      build: buildCubit,
      act: (cubit) {
        favoritesController.add([tCountry]);
        favoritesController.add(tCountries);
      },
      expect: () => [
        FavoritesLoaded([tCountry]),
        FavoritesLoaded(tCountries),
      ],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'emits FavoritesError when stream emits an error',
      build: buildCubit,
      act: (cubit) =>
          favoritesController.addError(Exception('Database failure')),
      expect: () => [isA<FavoritesError>()],
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'addFavorite delegates to repository',
      build: buildCubit,
      setUp: () {
        when(() => repository.addFavorite(any()))
            .thenAnswer((_) async {});
      },
      act: (cubit) => cubit.addFavorite(tCountry),
      verify: (_) {
        verify(() => repository.addFavorite(tCountry)).called(1);
      },
    );

    blocTest<FavoritesCubit, FavoritesState>(
      'removeFavorite delegates to repository',
      build: buildCubit,
      setUp: () {
        when(() => repository.removeFavorite(any()))
            .thenAnswer((_) async {});
      },
      act: (cubit) => cubit.removeFavorite(tCountry.cca2),
      verify: (_) {
        verify(() => repository.removeFavorite(tCountry.cca2)).called(1);
      },
    );

    test('watchIsFavorite delegates to repository', () {
      final isFavoriteController = StreamController<bool>();
      when(() => repository.watchIsFavorite(any()))
          .thenAnswer((_) => isFavoriteController.stream);

      final cubit = buildCubit();
      final stream = cubit.watchIsFavorite(tCountry.cca2);

      expect(stream, emits(true));
      isFavoriteController.add(true);

      addTearDown(() {
        cubit.close();
        isFavoriteController.close();
      });
    });

    test('cancels stream subscription on close', () async {
      final cubit = buildCubit();
      final states = <FavoritesState>[];
      final sub = cubit.stream.listen(states.add);

      favoritesController.add(tCountries);
      await Future<void>.delayed(Duration.zero); // let stream propagate

      await cubit.close();
      await sub.cancel();

      favoritesController.add(const []); // should not reach closed cubit
      await Future<void>.delayed(Duration.zero);

      expect(states, [FavoritesLoaded(tCountries)]);
    });
  });
}
