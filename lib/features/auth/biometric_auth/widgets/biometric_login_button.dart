import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class BiometricLoginButton extends StatelessWidget {
  const BiometricLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BiometricCubit, BiometricState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          unsupported: () {
            showCherryToast(
              context,
              AppStrings.fingerPrintVerify,
              type: ToastType.error,
            );
          },
          success: (_, __, authenticated, ___) {
            if (authenticated == true) {
              showCherryToast(
                context,
                AppStrings.loginSuccessful,
                type: ToastType.success,
              );
              Navigator.pushReplacementNamed(context, Routes.homeScreen);
            }
          },
          cancelled: () {},
          failure: (errorMessage, _) {
            showCherryToast(
              context,
              errorMessage,
              type: ToastType.error,
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<BiometricCubit>();
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingLarge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: isLoading
                    ? null
                    : () {
                        cubit.authenticate(
                          type: BiometricType.fingerprint,
                          reason: AppStrings.verifyFingerprintMessage,
                        );
                      },
                child: Opacity(
                  opacity: isLoading ? 0.5 : 1.0,
                  child: SvgPicture.asset(
                    AppAssets.fingerPrintIcon,
                    height: AppDimensions.biometricOptionSize,
                    width: AppDimensions.biometricOptionSize,
                  ),
                ),
              ),
              GestureDetector(
                onTap: isLoading
                    ? null
                    : () {
                        cubit.authenticate(
                          type: BiometricType.face,
                          reason: AppStrings.verifyFaceIdMessage,
                        );
                      },
                child: Opacity(
                  opacity: isLoading ? 0.5 : 1.0,
                  child: SvgPicture.asset(
                    AppAssets.faceId,
                    height: AppDimensions.biometricOptionSize,
                    width: AppDimensions.biometricOptionSize,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
