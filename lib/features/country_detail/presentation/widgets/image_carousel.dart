import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/country_image.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key, required this.images});

  final List<CountryImage> images;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            'Photos',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: images.length,
            itemBuilder: (context, i) => _ImageCard(image: images[i]),
          ),
        ),
      ],
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({required this.image});

  final CountryImage image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ExcludeSemantics(
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 260,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: image.regularUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                  errorWidget: (_, _, _) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.broken_image_outlined),
                  ),
                ),
                if (image.photographerName != null)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Text(
                        'Photo by ${image.photographerName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
