import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/data/model/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionValue extends StatelessWidget {
  const TransactionValue({super.key, required this.transaction});
  final PortfolioTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          transaction.valueLabel,
          style: context.textTheme.bodyMedium?.copyWith(
              color: context.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          transaction.amountLabel,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.colorScheme.tertiary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
