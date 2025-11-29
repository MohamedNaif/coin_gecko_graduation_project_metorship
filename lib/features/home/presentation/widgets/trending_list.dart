import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:flutter/material.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Now',
                style: AppTextStyles.bold20.copyWith(
                  color: AppColors.primaryDark,
                ),
              ),
              Text(
                'View all',
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return const _TrendingCard();
            },
          ),
        ),
      ],
    );
  }
}

class _TrendingCard extends StatelessWidget {
  const _TrendingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
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
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange, // Placeholder for Bitcoin icon
                ),
                child: const Icon(Icons.currency_bitcoin,
                    color: Colors.white, size: 20),
              ),
              const Spacer(),
              // Placeholder for mini chart
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Bitcoin',
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          Text(
            'BTC',
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.gray400,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1,132,151',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryDark,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_drop_up,
                    color: AppColors.primaryLight,
                    size: 16,
                  ),
                  Text(
                    '2,35%',
                    style: AppTextStyles.bold10.copyWith(
                      color: AppColors.primaryLight,
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
