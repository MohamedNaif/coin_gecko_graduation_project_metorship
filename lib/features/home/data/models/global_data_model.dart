import 'package:json_annotation/json_annotation.dart';

part 'global_data_model.g.dart';

@JsonSerializable()
class GlobalDataResponse {
  final GlobalDataModel? data;

  GlobalDataResponse({this.data});

  factory GlobalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalDataResponseToJson(this);
}

@JsonSerializable()
class GlobalDataModel {
  @JsonKey(name: 'active_cryptocurrencies')
  final int? activeCryptocurrencies;
  final int? markets;
  @JsonKey(name: 'total_market_cap')
  final Map<String, double>? totalMarketCap;
  @JsonKey(name: 'total_volume')
  final Map<String, double>? totalVolume;
  @JsonKey(name: 'market_cap_percentage')
  final Map<String, double>? marketCapPercentage;

  GlobalDataModel({
    this.activeCryptocurrencies,
    this.markets,
    this.totalMarketCap,
    this.totalVolume,
    this.marketCapPercentage,
  });

  factory GlobalDataModel.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalDataModelToJson(this);

  double get btcDominance => marketCapPercentage?['btc'] ?? 0.0;
}
