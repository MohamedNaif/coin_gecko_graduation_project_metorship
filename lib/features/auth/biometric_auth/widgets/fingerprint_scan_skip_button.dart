import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

/// Skip button for fingerprint scanning completion screen
class FingerprintScanSkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FingerprintScanSkipButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.heightScale(AppDimensions.spacingSmall),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppStrings.skip,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        SizedBox(
          height: context.heightScale(AppDimensions.spacingXSmall),
        ),
      ],
    );
  }
}
