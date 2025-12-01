import 'package:coin_gecko_graduation_project_metorship/core/api/api_constant.dart';

class CoinData {
  final double usd;
  final double usd24hChange;

  CoinData({required this.usd, required this.usd24hChange});

  factory CoinData.fromJson(Map<String, dynamic> json) {
    return CoinData(
      usd: (json[ApiConstant.usd] as num).toDouble(),
      usd24hChange: (json[ApiConstant.usd24hChange] as num).toDouble(),
    );
  }
}
