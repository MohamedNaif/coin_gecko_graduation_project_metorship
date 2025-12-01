import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/distibution/distribution_details.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/distibution/gradient_ring_chart.dart';
import 'package:flutter/material.dart';

class DistributionCard extends StatelessWidget {
  const DistributionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: GradientRingChart()),
        SizedBox(width: 10),
        Expanded(child: DistributionDetails()),
      ],
    );
  }
}
