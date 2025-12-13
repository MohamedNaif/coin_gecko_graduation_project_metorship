import 'package:injectable/injectable.dart';
import '../../domain/entities/coin_data_point.dart';
import '../../domain/entities/coin_details.dart';
import '../../../../core/api/api_constant.dart';
import '../../domain/repo/coin_repo.dart';
import '../data_source/coin_details_remote_data_source.dart';

@LazySingleton(as: CoinRepository)
class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource remoteDataSource;

  CoinRepositoryImpl(this.remoteDataSource);

  @override
  Future<CoinDetails> getCoinDetails(String coinId) async {
    final model = await remoteDataSource.getCoinDetails(coinId);

    return CoinDetails(
      id: model.id,
      name: model.name,
      symbol: model.symbol,
      currentPrice: model.currentPrice,
      priceChange24h: model.priceChange24h,
      marketCap: model.marketCap,
      volume24h: model.volume24h,
      circulatingSupply: model.circulatingSupply,
      maxSupply: model.maxSupply,
      description: model.description,
    );
  }

  @override
  Future<List<ChartDataPoint>> getChartData(
      String coinId,
      String days,
      ) async {
    final response = await remoteDataSource.getMarketChart(
      coinId,
      ApiConstant.usd,
      days,
    );

    return response.prices.map((point) {
      return ChartDataPoint(
        timestamp:
        DateTime.fromMillisecondsSinceEpoch(point[0].toInt()),
        price: point[1].toDouble(),
      );
    }).toList();
  }
}
