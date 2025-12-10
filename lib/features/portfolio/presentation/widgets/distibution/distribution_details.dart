import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:flutter/material.dart';

class DistributionDetails extends StatelessWidget {
  DistributionDetails({super.key, required this.coins});
  final List<CoinData> coins;

  final List<Color> _colors = [
    AppColors.lightRed,
    AppColors.lightGreen,
    AppColors.mediumPurple,
  ];

  @override
  Widget build(BuildContext context) {
    final visibleCoins = coins.take(3).toList(); // limit 3

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleCoins.length,
          itemBuilder: (context, index) {
            final coin = visibleCoins[index];
            final color = _colors[index % _colors.length];

            return _buildLegendItem(
              context,
              color,
              coin.name,
              coin.usd ?? 0,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 15),
        ),
      ],
    );
  }

  Widget _buildLegendItem(
      BuildContext context, Color color, String name, double usd) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '\$ $usd ${name.toUpperCase()}',
          style: context.textTheme.displayMedium?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
