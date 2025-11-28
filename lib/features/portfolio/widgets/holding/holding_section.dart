import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/features/data/model/holding_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/holding/holding_tile.dart';
import 'package:flutter/material.dart';

class HoldingsSection extends StatelessWidget {
  const HoldingsSection({
    super.key,
  });

// hardcode data for now

  final PortfolioHolding _holdings = const PortfolioHolding(
    name: 'Bitcoin',
    symbol: 'BTC',
    allocationPercent: 50,
    amountLabel: '0.00000000 BTC',
    fiatValueLabel: r'$100,000.00',
    dailyChangeLabel: '100',
    dailyChangePercent: '100%',
    icon: Icons.currency_bitcoin,
    accentColor: AppColors.primaryLight,
  );

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return HoldingTile(
          holding: _holdings,
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 3,
    );
  }
}
