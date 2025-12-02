import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/holding/holding_details.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/holding/holding_info.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/holding/holding_app_card.dart';
import 'package:flutter/material.dart';

class HoldingTile extends StatelessWidget {
  const HoldingTile({
    super.key,
    required this.coinData,
  });

  final CoinData coinData;

  @override
  Widget build(BuildContext context) {
    return HoldingAppCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.holdingTileVerticalPadding,
          horizontal: AppDimensions.holdingTileHorizontalPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.currency_bitcoin),
            const SizedBox(width: 16),
            Expanded(child: HoldingInfo(coinsData: coinData)),
            const SizedBox(width: 16),
            Expanded(flex: 2, child: HoldingDetails(coinData: coinData)),
          ],
        ),
      ),
    );
  }
}
