import 'package:coin_gecko_graduation_project_metorship/core/api/api_constant.dart';

class CoinData {
  final String name;
  final double usd;
  final double usdChange;

  CoinData({
    required this.name,
    required this.usd,
    required this.usdChange,
  });

  factory CoinData.fromJson(String name, Map<String, dynamic> json) {
    return CoinData(
      name: name,
      usd: (json[ApiConstant.usd] as num).toDouble(),
      usdChange: (json[ApiConstant.usd24hChange] as num).toDouble(),
    );
  }

  CoinData copyWith({String? name, double? usd, double? usdChange}) {
    return CoinData(
      name: name ?? this.name,
      usd: usd ?? this.usd,
      usdChange: usdChange ?? this.usdChange,
    );
  }

  @override
  String toString() => 'CoinData(name: $name, usd: $usd, change: $usdChange)';
}
