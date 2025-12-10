import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/distibution/distribution_details.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/distibution/gradient_ring_chart.dart';
import 'package:flutter/material.dart';

class DistributionCardSuccessState extends StatelessWidget {
  const DistributionCardSuccessState({
    super.key,
    required this.coins,
  });
  final List<CoinData> coins;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GradientRingChart(
          coins: coins,
        )),
        SizedBox(width: 10),
        Expanded(
            child: DistributionDetails(
          coins: coins,
        )),
      ],
    );
  }
}
