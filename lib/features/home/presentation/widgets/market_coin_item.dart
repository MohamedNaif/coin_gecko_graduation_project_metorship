import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/responsive_app_extensions.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:flutter/material.dart';

class MarketCoinItem extends StatelessWidget {
  final MarketCoinModel coin;

  const MarketCoinItem({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final iconSize = context.withFormFactor(
      onMobile: 48.0,
      onTablet: 52.0,
      onDesktop: 56.0,
    );

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
      child: Row(
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: coin.image ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name ?? '',
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.primaryDark,
                    
                  ),
                ),
                Text(
                  coin.symbol?.toUpperCase() ?? '',
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.gray400,
                    
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${coin.currentPrice?.toStringAsFixed(2) ?? '0.00'}',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryDark,
                  
                ),
              ),
              Row(
                children: [
                  Icon(
                    (coin.priceChangePercentage24h ?? 0) >= 0
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: (coin.priceChangePercentage24h ?? 0) >= 0
                        ? AppColors.primaryLight
                        : AppColors.secondary,
                    size: 20,
                  ),
                  Text(
                    '${(coin.priceChangePercentage24h ?? 0).toStringAsFixed(2)}%',
                    style: AppTextStyles.bold12.copyWith(
                      color: (coin.priceChangePercentage24h ?? 0) >= 0
                          ? AppColors.primaryLight
                          : AppColors.secondary,
                      
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
