import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/holding/holding_tile.dart';
import 'package:flutter/widgets.dart';

class HoldingSectionSuccessState extends StatelessWidget {
  const HoldingSectionSuccessState({super.key, required this.coins});
  final List<CoinData> coins;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return HoldingTile(
          coinData: coins[index],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: coins.length,
    );
  }
}
