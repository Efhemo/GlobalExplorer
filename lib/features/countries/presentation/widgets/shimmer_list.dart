import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key, this.itemCount = 14});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: cs.surfaceContainerHighest,
      highlightColor: cs.surface,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (_, _) => const _ShimmerTile(),
      ),
    );
  }
}

class _ShimmerTile extends StatelessWidget {
  const _ShimmerTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 14, width: 130, color: Colors.white),
                const SizedBox(height: 6),
                Container(height: 12, width: 90, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
