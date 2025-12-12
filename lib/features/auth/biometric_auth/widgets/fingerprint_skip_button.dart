import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// Skip button for fingerprint setup
class FingerprintSkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FingerprintSkipButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        AppStrings.skip,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primaryLight,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
