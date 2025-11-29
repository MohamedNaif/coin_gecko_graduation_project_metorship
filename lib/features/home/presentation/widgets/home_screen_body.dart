import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/balance_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/home_header.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_overview.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/trending_list.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(),
          BalanceCard(),
          SizedBox(height: 16),
          MarketOverview(),
          SizedBox(height: 24),
          TrendingList(),
          SizedBox(height: 24),
          TopGainersList(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
