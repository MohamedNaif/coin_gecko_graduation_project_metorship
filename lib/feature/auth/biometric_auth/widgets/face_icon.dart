// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';

class FaceIcon extends StatelessWidget {
final  String icon;
  const FaceIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.faceIdIconSize,
      width: AppDimensions.faceIdIconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimensions.biometricPaddingHorizontal,
        ),
        border: Border.all(
          color: AppColors.biometricBlue.withValues(alpha: 0.15),
          width: 2,
        ),
        color: AppColors.darkTextPrimary
      ),
      padding: const EdgeInsets.all(
        AppDimensions.faceIdIconPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              AppColors.biometricBlue,
              BlendMode.srcIn,
            ),
          ),
          Text(
            AppStrings.faceID,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.biometricTextPrimary,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
