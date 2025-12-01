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

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getGlobalData();
    context.read<HomeCubit>().getTrendingCoins();
    context.read<HomeCubit>().getMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeHeader(),
          const BalanceCard(),
          const SizedBox(height: 16),

          // Global Data Section
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.globalDataStatus != current.globalDataStatus,
            builder: (context, state) {
              if (state.globalDataStatus == HomeDataStatus.loading) {
                return const MarketOverviewShimmer();
              } else if (state.globalDataStatus == HomeDataStatus.failure) {
                return CustomErrorWidget(
                  errorMessage:
                      state.errorMessage ?? 'Failed to load global data',
                  onRetry: () => context.read<HomeCubit>().getGlobalData(),
                );
              } else if (state.globalData != null) {
                return MarketOverview(data: state.globalData!);
              }
              return const SizedBox.shrink();
            },
          ),

          const SizedBox(height: 24),

          // Trending Data Section
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.trendingDataStatus != current.trendingDataStatus,
            builder: (context, state) {
              if (state.trendingDataStatus == HomeDataStatus.loading) {
                return const TrendingListShimmer();
              } else if (state.trendingDataStatus == HomeDataStatus.failure) {
                return CustomErrorWidget(
                  errorMessage:
                      state.errorMessage ?? 'Failed to load trending coins',
                  onRetry: () => context.read<HomeCubit>().getTrendingCoins(),
                );
              } else if (state.trendingData != null) {
                return TrendingList(data: state.trendingData!);
              }
              return const SizedBox.shrink();
            },
          ),

          const SizedBox(height: 24),

          // Market Data Section
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.marketDataStatus != current.marketDataStatus,
            builder: (context, state) {
              if (state.marketDataStatus == HomeDataStatus.loading &&
                  state.marketData.isEmpty) {
                return const TopGainersListShimmer();
              } else if (state.marketDataStatus == HomeDataStatus.failure &&
                  state.marketData.isEmpty) {
                return CustomErrorWidget(
                  errorMessage:
                      state.errorMessage ?? 'Failed to load market data',
                  onRetry: () => context.read<HomeCubit>().getMarkets(),
                );
              } else if (state.marketData.isNotEmpty) {
                return TopGainersList(data: state.marketData);
              }
              return const SizedBox.shrink();
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
