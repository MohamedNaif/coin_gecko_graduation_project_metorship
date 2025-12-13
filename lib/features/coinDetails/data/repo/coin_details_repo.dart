import 'package:coin_gecko_graduation_project_metorship/core/api/api_constant.dart';
import 'package:coin_gecko_graduation_project_metorship/features/coinDetails/data/data_source/coin_details_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/coinDetails/domain/entities/coin_data_point.dart';
import 'package:coin_gecko_graduation_project_metorship/features/coinDetails/domain/entities/coin_details.dart';
import 'package:coin_gecko_graduation_project_metorship/features/coinDetails/domain/repo/coin_repo.dart';
import 'package:injectable/injectable.dart';

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
      currentPrice: model.currentPrice ?? 0,
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
        timestamp: DateTime.fromMillisecondsSinceEpoch(point[0].toInt()),
        price: point[1].toDouble(),
      );
    }).toList();
  }
}
