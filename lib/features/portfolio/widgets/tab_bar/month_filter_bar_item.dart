import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class MonthFilterBarItem extends StatelessWidget {
  const MonthFilterBarItem({
    super.key,
    required this.month,
    required this.isSelected,
    required this.onTap,
  });

  final String month;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: _buildContainerDecoration(context),
        child: _buildMonthText(context),
      ),
    );
  }

  Widget _buildMonthText(BuildContext context) {
    return Text(
      month,
      style: context.textTheme.titleMedium?.copyWith(
        color: isSelected
            ? context.theme.colorScheme.tertiaryFixed
            : context.theme.colorScheme.onSecondaryContainer,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: isSelected ? context.theme.colorScheme.secondaryContainer : null,
    );
  }
}
