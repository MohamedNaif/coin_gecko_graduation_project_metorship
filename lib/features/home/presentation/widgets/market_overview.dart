import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:flutter/material.dart';

import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';

class MarketOverview extends StatelessWidget {
  final GlobalDataModel? data;

  const MarketOverview({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Market Overview',
            style: AppTextStyles.bold20.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _MarketItem(
                  title: 'Market Cap',
                  value: data != null
                      ? '\$${(data!.totalMarketCap / 1e12).toStringAsFixed(2)}T'
                      : 'Loading...',
                  // change: '2,35%', // API doesn't provide change for global market cap in this endpoint easily without history
                  isPositive: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MarketItem(
                  title: '24h Volume',
                  value: data != null
                      ? '\$${(data!.totalVolume / 1e9).toStringAsFixed(2)}B'
                      : 'Loading...',
                  // change: '2,35%',
                  isPositive: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MarketItem(
                  title: 'BTC Dominance',
                  value: data != null
                      ? '${data!.btcDominance.toStringAsFixed(1)}%'
                      : 'Loading...',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MarketItem(
                  title: 'Active Coins',
                  value: data != null
                      ? data!.activeCryptocurrencies.toString()
                      : 'Loading...',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MarketItem extends StatelessWidget {
  final String title;
  final String value;
  final String? change;
  final bool isPositive;

  const _MarketItem({
    required this.title,
    required this.value,
    this.change,
    this.isPositive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.gray500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.semiBold18.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          if (change != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color:
                      isPositive ? AppColors.primaryLight : AppColors.secondary,
                  size: 16,
                ),
                Text(
                  change!,
                  style: AppTextStyles.bold10.copyWith(
                    color: isPositive
                        ? AppColors.primaryLight
                        : AppColors.secondary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
