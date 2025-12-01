import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final HomeRepo _homeRepo = getIt<HomeRepo>();
  final ScrollController _scrollController = ScrollController();

  final List<MarketCoinModel> _coins = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMoreCoins();
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
      if (!_isLoading && _hasMore) {
        _loadMoreCoins();
      }
    }
  }

  Future<void> _loadMoreCoins() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final newCoins = await _homeRepo.getMarkets(
        page: _currentPage,
        perPage: 20,
      );

      setState(() {
        _coins.addAll(newCoins);
        _currentPage++;
        _hasMore = newCoins.length == 20;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_coins.isEmpty && _isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_coins.isEmpty && _error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadMoreCoins,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: _coins.length + (_hasMore ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index >= _coins.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        final coin = _coins[index];
        return _CoinCard(coin: coin);
      },
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
