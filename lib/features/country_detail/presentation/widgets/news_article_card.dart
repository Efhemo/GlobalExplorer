import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/news_article.dart';

class NewsArticleCard extends StatelessWidget {
  const NewsArticleCard({super.key, required this.article});

  final NewsArticle article;

  Future<void> _open() async {
    final uri = Uri.tryParse(article.url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final date = article.publishedAt;
    final meta = [
      if (article.sourceName != null) article.sourceName!,
      if (date != null) DateFormat('MMM d, yyyy').format(date),
    ].join(' · ');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: _open,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (meta.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        meta,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (article.urlToImage != null) ...[
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    width: 80,
                    height: 70,
                    fit: BoxFit.cover,
                    errorWidget: (_, _, _) => const SizedBox.shrink(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
