import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

/// Button for Face ID authentication
class FaceIdAuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;

  const FaceIdAuthButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: AppDimensions.borderRadiusLarge,
      widthPadding: AppDimensions.paddingButton,
      height: AppDimensions.buttonHeightLarge,
      text: AppStrings.continueText,
      onTap: onTap,
      isLoading: isLoading,
      color: AppColors.primaryLight,
      textStyle: context.textTheme.titleMedium?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
