import 'package:json_annotation/json_annotation.dart';

part 'market_chart_response.g.dart';

@JsonSerializable()
class MarketChartResponse {
  // prices: [[timestamp, price], ...]
  final List<List<num>> prices;

  MarketChartResponse({required this.prices});

  factory MarketChartResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketChartResponseFromJson(json);
}
