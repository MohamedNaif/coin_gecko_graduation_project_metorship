import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class PortfolioSummaryContent extends StatelessWidget {
  const PortfolioSummaryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Value',
          style: context.textTheme.labelLarge
              ?.copyWith(color: AppColors.lightGrayishBlue),
        ),
        SizedBox(height: 10),
        Text(
          '\$143,421.20',
          style: context.textTheme.headlineLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 14),
        Text(
          '+2.5% (\$305.20) Today',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: AppColors.successLight),
        ),
      ],
    );
  }
}
