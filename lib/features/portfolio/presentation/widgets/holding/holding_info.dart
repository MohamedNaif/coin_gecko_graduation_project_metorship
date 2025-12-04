import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:flutter/material.dart';

class HoldingInfo extends StatelessWidget {
  const HoldingInfo({super.key, required this.coinsData});

  final CoinData coinsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coinsData.name,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
