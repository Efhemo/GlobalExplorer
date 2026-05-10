import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/countries_repository.dart';
import 'countries_list_event.dart';
import 'countries_list_state.dart';

class CountriesListBloc
    extends Bloc<CountriesListEvent, CountriesListState> {
  CountriesListBloc({required CountriesRepository repository})
      : _repository = repository,
        super(const CountriesListInitial()) {
    on<CountriesListFetchRequested>(_onFetchRequested);
  }

  final CountriesRepository _repository;

  Future<void> _onFetchRequested(
    CountriesListFetchRequested event,
    Emitter<CountriesListState> emit,
  ) async {
    emit(const CountriesListLoading());
    final result = await _repository.getAllCountries();
    result.fold(
      (failure) => emit(CountriesListError(failure.message)),
      (countries) => emit(
        CountriesListLoaded(countries: countries, filtered: countries),
      ),
    );
  }
}
