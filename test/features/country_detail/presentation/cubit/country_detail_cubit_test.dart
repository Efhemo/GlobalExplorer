import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:global_explorer/core/errors/either.dart';
import 'package:global_explorer/core/errors/failures.dart';
import 'package:global_explorer/features/country_detail/domain/entities/country_image.dart';
import 'package:global_explorer/features/country_detail/domain/entities/news_article.dart';
import 'package:global_explorer/features/country_detail/domain/repositories/images_repository.dart';
import 'package:global_explorer/features/country_detail/domain/repositories/news_repository.dart';
import 'package:global_explorer/features/country_detail/presentation/cubit/country_detail_cubit.dart';
import 'package:global_explorer/features/country_detail/presentation/cubit/country_detail_state.dart';
import 'package:global_explorer/features/favorites/domain/repositories/favorites_repository.dart';

import '../../../../helpers/mock_country.dart';
import '../../../../helpers/test_helpers.dart';



const tImages = [
  CountryImage(
    id: 'img1',
    smallUrl: 'https://small.jpg',
    regularUrl: 'https://regular.jpg',
  ),
];

const tNews = [
  NewsArticle(title: 'Canada headline', url: 'https://news.example.com/1'),
];

void main() {
  setUpAll(() {
    registerFallbackValue(tCountry);
  });

  late MockImagesRepository imagesRepo;
  late MockNewsRepository newsRepo;
  late MockFavoritesRepository favoritesRepo;
  late StreamController<bool> isFavController;

  setUp(() {
    imagesRepo = MockImagesRepository();
    newsRepo = MockNewsRepository();
    favoritesRepo = MockFavoritesRepository();
    isFavController = StreamController<bool>.broadcast();

    when(() => favoritesRepo.watchIsFavorite(any()))
        .thenAnswer((_) => isFavController.stream);
  });

  tearDown(() => isFavController.close());

  CountryDetailCubit buildCubit() => CountryDetailCubit(
        imagesRepository: imagesRepo,
        newsRepository: newsRepo,
        favoritesRepository: favoritesRepo,
      );

  group('CountryDetailCubit', () {
    test('initial state is CountryDetailInitial', () {
      expect(buildCubit().state, isA<CountryDetailInitial>());
    });

    blocTest<CountryDetailCubit, CountryDetailState>(
      'load emits Loading then Loaded when both succeed',
      setUp: () {
        when(() => imagesRepo.getCountryImages(any()))
            .thenAnswer((_) async => const Right(tImages));
        when(() => newsRepo.getCountryNews(any(), any()))
            .thenAnswer((_) async => const Right(tNews));
      },
      build: buildCubit,
      act: (c) => c.load(tCountry),
      expect: () => [
        CountryDetailLoading(country: tCountry),
        CountryDetailLoaded(
          country: tCountry,
          isFavorite: false,
          images: tImages,
          news: tNews,
        ),
      ],
    );

    blocTest<CountryDetailCubit, CountryDetailState>(
      'load emits Loaded with empty images and error flag when images fail',
      setUp: () {
        when(() => imagesRepo.getCountryImages(any()))
            .thenAnswer((_) async => const Left(ServerFailure('Unsplash error')));
        when(() => newsRepo.getCountryNews(any(), any()))
            .thenAnswer((_) async => const Right(tNews));
      },
      build: buildCubit,
      act: (c) => c.load(tCountry),
      expect: () => [
        CountryDetailLoading(country: tCountry),
        CountryDetailLoaded(
          country: tCountry,
          isFavorite: false,
          images: const [],
          news: tNews,
          hasImagesError: true,
        ),
      ],
    );

    blocTest<CountryDetailCubit, CountryDetailState>(
      'load emits Loaded with empty news and error flag when news fails',
      setUp: () {
        when(() => imagesRepo.getCountryImages(any()))
            .thenAnswer((_) async => const Right(tImages));
        when(() => newsRepo.getCountryNews(any(), any()))
            .thenAnswer((_) async => const Left(NetworkFailure()));
      },
      build: buildCubit,
      act: (c) => c.load(tCountry),
      expect: () => [
        CountryDetailLoading(country: tCountry),
        CountryDetailLoaded(
          country: tCountry,
          isFavorite: false,
          images: tImages,
          news: const [],
          hasNewsError: true,
        ),
      ],
    );

    blocTest<CountryDetailCubit, CountryDetailState>(
      'isFavorite updates when watchIsFavorite stream emits after Loaded',
      setUp: () {
        when(() => imagesRepo.getCountryImages(any()))
            .thenAnswer((_) async => const Right(tImages));
        when(() => newsRepo.getCountryNews(any(), any()))
            .thenAnswer((_) async => const Right(tNews));
      },
      build: buildCubit,
      act: (c) async {
        await c.load(tCountry);
        isFavController.add(true);
        await Future<void>.delayed(Duration.zero);
      },
      expect: () => [
        CountryDetailLoading(country: tCountry),
        CountryDetailLoaded(
          country: tCountry,
          isFavorite: false,
          images: tImages,
          news: tNews,
        ),
        CountryDetailLoaded(
          country: tCountry,
          isFavorite: true,
          images: tImages,
          news: tNews,
        ),
      ],
    );

    blocTest<CountryDetailCubit, CountryDetailState>(
      'toggleFavorite calls addFavorite when not currently favorite',
      setUp: () {
        when(() => favoritesRepo.addFavorite(any())).thenAnswer((_) async {});
      },
      build: buildCubit,
      act: (c) => c.toggleFavorite(tCountry),
      verify: (_) => verify(() => favoritesRepo.addFavorite(tCountry)).called(1),
    );

    blocTest<CountryDetailCubit, CountryDetailState>(
      'toggleFavorite calls removeFavorite when currently favorite',
      setUp: () {
        when(() => imagesRepo.getCountryImages(any()))
            .thenAnswer((_) async => const Right(tImages));
        when(() => newsRepo.getCountryNews(any(), any()))
            .thenAnswer((_) async => const Right(tNews));
        when(() => favoritesRepo.removeFavorite(any()))
            .thenAnswer((_) async {});
      },
      build: buildCubit,
      act: (c) async {
        await c.load(tCountry);
        isFavController.add(true);
        await Future<void>.delayed(Duration.zero);
        await c.toggleFavorite(tCountry);
      },
      verify: (_) =>
          verify(() => favoritesRepo.removeFavorite(tCountry.cca2)).called(1),
    );
  });
}
