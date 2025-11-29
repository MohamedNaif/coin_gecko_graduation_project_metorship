import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class DistributionDetails extends StatelessWidget {
  const DistributionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLegendItem(context, AppColors.mediumPurple, r'$54,382.64 BTC'),
        const SizedBox(height: 15),
        _buildLegendItem(context, AppColors.lightGreen, r'$54,382.64 BTC'),
        const SizedBox(height: 15),
        _buildLegendItem(context, AppColors.lightRed, r'$54,382.64 BTC'),
      ],
    );
  }

  _buildLegendItem(BuildContext context, Color color, String text) {
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
          text,
          style: context.textTheme.displayMedium?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
