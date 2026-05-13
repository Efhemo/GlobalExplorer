import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/countries/domain/entities/country.dart';
import '../../features/countries/presentation/screens/country_detail_screen.dart';
import '../../features/countries/presentation/screens/explore_screen.dart';
import '../../features/country_detail/presentation/cubit/country_detail_cubit.dart';
import '../../features/favorites/presentation/screens/favorites_screen.dart';
import '../di/injection_container.dart';
import '../widgets/scaffold_with_nav_bar.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RoutePaths.explore,
  debugLogDiagnostics: kDebugMode,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.explore,
              name: RouteNames.explore,
              builder: (context, state) => const ExploreScreen(),
              routes: [
                GoRoute(
                  path: ':cca2',
                  name: RouteNames.exploreDetail,
                  builder: (context, state) {
                    final country = state.extra as Country;
                    return BlocProvider(
                      create: (_) =>
                          sl<CountryDetailCubit>()..load(country),
                      child: CountryDetailScreen(
                        heroTag: 'flag-explore-${country.cca2}',
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.favorites,
              name: RouteNames.favorites,
              builder: (context, state) => const FavoritesScreen(),
              routes: [
                GoRoute(
                  path: ':cca2',
                  name: RouteNames.favoritesDetail,
                  builder: (context, state) {
                    final country = state.extra as Country;
                    return BlocProvider(
                      create: (_) =>
                          sl<CountryDetailCubit>()..load(country),
                      child: CountryDetailScreen(
                        heroTag: 'flag-favorites-${country.cca2}',
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('Page not found: ${state.error}')),
  ),
);
