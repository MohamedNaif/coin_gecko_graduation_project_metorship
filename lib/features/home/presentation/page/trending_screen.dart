import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    // Initial load is handled by HomeCubit, but we can trigger it if needed or rely on previous state
    // If we want to ensure fresh data or if it wasn't loaded:
    final cubit = context.read<HomeCubit>();
    if (cubit.state.marketData.isEmpty) {
      cubit.getMarkets();
    }
    _scrollController.addListener(_onScroll);
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

  @override
  Widget build(BuildContext context) {
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
            return const Center(child: CircularProgressIndicator());
          }

          if (state.marketData.isEmpty &&
              state.marketDataStatus == HomeDataStatus.failure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage ?? 'Error loading data'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<HomeCubit>().getMarkets(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: state.marketData.length + (state.hasMoreMarkets ? 1 : 0),
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
              return _CoinCard(coin: coin);
            },
          );
        },
      ),
    );
  }
}

class _CoinCard extends StatelessWidget {
  final MarketCoinModel coin;

  const _CoinCard({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: coin.image ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name ?? '',
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.primaryDark,
                  ),
                ),
                Text(
                  coin.symbol?.toUpperCase() ?? '',
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.gray400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${coin.currentPrice?.toStringAsFixed(2) ?? '0.00'}',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryDark,
                ),
              ),
              Row(
                children: [
                  Icon(
                    (coin.priceChangePercentage24h ?? 0) >= 0
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: (coin.priceChangePercentage24h ?? 0) >= 0
                        ? AppColors.primaryLight
                        : AppColors.secondary,
                    size: 20,
                  ),
                  Text(
                    '${(coin.priceChangePercentage24h ?? 0).toStringAsFixed(2)}%',
                    style: AppTextStyles.bold12.copyWith(
                      color: (coin.priceChangePercentage24h ?? 0) >= 0
                          ? AppColors.primaryLight
                          : AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
