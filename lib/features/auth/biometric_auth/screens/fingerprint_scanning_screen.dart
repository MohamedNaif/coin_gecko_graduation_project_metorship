// FingerprintScanningScreen
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintScanningScreen extends StatefulWidget {
  const FingerprintScanningScreen({super.key});

  @override
  State<FingerprintScanningScreen> createState() =>
      _FingerprintScanningScreenState();
}

class _FingerprintScanningScreenState extends State<FingerprintScanningScreen> {
  @override
  void initState() {
    super.initState();
      context.read<BiometricCubit>().authenticate(
            type: BiometricType.fingerprint,
            reason: AppStrings.verifyFingerprintMessage,
          );
    
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: BlocListener<BiometricCubit, BiometricState>(
          listener: (context, state) {
            if (state is BiometricSuccess && state.authenticated == true) {
              Navigator.pushReplacementNamed(
                context,
                Routes.fingerprintSuccessScreen,
              );
            } else if (state is BiometricFailure) {
              showCherryToast(
                context,
                state.errorMessage,
                type: ToastType.error,
              );
            } else if (state is BiometricUnsupported) {
              showCherryToast(
                context,
                AppStrings.fingerPrintVerify,
                type: ToastType.error,
              );
              Navigator.pushReplacementNamed(
                context,
                Routes.setFaceIdScreen,
                arguments: context.read<BiometricCubit>(),
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
                  AppStrings.yourScanningIsComplete,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.biometricTextPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(
                  height: context.heightScale(AppDimensions.spacingMedium),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingLarge,
                  ),
                  child: Text(
                    AppStrings.youWillBeAbleToUseFingerPrint,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.biometricTextSecondary,
                          height: 1.5,
                        ),
                  ),
                ),
              
            SizedBox(
                  height: context.heightScale(AppDimensions.spacingGiant),
                ),
                CustomButton(
                  borderRadius: AppDimensions.borderRadiusLarge,
                  widthPadding: AppDimensions.paddingButton,
                  height: AppDimensions.buttonHeightLarge,
                  text: AppStrings.continueText,
                  onTap: () {
                    context.read<BiometricCubit>().authenticate(
                          type: BiometricType.fingerprint,
                          reason: AppStrings.verifyFingerprintMessage,
                        );
                  },
                  
                  color: AppColors.primaryLight,
                  textStyle: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: context.heightScale(AppDimensions.spacingSmall),
                ),
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
                SizedBox(
                  height: context.heightScale(AppDimensions.spacingXSmall),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
