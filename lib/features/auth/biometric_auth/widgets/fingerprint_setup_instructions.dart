import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

/// Displays the fingerprint setup instructions
class FingerprintSetupInstructions extends StatelessWidget {
  const FingerprintSetupInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.heightScale(AppDimensions.spacingGiant),
        ),
        Text(
          AppStrings.placeFingerOnSensor,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.primaryLight,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
