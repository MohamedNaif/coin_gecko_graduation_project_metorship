import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:flutter/material.dart';

class DistributionDetails extends StatelessWidget {
  const DistributionDetails({super.key, required this.coins});
  final List<CoinData> coins;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLegendItem(
            context, AppColors.mediumPurple, coins[0].name, coins[0].usd),
        const SizedBox(height: 15),
        _buildLegendItem(
            context, AppColors.lightGreen, coins[1].name, coins[1].usd),
        const SizedBox(height: 15),
        _buildLegendItem(
            context, AppColors.lightRed, coins[2].name, coins[2].usd),
      ],
    );
  }

  _buildLegendItem(BuildContext context, Color color, String name, double usd) {
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
