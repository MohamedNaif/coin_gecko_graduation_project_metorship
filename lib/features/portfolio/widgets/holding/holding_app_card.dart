import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HoldingAppCard extends StatelessWidget {
  const HoldingAppCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14344BC1),
            blurRadius: 40,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
