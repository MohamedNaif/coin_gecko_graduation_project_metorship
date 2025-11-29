import 'package:coin_gecko_graduation_project_metorship/features/home/data/repos/home_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> getAllData() async {
    emit(HomeLoading());
    try {
      final results = await Future.wait([
        _homeRepo.getGlobalData(),
        _homeRepo.getTrendingCoins(),
        _homeRepo.getMarkets(),
      ]);

      emit(HomeSuccess(
        globalData: results[0] as dynamic,
        trendingData: results[1] as dynamic,
        marketData: results[2] as dynamic,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
