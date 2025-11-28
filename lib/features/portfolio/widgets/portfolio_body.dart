import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/distibution/distribution_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/holding/holding_section.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/tab_bar/month_filter_bar.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/summary_cart/portfolio_summary_card.dart';
import 'package:flutter/material.dart';

class PortfolioBody extends StatelessWidget {
  const PortfolioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(right: 22, left: 22, top: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portfolio',
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 33),
                  const PortfolioSummaryCard(),
                  const SizedBox(height: 27),
                  const MonthFilterBar(),
                  const SizedBox(height: 27),
                  const DistributionCard(),
                  const SizedBox(height: 27),
                  Text(
                    'My Holdings',
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const HoldingsSection(),
        ],
      ),
    );
  }
}
