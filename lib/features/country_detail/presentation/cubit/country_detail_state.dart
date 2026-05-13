import 'package:equatable/equatable.dart';

import '../../../countries/domain/entities/country.dart';
import '../../domain/entities/country_image.dart';
import '../../domain/entities/news_article.dart';

sealed class CountryDetailState extends Equatable {
  const CountryDetailState();
}

final class CountryDetailInitial extends CountryDetailState {
  const CountryDetailInitial();

  @override
  List<Object?> get props => [];
}

final class CountryDetailLoading extends CountryDetailState {
  const CountryDetailLoading({required this.country});

  final Country country;

  @override
  List<Object?> get props => [country];
}

final class CountryDetailLoaded extends CountryDetailState {
  const CountryDetailLoaded({
    required this.country,
    required this.isFavorite,
    required this.images,
    required this.news,
    this.hasImagesError = false,
    this.hasNewsError = false,
  });

  final Country country;
  final bool isFavorite;
  final List<CountryImage> images;
  final List<NewsArticle> news;
  final bool hasImagesError;
  final bool hasNewsError;

  CountryDetailLoaded copyWith({bool? isFavorite}) => CountryDetailLoaded(
        country: country,
        isFavorite: isFavorite ?? this.isFavorite,
        images: images,
        news: news,
        hasImagesError: hasImagesError,
        hasNewsError: hasNewsError,
      );

  @override
  List<Object?> get props =>
      [country, isFavorite, images, news, hasImagesError, hasNewsError];
}

final class CountryDetailError extends CountryDetailState {
  const CountryDetailError({required this.country, required this.message});

  final Country country;
  final String message;

  @override
  List<Object?> get props => [country, message];
}
