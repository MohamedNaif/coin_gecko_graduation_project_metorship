import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/balance_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/home_header.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_overview.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/trending_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_overview_shimmer.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list_shimmer.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/trending_list_shimmer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(),
                BalanceCard(),
                SizedBox(height: 16),
                MarketOverviewShimmer(),
                SizedBox(height: 24),
                TrendingListShimmer(),
                SizedBox(height: 24),
                TopGainersListShimmer(),
                SizedBox(height: 24),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(),
                const BalanceCard(),
                const SizedBox(height: 16),
                MarketOverview(data: state.globalData),
                const SizedBox(height: 24),
                TrendingList(data: state.trendingData),
                const SizedBox(height: 24),
                TopGainersList(data: state.marketData),
                const SizedBox(height: 24),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
