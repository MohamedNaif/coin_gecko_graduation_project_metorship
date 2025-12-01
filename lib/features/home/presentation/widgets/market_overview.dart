import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/responsive_app_extensions.dart';
import 'package:flutter/material.dart';

import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';

class MarketOverview extends StatelessWidget {
  final GlobalDataModel? data;

  const MarketOverview({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.withFormFactor(
      onMobile: 16.0,
      onTablet: 24.0,
      onDesktop: 32.0,
    );

    final crossAxisCount = context.withFormFactor(
      onMobile: 2,
      onTablet: 4,
      onDesktop: 4,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.marketOverview.tr(),
            style: AppTextStyles.bold20.copyWith(
              color: AppColors.primaryDark,
              
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: context.withFormFactor(
              onMobile: 1.5,
              onTablet: 1.8,
              onDesktop: 2.0,
            ),
            children: [
              _MarketItem(
                title: AppStrings.marketCap.tr(),
                value: data != null
                    ? '\$${((data?.totalMarketCap?['usd'] ?? 0) / 1e12).toStringAsFixed(2)}T'
                    : AppStrings.loading.tr(),
              ),
              _MarketItem(
                title: AppStrings.volume24h.tr(),
                value: data != null
                    ? '\$${((data?.totalVolume?['usd'] ?? 0) / 1e9).toStringAsFixed(2)}B'
                    : AppStrings.loading.tr(),
              ),
              _MarketItem(
                title: AppStrings.btcDominance.tr(),
                value: data != null
                    ? '${(data?.btcDominance ?? 0).toStringAsFixed(1)}%'
                    : AppStrings.loading.tr(),
              ),
              _MarketItem(
                title: AppStrings.activeCoins.tr(),
                value: data != null
                    ? (data?.activeCryptocurrencies ?? 0).toString()
                    : AppStrings.loading.tr(),
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

  const _MarketItem({
    required this.title,
    required this.value,
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
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
