import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MarketOverviewShimmer extends StatelessWidget {
  const MarketOverviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 24,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildShimmerItem()),
                const SizedBox(width: 12),
                Expanded(child: _buildShimmerItem()),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildShimmerItem()),
                const SizedBox(width: 12),
                Expanded(child: _buildShimmerItem()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 12,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: 100,
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
