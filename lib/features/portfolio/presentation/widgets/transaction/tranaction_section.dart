import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/ui_model/transaction_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/transaction/transaction_tile.dart';
import 'package:flutter/material.dart';

class TransactionsSection extends StatelessWidget {
  TransactionsSection({
    super.key,
  });

  final PortfolioTransaction _transactions = PortfolioTransaction(
    title: 'Bitcoin',
    since: '2 hours ago',
    valueLabel: '0.01 BTC',
    amountLabel: r'$100',
  );

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return TransactionTile(transaction: _transactions);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 3,
    );
  }
}
