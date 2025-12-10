import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/summary_cart/portfolio_background.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/summary_cart/portfolio_summary_content.dart';
import 'package:flutter/material.dart';

class PortfolioSummaryCard extends StatelessWidget {
  const PortfolioSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _decoration(),
      child: ClipRRect(
        // Clip the bubbles so they don’t overflow outside the card
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            const PortfolioBubbleBackground(
              isTopRight: false,
            ),
            const PortfolioBubbleBackground(
              isTopRight: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.summaryContentHorizontalPadding,
                  vertical: AppDimensions.summaryContentVerticalPadding),
              child: PortfolioSummaryContent(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimensions.summaryCardRadius),
      color: AppColors.deepBlue,
    );
  }
}
