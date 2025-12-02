import 'package:coin_gecko_graduation_project_metorship/core/api/api_constant.dart';

class CoinData {
  final String _name;
  final double _usd;
  final double _usdChange;

  CoinData(
      {required String name, required double usd, required double usdChange})
      : _name = name,
        _usd = usd,
        _usdChange = usdChange;

  String get name => _name;
  double get usd => _usd;
  double get usdChange => _usdChange;

  factory CoinData.fromJson(String name, Map<String, dynamic> json) {
    return CoinData(
      name: name,
      usd: (json[ApiConstant.usd] as num).toDouble(),
      usdChange: (json[ApiConstant.usd24hChange] as num).toDouble(),
    );
  }
}
