import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/ui_model/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({super.key, required this.transaction});
  final PortfolioTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transaction.title,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          transaction.since,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.gray300,
            //color does'nt change in dark mode
          ),
        ),
      ],
    );
  }
}
