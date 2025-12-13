import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/animated_widgets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/page_fade_transition.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/page_slide_transition.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/faceid_success_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/index.dart';
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
      bloc: context.read<BiometricCubit>(),
      listener: _handleBiometricState,
      child: Stack(
        children: [
          AnimatedScaleInWidget(
            duration: const Duration(milliseconds: 800),
            child: const FaceIdCameraFrame(),
          ),
          SafeArea(
            child: Column(
              children: [
                AnimatedSlideInWidget(
                  duration: const Duration(milliseconds: 900),
                  child: const FaceIdScanInstructions(),
                ),
                const Spacer(),
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.biometricPaddingHorizontal,
      ),
      child: Column(
        children: [
          AnimatedScaleInWidget(
            duration: const Duration(milliseconds: 500),
            child: FaceIdAuthButton(
              onTap: () => context.read<BiometricCubit>().authenticate(
                    type: BiometricType.face,
                    reason: AppStrings.verifyFaceIdMessage,
                  ),
            ),
          ),
          SizedBox(height: context.heightScale(AppDimensions.spacingMedium)),
          AnimatedFadeInWidget(
            duration: const Duration(milliseconds: 1200),
            child: FaceIdSkipButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.home),
            ),
          ),
          SizedBox(height: context.heightScale(AppDimensions.spacingXSmall)),
        ],
      ),
    );
  }

  void _handleBiometricState(BuildContext context, BiometricState state) {
    state.when(
      initial: () {},
      loading: () {},
      unsupported: () {
        showCherryToast(
          context,
          AppStrings.biometricNotSupported,
          type: ToastType.error,
        );
        Navigator.of(context).pushReplacement(
          PageSlideTransition(
            page: const Scaffold(),
            direction: AxisDirection.left,
          ),
        );
      },
      success: (_, __, authenticated, ___) {
        if (authenticated == true) {
          Navigator.of(context).pushReplacement(
            PageFadeTransition(page: const FaceIdSuccessScreen()),
          );
        }
      },
      cancelled: () {},
      failure: (errorMessage, isCancellation) {
        if (!isCancellation) {
          showCherryToast(
            context,
            errorMessage,
            type: ToastType.error,
          );
        }
      },
    );
  }
}
