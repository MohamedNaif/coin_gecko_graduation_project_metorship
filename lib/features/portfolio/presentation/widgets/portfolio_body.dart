import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/holding/holding_section.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/transaction/portfolio_header_section.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/transaction/tranaction_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioBody extends StatelessWidget {
  const PortfolioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async =>
            context.read<PortfolioCubit>().getSimplePriceWithDefaultValues(),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const PortfolioHeaderSection(),
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              sliver: HoldingsSection(),
            ),
            _buildSpacing(context),
            _buildRecentTransactionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacing(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(height: context.heightScale(10)),
    );
  }

  Widget _buildRecentTransactionsSection() {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: Builder(
              builder: (context) =>
                  _buildSectionTitle(context, 'Recent Transactions'),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
          sliver: TransactionsSection(),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.headlineLarge?.copyWith(
        fontSize: 23,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
