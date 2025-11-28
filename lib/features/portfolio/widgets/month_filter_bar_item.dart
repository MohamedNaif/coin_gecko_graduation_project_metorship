import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
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
        decoration: _buildContainerDecoration(),
        child: _buildMonthText(context),
      ),
    );
  }

  Widget _buildMonthText(BuildContext context) {
    return Text(
      month,
      style: context.textTheme.titleMedium?.copyWith(
        color: isSelected ? AppColors.primaryLight : AppColors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: isSelected ? Colors.white : null,
    );
  }
}
