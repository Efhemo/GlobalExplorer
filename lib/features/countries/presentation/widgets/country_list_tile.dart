import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/country.dart';

class CountryListTile extends StatelessWidget {
  const CountryListTile({
    super.key,
    required this.country,
    required this.onTap,
  });

  final Country country;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtitle = [?country.capital, country.region].join(' · ');

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Hero(
              tag: 'flag-explore-${country.cca2}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: country.flagPngUrl,
                  width: 52,
                  height: 40,
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) => Container(
                    width: 50,
                    height: 40,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.flag, size: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.commonName,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.outlineVariant,
            ),
          ],
        ),
      ),
    );
  }
}
