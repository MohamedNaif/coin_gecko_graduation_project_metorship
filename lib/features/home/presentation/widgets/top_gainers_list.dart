import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:flutter/material.dart';

class TopGainersList extends StatelessWidget {
  const TopGainersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Gainers',
            style: AppTextStyles.bold20.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return const _GainerTile();
            },
          ),
        ],
      ),
    );
  }
}

class _GainerTile extends StatelessWidget {
  const _GainerTile();

  @override
  Widget build(BuildContext context) {
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200], // Placeholder
            ),
            child: const Icon(Icons.token, color: Colors.grey),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ethereum',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryDark,
                ),
              ),
              Text(
                'ETH',
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.gray400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$20,788',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryDark,
                ),
              ),
              Text(
                '+0.25%',
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
