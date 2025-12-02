import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:flutter/material.dart';

class HoldingDetails extends StatelessWidget {
  const HoldingDetails({super.key, required this.coinData});

  final CoinData coinData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${coinData.usd} \$',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          coinData.usdChange.toStringAsFixed(4),
          style: context.textTheme.bodyMedium?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: context.theme.colorScheme.tertiary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
