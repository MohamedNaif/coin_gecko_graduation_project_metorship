import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Displays the fingerprint icon in a circular container
class FingerprintIconDisplay extends StatelessWidget {
  const FingerprintIconDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.heightScale(AppDimensions.spacingXXXLarge),
        ),
        Container(
          height: AppDimensions.biometricIconSize,
          width: AppDimensions.biometricIconSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.biometricLightBlue,
          ),
          padding: const EdgeInsets.all(AppDimensions.biometricOptionPadding),
          child: SvgPicture.asset(
            AppAssets.fingerPrintIcon,
            colorFilter: const ColorFilter.mode(
              AppColors.biometricBlue,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
