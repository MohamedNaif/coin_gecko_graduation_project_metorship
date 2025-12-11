import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_constant.dart';
import '../../data/repos/market_repository.dart';
import 'market_state.dart';

@injectable
class MarketCubit extends Cubit<MarketState> {
  final MarketRepository repo;

  // pagination config
  final int perPage;
  bool _isFetching = false;

  MarketCubit({required this.repo, this.perPage = ApiConstant.defaultPerPage})
    : super(MarketInitial());

  Future<void> loadInitial() async {
    emit(MarketLoading());
    try {
      final page = 1;
      final coins = await repo.fetchMarketCoins(page: page, perPage: perPage);
      final hasReachedEnd = coins.length < perPage;
      emit(
        MarketLoaded(coins: coins, hasReachedEnd: hasReachedEnd, page: page),
      );
    } catch (e) {
      emit(MarketError(e.toString()));
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (_isFetching) return;
    if (current is MarketLoaded && current.hasReachedEnd) return;

    try {
      _isFetching = true;
      final nextPage = (current is MarketLoaded) ? current.page + 1 : 1;
      final newCoins = await repo.fetchMarketCoins(
        page: nextPage,
        perPage: perPage,
      );
      _isFetching = false;

      if (current is MarketLoaded) {
        final all = [...current.coins, ...newCoins];
        final hasReachedEnd = newCoins.length < perPage;
        emit(
          MarketLoaded(
            coins: all,
            hasReachedEnd: hasReachedEnd,
            page: nextPage,
          ),
        );
      } else {
        final hasReachedEnd = newCoins.length < perPage;
        emit(
          MarketLoaded(
            coins: newCoins,
            hasReachedEnd: hasReachedEnd,
            page: nextPage,
          ),
        );
      }
    } catch (e) {
      _isFetching = false;
      emit(MarketError(e.toString()));
    }
  }

  Future<void> retry() async {
    await loadInitial();
  }
}
