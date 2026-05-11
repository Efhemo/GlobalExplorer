import 'package:equatable/equatable.dart';

import '../../../domain/entities/country.dart';

class CountrySearchState extends Equatable {
  const CountrySearchState({
    this.query = '',
    this.results = const [],
  });

  final String query;
  final List<Country> results;

  bool get isSearching => query.isNotEmpty;

  CountrySearchState copyWith({String? query, List<Country>? results}) =>
      CountrySearchState(
        query: query ?? this.query,
        results: results ?? this.results,
      );

  @override
  List<Object?> get props => [query, results];
}
