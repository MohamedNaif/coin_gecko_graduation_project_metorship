import 'package:coin_gecko_graduation_project_metorship/core/animations/animated_widgets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/page_fade_transition.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/page_slide_transition.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/fingerprint_scanning_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_continue_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_icon_display.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_setup_header.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_setup_instructions.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_skip_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';


class SetFingerprintScreen extends StatefulWidget {
  const SetFingerprintScreen({super.key});

  @override
  State<SetFingerprintScreen> createState() => _SetFingerprintScreenState();
}

class _SetFingerprintScreenState extends State<SetFingerprintScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.biometricPaddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSlideInWidget(
                child: const FingerprintSetupHeader(),
              ),
              AnimatedScaleInWidget(
                duration: const Duration(milliseconds: 1000),
                child: const FingerprintIconDisplay(),
              ),
              AnimatedFadeInWidget(
                duration: const Duration(milliseconds: 1200),
                child: const FingerprintSetupInstructions(),
              ),
              const Spacer(),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return BlocListener<BiometricCubit, BiometricState>(
      listener: _handleBiometricState,
      child: Column(
        children: [
          AnimatedScaleInWidget(
            duration: const Duration(milliseconds: 500),
            child: FingerprintContinueButton(
              onTap: () => context.read<BiometricCubit>().authenticate(
                    type: BiometricType.fingerprint,
                    reason: AppStrings.verifyFingerprintMessage,
                  ),
            ),
          ),
          SizedBox(height: context.heightScale(AppDimensions.spacingMedium)),
          AnimatedFadeInWidget(
            duration: const Duration(milliseconds: 1300),
            child: FingerprintSkipButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                PageSlideTransition(
                  page: const HomeScreen(),
                  direction: AxisDirection.left,
                ),
              ),
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
          PageFadeTransition(page: const HomeScreen()),
        );
      },
      success: (_, __, authenticated, ___) {
        if (authenticated == true) {
          Navigator.of(context).pushReplacement(
            PageSlideTransition(
              page: const FingerprintScanningScreen(),
              direction: AxisDirection.left,
            ),
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
