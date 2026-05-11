import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/debouncer.dart';
import '../../../domain/entities/country.dart';
import '../../../domain/usecases/search_countries.dart';
import 'country_search_state.dart';

class CountrySearchCubit extends Cubit<CountrySearchState> {
  CountrySearchCubit({
    required SearchCountries searchCountries,
    Debouncer? debouncer,
  })  : _searchCountries = searchCountries,
        _debouncer = debouncer ??
            Debouncer(
              duration: const Duration(milliseconds: 300),
            ),
        super(const CountrySearchState());

  final SearchCountries _searchCountries;
  final Debouncer _debouncer;

  void onQueryChanged(String query, List<Country> allCountries) {
    _debouncer.run(() {
      final results = _searchCountries(allCountries, query);
      emit(CountrySearchState(query: query, results: results));
    });
  }

  void clear() {
    _debouncer.dispose();
    emit(const CountrySearchState());
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
