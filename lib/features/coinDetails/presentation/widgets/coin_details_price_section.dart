import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/coin_details.dart';
import '../../domain/entities/coin_data_point.dart';
import 'coin_details_chart.dart';
import 'coin_details_timeframes.dart';

class CoinDetailsPriceSection extends StatelessWidget {
  final CoinDetails coin;
  final List<ChartDataPoint> chartData;
  final String selectedTimeframe;

  const CoinDetailsPriceSection({
    super.key,
    required this.coin,
    required this.chartData,
    required this.selectedTimeframe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${NumberFormat('#,##0.00').format(coin.currentPrice)}',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/ 1 ${coin.symbol}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: coin.priceChange24h >= 0
                      ? Theme.of(context).primaryColor
                      : Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.trending_up,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${coin.priceChange24h.abs().toStringAsFixed(1)}%',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(height: 200, child: CoinDetailsChart(data: chartData)),
          const SizedBox(height: 16),
          CoinDetailsTimeframes(selected: selectedTimeframe),
        ],
      ),
    );
  }
}
