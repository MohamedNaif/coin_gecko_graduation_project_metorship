import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/ui_model/holding_model.dart';
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
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          holding.fiatValueLabel,
          style: context.textTheme.bodyMedium?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: context.theme.colorScheme.tertiary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${holding.dailyChangeLabel} (${holding.dailyChangePercent})',
          style: context.textTheme.bodyMedium?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: context.theme.colorScheme.tertiary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
