import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

/// Continue button for fingerprint scanning completion
class FingerprintScanContinueButton extends StatelessWidget {
  final VoidCallback onTap;

  const FingerprintScanContinueButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.heightScale(AppDimensions.spacingGiant),
        ),
        CustomButton(
          borderRadius: AppDimensions.borderRadiusLarge,
          widthPadding: AppDimensions.paddingButton,
          height: AppDimensions.buttonHeightLarge,
          text: AppStrings.continueText,
          onTap: onTap,
          color: AppColors.primaryLight,
          textStyle: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
