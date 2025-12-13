import '../entities/coin_data_point.dart';
import '../repo/coin_repo.dart';

class GetChartData {
  final CoinRepository repository;

  GetChartData(this.repository);

  Future<List<ChartDataPoint>> call(String coinId, String days) {
    return repository.getChartData(coinId, days);
  }
}
