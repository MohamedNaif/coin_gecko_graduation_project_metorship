import 'package:json_annotation/json_annotation.dart';

part 'coin_details_model.g.dart';

@JsonSerializable()
class CoinDetailsModel {
  final String id;
  final String name;
  final String symbol;

  @JsonKey(fromJson: _priceFromJson)
  final double currentPrice;

  @JsonKey(fromJson: _priceChangeFromJson)
  final double priceChange24h;

  @JsonKey(fromJson: _marketCapFromJson)
  final double marketCap;

  @JsonKey(fromJson: _volumeFromJson)
  final double volume24h;

  @JsonKey(fromJson: _circulatingSupplyFromJson)
  final double circulatingSupply;

  @JsonKey(fromJson: _maxSupplyFromJson)
  final double maxSupply;

  @JsonKey(fromJson: _descriptionFromJson)
  final String description;

  CoinDetailsModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.priceChange24h,
    required this.marketCap,
    required this.volume24h,
    required this.circulatingSupply,
    required this.maxSupply,
    required this.description,
  });

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailsModelFromJson(json);

  // --------- Custom JSON extractors ----------
  static double _priceFromJson(Map<String, dynamic> json) =>
      (json['market_data']['current_price']['usd'] as num).toDouble();

  static double _priceChangeFromJson(Map<String, dynamic> json) =>
      (json['market_data']['price_change_percentage_24h'] as num).toDouble();

  static double _marketCapFromJson(Map<String, dynamic> json) =>
      (json['market_data']['market_cap']['usd'] as num).toDouble();

  static double _volumeFromJson(Map<String, dynamic> json) =>
      (json['market_data']['total_volume']['usd'] as num).toDouble();

  static double _circulatingSupplyFromJson(Map<String, dynamic> json) =>
      (json['market_data']['circulating_supply'] as num).toDouble();

  static double _maxSupplyFromJson(Map<String, dynamic> json) =>
      (json['market_data']['max_supply'] as num?)?.toDouble() ?? 0;

  static String _descriptionFromJson(Map<String, dynamic> json) =>
      json['description']['en'] ?? '';
}
