import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/data/model/holding_model.dart';
import 'package:flutter/material.dart';

class HoldingInfo extends StatelessWidget {
  const HoldingInfo({super.key, required this.holding});

  final PortfolioHolding holding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          holding.name,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          holding.symbol,
          style: context.textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.gray300),
          // this color is static because it does not change based on the theme
        ),
      ],
    );
  }
}
