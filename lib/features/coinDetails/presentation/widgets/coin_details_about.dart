import 'package:flutter/material.dart';
import '../../domain/entities/coin_details.dart';

class CoinDetailsAbout extends StatelessWidget {
  final CoinDetails coin;

  const CoinDetailsAbout({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About ${coin.name}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            coin.description.isNotEmpty
                ? coin.description
                : '${coin.name} is a decentralized cryptocurrency originally described in a 2008 whitepaper...',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
