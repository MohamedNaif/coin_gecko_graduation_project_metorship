import '../entities/coin_data_point.dart';
import '../entities/coin_details.dart';

abstract class CoinRepository {
  Future<CoinDetails> getCoinDetails(String coinId);
  Future<List<ChartDataPoint>> getChartData(String coinId, String days);
}

// class CoinRepo implements CoinRepository {
//   @override
//   Future<List<ChartDataPoint>> getChartData(String coinId, String days) {}

//   @override
//   Future<CoinDetails> getCoinDetails(String coinId) {
//     // TODO: implement getCoinDetails
//     throw UnimplementedError();
//   }
// }
