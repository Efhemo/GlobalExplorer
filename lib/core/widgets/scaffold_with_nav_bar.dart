import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_constants.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _destinations = [
    (icon: Icons.explore_outlined, selected: Icons.explore, label: 'Explore'),
    (icon: Icons.favorite_outline, selected: Icons.favorite, label: 'Favorites'),
  ];

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= AppConstants.mobileBreakpoint) {
      return _SideNavLayout(
        navigationShell: navigationShell,
        extended: width >= AppConstants.tabletBreakpoint,
        destinations: _destinations,
        onTap: _onTap,
      );
    }

    return _BottomNavLayout(
      navigationShell: navigationShell,
      destinations: _destinations,
      onTap: _onTap,
    );
  }
}


class _BottomNavLayout extends StatelessWidget {
  const _BottomNavLayout({
    required this.navigationShell,
    required this.destinations,
    required this.onTap,
  });

  final StatefulNavigationShell navigationShell;
  final List<({IconData icon, IconData selected, String label})> destinations;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: onTap,
        destinations: [
          for (final d in destinations)
            NavigationDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selected),
              label: d.label,
            ),
        ],
      ),
    );
  }
}


class _SideNavLayout extends StatelessWidget {
  const _SideNavLayout({
    required this.navigationShell,
    required this.extended,
    required this.destinations,
    required this.onTap,
  });

  final StatefulNavigationShell navigationShell;
  final bool extended;
  final List<({IconData icon, IconData selected, String label})> destinations;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Theme override suppresses the pill-shaped ink splash on the rail
          // without affecting the rest of the scaffold
          Theme(
            data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: NavigationRail(
            extended: extended,
            useIndicator: false,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: onTap,
            labelType: extended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.selected,
            selectedIconTheme: const IconThemeData(
              color: Color(0xFF1A6EBD),
              size: 24,
            ),
            selectedLabelTextStyle: const TextStyle(
              color: Color(0xFF1A6EBD),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
            destinations: [
              for (final d in destinations)
                NavigationRailDestination(
                  icon: Icon(d.icon),
                  selectedIcon: Icon(d.selected),
                  label: Text(d.label),
                ),
            ],
          ),         // close NavigationRail
          ),         // close Theme
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}
