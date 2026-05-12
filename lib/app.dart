import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/countries/presentation/blocs/countries_list/countries_list_bloc.dart';
import 'features/countries/presentation/blocs/countries_list/countries_list_event.dart';
import 'features/countries/presentation/blocs/country_search/country_search_cubit.dart';
import 'features/favorites/presentation/cubit/favorites_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              sl<CountriesListBloc>()..add(const CountriesListFetchRequested()),
        ),
        BlocProvider(create: (_) => sl<CountrySearchCubit>()),
        BlocProvider(create: (_) => sl<FavoritesCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Global Explorer',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
