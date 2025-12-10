import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetFingerprintScreen extends StatelessWidget {
  const SetFingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: BlocListener<BiometricCubit, BiometricState>(
          listener: (context, state) {
            if (state is BiometricUnsupported) {
              showCherryToast(
                context,
                AppStrings.fingerPrintVerify,
                type: ToastType.error,
              );
              Navigator.pushReplacementNamed(context, Routes.home);
            } else if (state is BiometricFailure) {
              showCherryToast(
                context,
                state.errorMessage,
                type: ToastType.error,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.biometricPaddingHorizontal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.heightScale(AppDimensions.spacingMassive)),
                Text(
                  AppStrings.setYourFingerPrint,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.biometricTextPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: context.heightScale(AppDimensions.spacingXXXLarge)),
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
                SizedBox(height: context.heightScale(AppDimensions.spacingGiant)),
                Text(
                  AppStrings.placeFingerOnSensor,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primaryLight,
                        height: 1.5,
                      ),
                ),
                const Spacer(),
                CustomButton(
                  borderRadius: AppDimensions.borderRadiusLarge,
                  widthPadding: AppDimensions.paddingButton,
                  height: AppDimensions.buttonHeightLarge,
                  text: AppStrings.continueText,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.fingerprintScanningScreen,
                    );
                  },
                  color: AppColors.primaryLight,
                  textStyle: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.heightScale(AppDimensions.spacingMedium)),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.setFaceIdScreen,
                    );
                  },
                  child: Text(
                    AppStrings.skip,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: context.heightScale(AppDimensions.spacingXSmall)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

