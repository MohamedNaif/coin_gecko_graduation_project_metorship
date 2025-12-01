import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/responsive_app_extensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_error_widget.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_coin_item.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: const TrendingScreenBody(),
    );
  }
}

class TrendingScreenBody extends StatefulWidget {
  const TrendingScreenBody({super.key});

  @override
  State<TrendingScreenBody> createState() => _TrendingScreenBodyState();
}

class _TrendingScreenBodyState extends State<TrendingScreenBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(_onScroll);
  }

  void _loadData() {
    final cubit = context.read<HomeCubit>();
    if (cubit.state.marketData.isEmpty) {
      cubit.getMarkets();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<HomeCubit>().getMarkets(loadMore: true);
    }
  }

  Future<void> _onRefresh() async {
    await context.read<HomeCubit>().getMarkets();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.withFormFactor(
      onMobile: 16.0,
      onTablet: 24.0,
      onDesktop: 32.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.trendingNow.tr(),
          style: AppTextStyles.bold20.copyWith(
            color: AppColors.primaryDark,
            
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryDark),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listenWhen: (previous, current) =>
            previous.marketDataStatus != current.marketDataStatus,
        listener: (context, state) {
          if (state.marketDataStatus == HomeDataStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.errorMessage ?? 'An error occurred')),
            );
          }
        },
        buildWhen: (previous, current) =>
            previous.marketDataStatus != current.marketDataStatus ||
            previous.marketData != current.marketData ||
            previous.hasMoreMarkets != current.hasMoreMarkets,
        builder: (context, state) {
          if (state.marketDataStatus == HomeDataStatus.loading &&
              state.marketData.isEmpty) {
            return const TopGainersListShimmer();
          }

          if (state.marketData.isEmpty &&
              state.marketDataStatus == HomeDataStatus.failure) {
            return CustomErrorWidget(
              errorMessage: state.errorMessage ?? 'Error loading data',
              onRetry: () => context.read<HomeCubit>().getMarkets(),
            );
          }

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.all(horizontalPadding),
              itemCount:
                  state.marketData.length + (state.hasMoreMarkets ? 1 : 0),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index >= state.marketData.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final coin = state.marketData[index];
                return MarketCoinItem(coin: coin);
              },
            ),
          );
        },
      ),
    );
  }
}
