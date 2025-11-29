import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/summary_cart/portfolio_background.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/summary_cart/portfolio_summary_content.dart';
import 'package:flutter/material.dart';

class PortfolioSummaryCard extends StatelessWidget {
  const PortfolioSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _decoration(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const PortfolioBubbleBackground(
            isTopRight: false,
          ),
          const PortfolioBubbleBackground(
            isTopRight: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 17),
            child: PortfolioSummaryContent(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: AppColors.cardSummary,
    );
  }
}
