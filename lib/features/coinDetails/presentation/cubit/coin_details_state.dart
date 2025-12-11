import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/coin_data_point.dart';
import '../../domain/entities/coin_details.dart';


part 'coin_details_state.freezed.dart';

@freezed
class CoinDetailsState with _$CoinDetailsState {
  const factory CoinDetailsState.initial() = _Initial;
  const factory CoinDetailsState.loading() = _Loading;
  const factory CoinDetailsState.loaded({
    required CoinDetails coinDetails,
    required List<ChartDataPoint> chartData,
    required String selectedTimeframe,
  }) = _Loaded;
  const factory CoinDetailsState.error(String message) = _Error;
}
