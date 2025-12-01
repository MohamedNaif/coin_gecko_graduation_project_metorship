import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/responsive_app_extensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/responsive_font_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';

class TopGainersList extends StatelessWidget {
  final List<MarketCoinModel>? data;

  const TopGainersList({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.withFormFactor(
      onMobile: 16.0,
      onTablet: 24.0,
      onDesktop: 32.0,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.topGainers.tr(),
            style: AppTextStyles.bold20.copyWith(
              color: AppColors.primaryDark,
              fontSize: ResponsiveFontSize.getResponsiveFontSize(context, 20),
            ),
          ),
          const SizedBox(height: 16),
          data == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data?.length ?? 0,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _GainerTile(coin: data![index]);
                  },
                ),
        ],
      ),
    );
  }
}

class _GainerTile extends StatelessWidget {
  final MarketCoinModel coin;

  const _GainerTile({required this.coin});

  @override
  Widget build(BuildContext context) {
    final iconSize = context.withFormFactor(
      onMobile: 40.0,
      onTablet: 48.0,
      onDesktop: 52.0,
    );

    return Container(
      padding: const EdgeInsets.all(12),
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
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
                  coin.name != null
                      ? coin.name!.length > 20
                          ? '${coin.name!.substring(0, 20)}...'
                          : coin.name!
                      : '',
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.primaryDark,
                    
                  ),
                ),
                Text(
                  (coin.symbol ?? '').toUpperCase(),
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
                '\$${(coin.currentPrice ?? 0).toStringAsFixed(2)}',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryDark,
                  
                ),
              ),
              Text(
                '${(coin.priceChangePercentage24h ?? 0) >= 0 ? '+' : ''}${(coin.priceChangePercentage24h ?? 0).toStringAsFixed(2)}%',
                style: AppTextStyles.regular12.copyWith(
                  color: (coin.priceChangePercentage24h ?? 0) >= 0
                      ? AppColors.success
                      : AppColors.secondary,
                  
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
