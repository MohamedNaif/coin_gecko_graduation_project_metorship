import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/chart_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GradientRingChart extends StatelessWidget {
  const GradientRingChart({super.key});

  @override
  Widget build(BuildContext context) {
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
              sections: [
                _buildLegendItem(context, AppColors.mediumPurple),
                _buildLegendItem(context, AppColors.lightGreen),
                _buildLegendItem(context, AppColors.lightRed),
              ],
            ),
          ),
          Center(
            child: Text(
              r'$143,421.20',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PieChartSectionData _buildLegendItem(BuildContext context, Color color) {
    return PieChartSectionData(
      color: color,
      value: 25,
      title: '',
      radius: context.heightScale(ChartDimensions.legendRadius),
      showTitle: false,
    );
  }
}
