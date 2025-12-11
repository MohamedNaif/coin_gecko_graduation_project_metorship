import 'package:bloc/bloc.dart';
import '../../domain/usecase/get_chart_details.dart';
import '../../domain/usecase/get_coin_details.dart';
import 'coin_details_state.dart';

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  final GetCoinDetails getCoinDetails;
  final GetChartData getChartData;

  CoinDetailsCubit({required this.getCoinDetails, required this.getChartData})
    : super(const CoinDetailsState.initial());

  Future<void> loadCoinDetails(String coinId) async {
    emit(const CoinDetailsState.loading());
    try {
      final coin = await getCoinDetails(coinId);
      final chart = await getChartData(coinId, '1');
      emit(
        CoinDetailsState.loaded(
          coinDetails: coin,
          chartData: chart,
          selectedTimeframe: '1',
        ),
      );
    } catch (e) {
      emit(CoinDetailsState.error(e.toString()));
    }
  }

  Future<void> changeTimeframe(String coinId, String days) async {
    await state.maybeMap(
      loaded: (s) async {
        try {
          emit(const CoinDetailsState.loading());

          final chart = await getChartData(coinId, days);

          emit(
            CoinDetailsState.loaded(
              coinDetails: s.coinDetails,
              chartData: chart,
              selectedTimeframe: days,
            ),
          );
        } catch (e) {
          emit(CoinDetailsState.error(e.toString()));
        }
      },
      orElse: () {},
    );
  }
}
