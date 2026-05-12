import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../countries/domain/entities/country.dart';
import '../../domain/repositories/favorites_repository.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required FavoritesRepository repository})
      : _repository = repository,
        super(const FavoritesInitial()) {
    _subscription = _repository.watchAllFavorites().listen(
      (countries) => emit(FavoritesLoaded(countries)),
      onError: (Object e) => emit(FavoritesError(e.toString())),
    );
  }

  final FavoritesRepository _repository;
  StreamSubscription<List<Country>>? _subscription;

  Future<void> addFavorite(Country country) =>
      _repository.addFavorite(country);

  Future<void> removeFavorite(String cca2) =>
      _repository.removeFavorite(cca2);

  Stream<bool> watchIsFavorite(String cca2) =>
      _repository.watchIsFavorite(cca2);

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
