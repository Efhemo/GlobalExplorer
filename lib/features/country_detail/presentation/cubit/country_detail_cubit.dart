import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../../../countries/domain/entities/country.dart';
import '../../../favorites/domain/repositories/favorites_repository.dart';
import '../../domain/entities/country_image.dart';
import '../../domain/entities/news_article.dart';
import '../../domain/repositories/images_repository.dart';
import '../../domain/repositories/news_repository.dart';
import 'country_detail_state.dart';

class CountryDetailCubit extends Cubit<CountryDetailState> {
  CountryDetailCubit({
    required ImagesRepository imagesRepository,
    required NewsRepository newsRepository,
    required FavoritesRepository favoritesRepository,
  })  : _imagesRepository = imagesRepository,
        _newsRepository = newsRepository,
        _favoritesRepository = favoritesRepository,
        super(const CountryDetailInitial());

  final ImagesRepository _imagesRepository;
  final NewsRepository _newsRepository;
  final FavoritesRepository _favoritesRepository;

  StreamSubscription<bool>? _favSub;
  bool _isFavorite = false;

  Future<void> load(Country country) async {
    emit(CountryDetailLoading(country: country));

    _favSub?.cancel();
    _favSub = _favoritesRepository.watchIsFavorite(country.cca2).listen(
      (isFav) {
        _isFavorite = isFav;
        final s = state;
        if (s is CountryDetailLoaded) emit(s.copyWith(isFavorite: isFav));
      },
    );

    // Parallel fetch: partial failure is intentional (eagerError: false)
    final results = await Future.wait(
      [
        _imagesRepository.getCountryImages(country.commonName),
        _newsRepository.getCountryNews(country.cca2, country.commonName),
      ],
      eagerError: false,
    );

    if (isClosed) return;

    final images =
        (results[0] as Either<Failure, List<CountryImage>>).getOrNull() ?? [];
    final news =
        (results[1] as Either<Failure, List<NewsArticle>>).getOrNull() ?? [];

    emit(CountryDetailLoaded(
      country: country,
      isFavorite: _isFavorite,
      images: images,
      news: news,
      hasImagesError: results[0].isLeft,
      hasNewsError: results[1].isLeft,
    ));
  }

  Future<void> toggleFavorite(Country country) async {
    if (_isFavorite) {
      await _favoritesRepository.removeFavorite(country.cca2);
    } else {
      await _favoritesRepository.addFavorite(country);
    }
  }

  @override
  Future<void> close() {
    _favSub?.cancel();
    return super.close();
  }
}
