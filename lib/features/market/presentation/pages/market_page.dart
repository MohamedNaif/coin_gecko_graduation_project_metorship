import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../data/models/coin_model.dart';
import '../cubit/market_cubit.dart';
import '../cubit/market_state.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';
import '../widgets/list_item_widget.dart';
import '../widgets/search_list_item_widget.dart';
import '../widgets/search_section.dart';
import '../widgets/shimmer_item.dart';
import '../widgets/error_retry.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    // load initial market data
    context.read<MarketCubit>().loadInitial();

    _scrollController.addListener(() {
      final cubit = context.read<MarketCubit>();
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        // near bottom -> load more
        if (!_isLoadingMore) {
          _isLoadingMore = true;
          cubit.loadMore().whenComplete(() => _isLoadingMore = false);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildMarketList(
    List<CoinModel> coins, {
    bool showLoadingIndicator = false,
  }) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: coins.length + (showLoadingIndicator ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= coins.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final coin = coins[index];
        return ListItemWidget(
          coinId: coin.id,
          price: coin.currentPrice,
          name: coin.name,
          imageUrl: coin.imageUrl,
          changePercent: coin.priceChangePercent24h,
          marketCapRank: coin.marketCapRank,
        );
      },
    );
  }

  Widget _buildShimmers() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (_, __) => const ShimmerItem(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Market',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.textSizeHuge,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
      ),
      backgroundColor: AppColors.lightBackground,
      body: Column(
        children: [
          SearchSection(),
          const SizedBox(height: AppDimensions.spacingTiny),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, searchState) {
                if (searchState is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (searchState is SearchResults) {
                  final results = searchState.results;
                  if (results.isEmpty) {
                    return const Center(child: Text(AppStrings.noResult));
                  }
                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, i) {
                      final s = results[i];
                      return SearchListItemWidget(
                        name: s.name,
                        imageUrl: s.thumb,
                        marketCapRank: s.marketCapRank,
                      );
                    },
                  );
                } else if (searchState is SearchError) {
                  return Center(
                    child: Text('Search error: ${searchState.error}'),
                  );
                }

                // default: show market list
                return BlocBuilder<MarketCubit, MarketState>(
                  builder: (context, state) {
                    if (state is MarketLoading) {
                      return _buildShimmers();
                    } else if (state is MarketLoaded) {
                      return _buildMarketList(
                        state.coins,
                        showLoadingIndicator: !state.hasReachedEnd,
                      );
                    } else if (state is MarketError) {
                      return ErrorRetry(
                        message: state.message,
                        onRetry: () => context.read<MarketCubit>().retry(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
