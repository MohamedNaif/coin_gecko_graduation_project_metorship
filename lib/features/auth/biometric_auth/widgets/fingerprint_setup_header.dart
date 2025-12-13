import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

/// Displays the title and description for fingerprint setup
class FingerprintSetupHeader extends StatelessWidget {
  const FingerprintSetupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: context.heightScale(AppDimensions.spacingMassive),
        ),
        Text(
          AppStrings.setYourFingerPrint,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.biometricTextPrimary,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
