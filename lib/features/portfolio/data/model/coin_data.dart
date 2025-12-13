import 'package:coin_gecko_graduation_project_metorship/core/api/api_constant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_data.g.dart';

@JsonSerializable()
class CoinData {
  final String name;

  final double? usd;

  @JsonKey(name: ApiConstant.usd24hChange)
  final double? usdChange;

  CoinData({
    required this.name,
    required this.usd,
    required this.usdChange,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) =>
      _$CoinDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDataToJson(this);
}
