import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../country_detail/presentation/cubit/country_detail_cubit.dart';
import '../../../country_detail/presentation/cubit/country_detail_state.dart';
import '../../../country_detail/presentation/widgets/country_stats_section.dart';
import '../../../country_detail/presentation/widgets/image_carousel.dart';
import '../../../country_detail/presentation/widgets/news_article_card.dart';
import '../../domain/entities/country.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key, required this.heroTag});

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryDetailCubit, CountryDetailState>(
      builder: (context, state) => switch (state) {
        CountryDetailInitial() => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        CountryDetailLoading(:final country) => _DetailScaffold(
          country: country,
          heroTag: heroTag,
          loading: true,
        ),
        CountryDetailLoaded() => _DetailScaffold.loaded(
          state: state,
          heroTag: heroTag,
        ),
        CountryDetailError(:final country, :final message) =>
          _DetailScaffold.error(
            country: country,
            message: message,
            heroTag: heroTag,
            onRetry: () => context.read<CountryDetailCubit>().load(country),
          ),
      },
    );
  }
}

class _DetailScaffold extends StatelessWidget {
  const _DetailScaffold({
    required this.country,
    required this.heroTag,
    this.loading = false,
    this.loaded,
    this.errorMessage,
    this.onRetry,
  });

  factory _DetailScaffold.loaded({
    required CountryDetailLoaded state,
    required String heroTag,
  }) =>
      _DetailScaffold(country: state.country, heroTag: heroTag, loaded: state);

  factory _DetailScaffold.error({
    required Country country,
    required String message,
    required String heroTag,
    required VoidCallback onRetry,
  }) => _DetailScaffold(
    country: country,
    heroTag: heroTag,
    errorMessage: message,
    onRetry: onRetry,
  );

  final Country country;
  final String heroTag;
  final bool loading;
  final CountryDetailLoaded? loaded;
  final String? errorMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            stretch: true,
            actions: [
              if (loaded != null)
                BlocBuilder<CountryDetailCubit, CountryDetailState>(
                  buildWhen: (p, c) =>
                      c is CountryDetailLoaded &&
                      (p is! CountryDetailLoaded ||
                          p.isFavorite != c.isFavorite),
                  builder: (context, state) {
                    final isFav =
                        state is CountryDetailLoaded && state.isFavorite;
                    return IconButton(
                      tooltip: isFav
                          ? 'Remove from favorites'
                          : 'Add to favorites',
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav
                            ? theme.colorScheme.error
                            : theme.colorScheme.onSurface,
                      ),
                      onPressed: () => context
                          .read<CountryDetailCubit>()
                          .toggleFavorite(country),
                    );
                  },
                ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                country.commonName,
                style: const TextStyle(
                  shadows: [Shadow(blurRadius: 4, color: Colors.black54)],
                ),
              ),
              background: Semantics(
                label: '${country.commonName} flag',
                image: true,
                child: Hero(
                  tag: heroTag,
                  child: CachedNetworkImage(
                    imageUrl: country.flagPngUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_, _, _) => Container(
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: const Icon(Icons.flag_outlined, size: 48),
                    ),
                  ),
                ),
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
            ),
          ),
          if (loading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (errorMessage != null)
            SliverFillRemaining(
              child: _ErrorBody(message: errorMessage!, onRetry: onRetry!),
            )
          else if (loaded != null)
            _LoadedContent(state: loaded!),
        ],
      ),
    );
  }
}

class _LoadedContent extends StatelessWidget {
  const _LoadedContent({required this.state});

  final CountryDetailLoaded state;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        CountryStatsSection(country: state.country),
        if (state.images.isNotEmpty) ImageCarousel(images: state.images),
        if (state.news.isNotEmpty) ...[
          _NewsSectionHeader(hasError: state.hasNewsError),
          ...state.news.map((a) => NewsArticleCard(article: a)),
          const SizedBox(height: 24),
        ],
      ]),
    );
  }
}

class _NewsSectionHeader extends StatelessWidget {
  const _NewsSectionHeader({this.hasError = false});

  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
      child: Row(
        children: [
          Text(
            'Latest News',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (hasError) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.warning_amber_rounded,
              size: 16,
              color: theme.colorScheme.error,
            ),
          ],
        ],
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message, required this.onRetry});

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
            Text(message, textAlign: TextAlign.center),
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
