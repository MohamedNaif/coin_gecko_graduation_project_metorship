import 'package:coin_gecko_graduation_project_metorship/features/home/data/repos/home_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState());

  Future<void> getGlobalData() async {
    emit(state.copyWith(globalDataStatus: HomeDataStatus.loading));
    try {
      final result = await _homeRepo.getGlobalData();
      emit(state.copyWith(
        globalDataStatus: HomeDataStatus.success,
        globalData: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        globalDataStatus: HomeDataStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> getTrendingCoins() async {
    emit(state.copyWith(trendingDataStatus: HomeDataStatus.loading));
    try {
      final result = await _homeRepo.getTrendingCoins();
      emit(state.copyWith(
        trendingDataStatus: HomeDataStatus.success,
        trendingData: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        trendingDataStatus: HomeDataStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> getMarkets({bool loadMore = false}) async {
    if (loadMore) {
      if (!state.hasMoreMarkets ||
          state.marketDataStatus == HomeDataStatus.loading) return;
    } else {
      emit(state.copyWith(marketDataStatus: HomeDataStatus.loading));
    }

    try {
      final page = loadMore ? state.marketPage + 1 : 1;
      final result = await _homeRepo.getMarkets(page: page, perPage: 20);

      final hasMore = result.length >= 20;
      final newMarkets = loadMore ? [...state.marketData, ...result] : result;

      emit(state.copyWith(
        marketDataStatus: HomeDataStatus.success,
        marketData: newMarkets,
        hasMoreMarkets: hasMore,
        marketPage: page,
      ));
    } catch (e) {
      emit(state.copyWith(
        marketDataStatus: HomeDataStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> getAllData() async {
    await Future.wait([
      getGlobalData(),
      getTrendingCoins(),
      getMarkets(),
    ]);
  }
}
