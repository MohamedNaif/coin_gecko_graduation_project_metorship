import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/balance_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/home_header.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/sections/global_data_section.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/sections/market_data_section.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/sections/trending_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final cubit = context.read<HomeCubit>();
    if (cubit.state.globalData == null) cubit.getGlobalData();
    if (cubit.state.trendingData == null) cubit.getTrendingCoins();
    if (cubit.state.marketData.isEmpty) cubit.getMarkets();
  }

  Future<void> _onRefresh() async {
    await context.read<HomeCubit>().getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: const [
            HomeHeader(),
            BalanceCard(),
            SizedBox(height: 16),
            GlobalDataSection(),
            SizedBox(height: 24),
            TrendingDataSection(),
            SizedBox(height: 24),
            MarketDataSection(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
