import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:global_explorer/core/theme/app_theme.dart';
import 'package:global_explorer/features/country_detail/presentation/widgets/country_stats_section.dart';

import '../../../../helpers/mock_country.dart';

Widget _wrap(ThemeData theme) => MaterialApp(
      theme: theme,
      home: Scaffold(
        body: SingleChildScrollView(
          child: CountryStatsSection(country: tCountry),
        ),
      ),
    );

void main() {
  testWidgets('CountryStatsSection matches golden on light theme', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 520));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_wrap(AppTheme.light));

    await expectLater(
      find.byType(CountryStatsSection),
      matchesGoldenFile('goldens/country_stats_section_light.png'),
    );
  });

  testWidgets('CountryStatsSection matches golden on dark theme', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 520));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_wrap(AppTheme.dark));

    await expectLater(
      find.byType(CountryStatsSection),
      matchesGoldenFile('goldens/country_stats_section_dark.png'),
    );
  });
}
