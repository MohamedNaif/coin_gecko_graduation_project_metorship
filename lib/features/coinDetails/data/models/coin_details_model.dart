import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/coin_details.dart';


part 'coin_details_model.g.dart';

@JsonSerializable()
class CoinDetailsModel {
  final String id;
  final String name;
  final String symbol;

  @JsonKey(name: 'market_data')
  final Map<String, dynamic> marketData;

  final Map<String, dynamic> description;

  CoinDetailsModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.marketData,
    required this.description,
  });

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDetailsModelToJson(this);

  CoinDetails toEntity() {
    // Safely parse nested fields and default to 0 or empty strings when missing
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0.0;
      return 0.0;
    }

    final currentPrice =
    _toDouble(marketData['current_price']?['usd'] ?? marketData['current_price']);
    final priceChange24h = _toDouble(marketData['price_change_percentage_24h']);
    final marketCap = _toDouble(marketData['market_cap']?['usd']);
    final volume24h = _toDouble(marketData['total_volume']?['usd']);
    final circulatingSupply = _toDouble(marketData['circulating_supply']);
    final maxSupply = _toDouble(marketData['max_supply']);

    return CoinDetails(
      id: id,
      name: name,
      symbol: symbol.toUpperCase(),
      currentPrice: currentPrice,
      priceChange24h: priceChange24h,
      marketCap: marketCap,
      volume24h: volume24h,
      circulatingSupply: circulatingSupply,
      maxSupply: maxSupply,
      description: description['en'] ?? '',
    );
  }
}
