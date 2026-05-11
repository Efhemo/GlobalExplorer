import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(child: Text('Explore'),
            onTap: () => context.pushNamed(RouteNames.exploreDetail, pathParameters: {"cca2": "CA"})
          ),
      ),
    );
  }
}
