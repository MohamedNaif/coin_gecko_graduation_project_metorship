import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_app_card.dart';
import 'package:coin_gecko_graduation_project_metorship/features/data/model/transaction_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/transaction/transaction_info.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/transaction/transaction_value.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  final PortfolioTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return CustomAppCard(
      child: Row(
        children: [
          Icon(Icons.currency_bitcoin,
              color: context.theme.colorScheme.onSurface),
          const SizedBox(width: 16),
          Expanded(child: TransactionInfo(transaction: transaction)),
          Expanded(flex: 2, child: TransactionValue(transaction: transaction)),
        ],
      ),
    );
  }
}
