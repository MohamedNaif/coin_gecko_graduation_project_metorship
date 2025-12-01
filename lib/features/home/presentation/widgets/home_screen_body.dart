import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/balance_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/home_header.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_overview.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/trending_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_error_widget.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_overview_shimmer.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list_shimmer.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/trending_list_shimmer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.globalDataStatus == HomeDataStatus.loading ||
            state.trendingDataStatus == HomeDataStatus.loading ||
            state.marketDataStatus == HomeDataStatus.loading) {
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
        } else if (state.globalDataStatus == HomeDataStatus.failure ||
            state.trendingDataStatus == HomeDataStatus.failure ||
            state.marketDataStatus == HomeDataStatus.failure) {
          // handle error with better ui ux to enhance user experience
          return CustomErrorWidget(
            errorMessage: state.errorMessage ?? 'Something went wrong',
            onRetry: () => context.read<HomeCubit>().getAllData(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(),
                const BalanceCard(),
                const SizedBox(height: 16),
                if (state.globalData != null)
                  MarketOverview(data: state.globalData!),
                const SizedBox(height: 24),
                if (state.trendingData != null)
                  TrendingList(data: state.trendingData!),
                const SizedBox(height: 24),
                TopGainersList(data: state.marketData),
                const SizedBox(height: 24),
              ],
            ),
          );
        }
      },
    );
  }
}
