import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';

class SimplePriceModel {
  final List<CoinData>? _coins;

  SimplePriceModel({required List<CoinData> coins}) : _coins = coins;
  List<CoinData>? get coins => _coins;

  factory SimplePriceModel.fromJson(Map<String, dynamic> json) {
    final coinsList = <CoinData>[];
    json.forEach((key, value) {
      coinsList.add(CoinData.fromJson(key, value as Map<String, dynamic>));
    });
    return SimplePriceModel(coins: coinsList);
  }
}
