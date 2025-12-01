import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';

class SimplePriceModel {
  final Map<String, CoinData> coins;

  SimplePriceModel({required this.coins});

  factory SimplePriceModel.fromJson(Map<String, dynamic> json) {
    final coinsMap = <String, CoinData>{};
    json.forEach((key, value) {
      coinsMap[key] = CoinData.fromJson(value as Map<String, dynamic>);
    });
    return SimplePriceModel(coins: coinsMap);
  }
}
