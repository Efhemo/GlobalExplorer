import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../countries/domain/entities/country.dart';

class CountryStatsSection extends StatelessWidget {
  const CountryStatsSection({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Facts',
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _StatCard(
                icon: Icons.people_alt_outlined,
                label: 'Population',
                value: _fmtPopulation(country.population),
              ),
              _StatCard(
                icon: Icons.location_city_outlined,
                label: 'Capital',
                value: country.capital ?? '—',
              ),
              _StatCard(
                icon: Icons.public_outlined,
                label: 'Region',
                value: [?country.subregion, country.region].join(' · '),
              ),
              _StatCard(
                icon: Icons.crop_free_outlined,
                label: 'Area',
                value: _fmtArea(country.area),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (country.languages.isNotEmpty)
            _InfoRow(
              icon: Icons.translate_outlined,
              label: 'Languages',
              value: country.languages.join(', '),
            ),
          if (country.currencies.isNotEmpty)
            _InfoRow(
              icon: Icons.payments_outlined,
              label: 'Currencies',
              value: country.currencies.join(', '),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  String _fmtPopulation(int pop) {
    if (pop >= 1000000000) {
      return '${(pop / 1e9).toStringAsFixed(1)}B';
    }
    if (pop >= 1000000) return '${(pop / 1e6).toStringAsFixed(1)}M';
    if (pop >= 1000) return '${NumberFormat('#,##0').format(pop ~/ 1000)}K';
    return pop.toString();
  }

  String _fmtArea(double? area) {
    if (area == null) return '—';
    if (area >= 1000000) return '${(area / 1e6).toStringAsFixed(2)}M km²';
    return '${NumberFormat('#,##0').format(area.round())} km²';
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 14, color: theme.colorScheme.primary),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: theme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(value, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
