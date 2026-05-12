import 'package:equatable/equatable.dart';

import '../../../countries/domain/entities/country.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();
}

final class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();

  @override
  List<Object?> get props => [];
}

final class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded(this.countries);

  final List<Country> countries;

  bool get isEmpty => countries.isEmpty;

  @override
  List<Object?> get props => [countries];
}

final class FavoritesError extends FavoritesState {
  const FavoritesError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
