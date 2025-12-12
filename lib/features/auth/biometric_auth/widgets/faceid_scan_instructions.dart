import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

/// Displays the Face ID scan instructions with title and description
class FaceIdScanInstructions extends StatelessWidget {
  const FaceIdScanInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.heightScale(AppDimensions.spacingXLarge)),
        Text(
          AppStrings.scanFaceTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(height: context.heightScale(AppDimensions.spacingLarge)),
        Text(
          AppStrings.placeFaceUntilFills,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.white,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
