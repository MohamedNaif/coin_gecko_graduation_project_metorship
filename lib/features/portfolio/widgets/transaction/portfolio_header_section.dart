import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/distibution/distribution_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/summary_cart/portfolio_summary_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/tab_bar/month_filter_bar.dart';
import 'package:flutter/material.dart';

class PortfolioHeaderSection extends StatelessWidget {
  const PortfolioHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppDimensions.portfolioHeaderSectionPadding)
          .copyWith(top: AppDimensions.portfolioHeaderSectionTopPadding),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context, 'Portfolio'),
            const SizedBox(height: 33),
            const PortfolioSummaryCard(),
            const SizedBox(height: 27),
            const MonthFilterBar(),
            const SizedBox(height: 27),
            const DistributionCard(),
            const SizedBox(height: 27),
            _buildSectionTitle(context, 'My Holdings'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: context.theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.headlineLarge?.copyWith(
        fontSize: 23,
        fontWeight: FontWeight.w700,
        color: context.theme.colorScheme.onSurface,
      ),
    );
  }
}
