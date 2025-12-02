import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/chart_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GradientRingChart extends StatelessWidget {
  const GradientRingChart({
    super.key,
    required this.coins,
  });

  final List<CoinData> coins;

  @override
  Widget build(BuildContext context) {
    final totalValue = _calculateTotalValue();

    return SizedBox(
      width: context.widthScale(ChartDimensions.chartWidth),
      height: context.heightScale(ChartDimensions.chartHeight),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius:
                  context.heightScale(ChartDimensions.centerSpaceRadius),
              startDegreeOffset: ChartDimensions.startDegreeOffset,
              sections: _buildSections(context, totalValue),
            ),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOut,
          ),

          // Total Value
          Center(
            child: Text(
              '\$${totalValue.toStringAsFixed(2)}',
              style: context.textTheme.displayLarge?.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildSections(
      BuildContext context, double totalValue) {
    const minPercent = 3;
    final colors = [
      AppColors.mediumPurple,
      AppColors.lightGreen,
      AppColors.lightRed,
    ];

    return List.generate(coins.length, (index) {
      final coin = coins[index];
      double percent = _calculatePercentage(coin.usd, totalValue);

      if (percent < minPercent) percent = minPercent.toDouble();

      return PieChartSectionData(
        color: colors[index % colors.length],
        value: percent,
        radius: context.heightScale(ChartDimensions.legendRadius),
        showTitle: false,
      );
    });
  }

  double _calculatePercentage(double value, double totalValue) {
    if (totalValue == 0) return 0;
    return (value / totalValue) * 100;
  }

  double _calculateTotalValue() {
    return coins.fold(0.0, (sum, coin) => sum + coin.usd);
  }
}
