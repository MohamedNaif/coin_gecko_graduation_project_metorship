import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/data/model/holding_model.dart';
import 'package:flutter/material.dart';

class HoldingDetails extends StatelessWidget {
  const HoldingDetails({super.key, required this.holding});

  final PortfolioHolding holding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${holding.allocationPercent.toStringAsFixed(0)}%',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          holding.fiatValueLabel,
          style: context.textTheme.bodyMedium?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: AppColors.successLight,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${holding.dailyChangeLabel} (${holding.dailyChangePercent})',
          style: context.textTheme.bodyMedium?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: AppColors.successLight,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
