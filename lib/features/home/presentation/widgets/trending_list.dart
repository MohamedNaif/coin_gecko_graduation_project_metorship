import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/responsive_app_extensions.dart';
import 'package:flutter/material.dart';

import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';

class TrendingList extends StatelessWidget {
  final TrendingData? data;

  const TrendingList({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.withFormFactor(
      onMobile: 16.0,
      onTablet: 24.0,
      onDesktop: 32.0,
    );

    final cardHeight = context.withFormFactor(
      onMobile: 140.0,
      onTablet: 160.0,
      onDesktop: 180.0,
    );

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.trendingNow.tr(),
                style: AppTextStyles.bold20.copyWith(
                  color: AppColors.primaryDark,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.trendingScreen);
                },
                child: Text(
                  AppStrings.viewAll.tr(),
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: cardHeight,
          child: data == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: data?.coins?.length ?? 0,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return _TrendingCard(coin: data!.coins![index]);
                  },
                ),
        ),
      ],
    );
  }
}

class _TrendingCard extends StatelessWidget {
  final TrendingCoinModel coin;

  const _TrendingCard({required this.coin});

  @override
  Widget build(BuildContext context) {
    final cardWidth = context.withFormFactor(
      onMobile: 180.0,
      onTablet: 200.0,
      onDesktop: 220.0,
    );

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          Row(
            children: [
              Expanded(
                child: Text(
                  coin.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.semiBold14.copyWith(
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl: coin.thumb ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
          Text(
            coin.symbol ?? '',
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.gray400,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${(coin.price ?? 0).toStringAsFixed(2)}',
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
                    size: 16,
                  ),
                  Text(
                    '${(coin.priceChangePercentage24h ?? 0).toStringAsFixed(2)}%',
                    style: AppTextStyles.bold10.copyWith(
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
