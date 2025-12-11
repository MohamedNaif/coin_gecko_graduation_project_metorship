import 'package:flutter/material.dart';
import '../../domain/entities/coin_details.dart';

class CoinDetailsStatistics extends StatelessWidget {
  final CoinDetails coin;

  const CoinDetailsStatistics({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _statRow('Current Price', '${_format(coin.currentPrice)} \$'),
          _statRow('Market Cap', '${_format(coin.marketCap)} \$'),
          _statRow('Volume 24h', '${_format(coin.volume24h)} \$'),
          _statRow('Available Supply', _format(coin.circulatingSupply)),
          _statRow('Max Supply', _format(coin.maxSupply)),
        ],
      ),
    );
  }

  Widget _statRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(width: 8),
              const Icon(Icons.info_outline, size: 16, color: Colors.blue),
            ],
          ),
          Text(value,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  String _format(double value) {
    if (value >= 1e9) return '${(value / 1e9).toStringAsFixed(1)}B';
    if (value >= 1e6) return '${(value / 1e6).toStringAsFixed(1)}M';
    if (value >= 1e3) return '${(value / 1e3).toStringAsFixed(1)}K';
    return value.toStringAsFixed(0);
  }
}
