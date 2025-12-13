import 'package:flutter/material.dart';
import '../../domain/entities/coin_details.dart';

class CoinDetailsInfo extends StatelessWidget {
  final CoinDetails coin;

  const CoinDetailsInfo({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                coin.symbol,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            coin.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
