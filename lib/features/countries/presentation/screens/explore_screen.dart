import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../domain/entities/country.dart';
import '../blocs/countries_list/countries_list_bloc.dart';
import '../blocs/countries_list/countries_list_event.dart';
import '../blocs/countries_list/countries_list_state.dart';
import '../blocs/country_search/country_search_cubit.dart';
import '../blocs/country_search/country_search_state.dart';
import '../widgets/country_list_tile.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/shimmer_list.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore'), centerTitle: false),
      body: BlocBuilder<CountriesListBloc, CountriesListState>(
        builder: (context, state) => switch (state) {
          CountriesListInitial() ||
          CountriesListLoading() => const ShimmerList(),
          CountriesListError(:final message) => _ErrorView(
            message: message,
            onRetry: () => context.read<CountriesListBloc>().add(
              const CountriesListFetchRequested(),
            ),
          ),
          CountriesListLoaded(:final countries) => _LoadedBody(
            allCountries: countries,
          ),
        },
      ),
    );
  }
}

class _LoadedBody extends StatelessWidget {
  const _LoadedBody({required this.allCountries});

  final List<Country> allCountries;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(
          onChanged: (q) => context.read<CountrySearchCubit>().onQueryChanged(
            q,
            allCountries,
          ),
          onClear: () => context.read<CountrySearchCubit>().clear(),
        ),
        Expanded(
          child: BlocBuilder<CountrySearchCubit, CountrySearchState>(
            builder: (context, search) {
              final displayed = search.isSearching
                  ? search.results
                  : allCountries;

              if (displayed.isEmpty && search.isSearching) {
                return const _EmptySearch();
              }

              return RefreshIndicator(
                onRefresh: () async => context.read<CountriesListBloc>().add(
                  const CountriesListFetchRequested(),
                ),
                child: ListView.separated(
                  itemCount: displayed.length,
                  separatorBuilder: (_, _) =>
                      const Divider(height: 1, indent: 84),
                  itemBuilder: (context, i) {
                    final country = displayed[i];
                    return CountryListTile(
                      country: country,
                      onTap: () => context.pushNamed(
                        RouteNames.exploreDetail,
                        pathParameters: {'cca2': country.cca2},
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 56,
            color: theme.colorScheme.outlineVariant,
          ),
          const SizedBox(height: 12),
          Text(
            'No countries match your search',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 56,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            FilledButton.tonal(
              onPressed: onRetry,
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
