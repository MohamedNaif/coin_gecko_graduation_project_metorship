import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Displays the success icon and title for fingerprint scanning completion
class FingerprintScanSuccessHeader extends StatelessWidget {
  const FingerprintScanSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.heightScale(AppDimensions.spacingGigantic),
        ),
        SvgPicture.asset(
          AppAssets.successIcon,
          width: AppDimensions.biometricIconSize,
          height: AppDimensions.biometricIconSize,
        ),
        SizedBox(
          height: context.heightScale(AppDimensions.spacingLarge),
        ),
        Text(
          'Your scanning is complete',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.biometricTextPrimary,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
