import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/portfolio_summary_card.dart';
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
