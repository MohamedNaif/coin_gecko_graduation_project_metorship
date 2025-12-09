import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/face_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

class FaceIdCameraScreen extends StatefulWidget {
  const FaceIdCameraScreen({super.key});

  @override
  State<FaceIdCameraScreen> createState() => _FaceIdCameraScreenState();
}

class _FaceIdCameraScreenState extends State<FaceIdCameraScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<BiometricCubit, BiometricState>(
      listener: (context, state) {
        if (state is BiometricSuccess && state.authenticated == true) {
          Navigator.pushReplacementNamed(
            context,
            Routes.faceIdSuccessScreen,
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
            AppStrings.verifyFaceIdMessage,
            type: ToastType.error,
          );
        }
      },
      child: Stack(
        children: [
          // SizedBox(height: context.heightScale(AppDimensions.spacingLarge)),
          Image.asset(AppAssets.faceIdBackground, fit: BoxFit.fill,
          width: double.infinity, height: double.infinity,
          ),
          Center(child: FaceIcon(icon: AppAssets.faceIdIcon,) ,),
        Column(
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
              SizedBox(
                  height: context.heightScale(AppDimensions.spacingLarge)),
              Text(
                AppStrings.placeFaceUntilFills,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
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
                  context.read<BiometricCubit>().authenticate(
                        type: BiometricType.face,
                        reason: AppStrings.verifyFaceIdMessage,
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
                    Routes.home,
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
        ],
      ),
    );
  }
}

