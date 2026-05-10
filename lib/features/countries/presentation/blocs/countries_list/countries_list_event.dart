import 'package:equatable/equatable.dart';

sealed class CountriesListEvent extends Equatable {
  const CountriesListEvent();
}

final class CountriesListFetchRequested extends CountriesListEvent {
  const CountriesListFetchRequested();

  @override
  List<Object?> get props => [];
}
