import 'package:equatable/equatable.dart';

import '../../../domain/entities/country.dart';

sealed class CountriesListState extends Equatable {
  const CountriesListState();
}

final class CountriesListInitial extends CountriesListState {
  const CountriesListInitial();

  @override
  List<Object?> get props => [];
}

final class CountriesListLoading extends CountriesListState {
  const CountriesListLoading();

  @override
  List<Object?> get props => [];
}

final class CountriesListLoaded extends CountriesListState {
  const CountriesListLoaded({
    required this.countries,
    required this.filtered,
  });

  final List<Country> countries;
  final List<Country> filtered;

  CountriesListLoaded copyWith({
    List<Country>? countries,
    List<Country>? filtered,
  }) =>
      CountriesListLoaded(
        countries: countries ?? this.countries,
        filtered: filtered ?? this.filtered,
      );

  @override
  List<Object?> get props => [countries, filtered];
}

final class CountriesListError extends CountriesListState {
  const CountriesListError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
