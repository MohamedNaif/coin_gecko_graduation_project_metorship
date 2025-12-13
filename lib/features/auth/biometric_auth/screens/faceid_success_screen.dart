import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/face_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaceIdSuccessScreen extends StatelessWidget {
  const FaceIdSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.faceIdBackground,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: FaceIcon(
            icon: AppAssets.iconRightCircle,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              AppStrings.youreReady,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            SizedBox(height: context.heightScale(AppDimensions.spacingXSmall)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                borderRadius: AppDimensions.borderRadiusLarge,
                widthPadding: AppDimensions.paddingButton,
                height: AppDimensions.buttonHeightLarge,
                text: AppStrings.continueToHome,
                onTap: () {
                  context.read<BiometricCubit>().enableBiometric();
                  Navigator.pushReplacementNamed(context, Routes.homeScreen);
                },
                color: AppColors.primaryLight,
                textStyle: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ), 
          ],
        ),
      ],
    );
  }
}
