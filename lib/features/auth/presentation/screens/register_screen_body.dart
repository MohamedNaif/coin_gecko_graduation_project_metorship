import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/animated_widgets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/page_slide_transition.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/set_fingerprint_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/cubit/register_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/cubit/register_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/screens/login_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/custom_register_form.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/switch_auth_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.heightScale(AppDimensions.spacingXXXLarge)),
              AnimatedSlideInWidget(
                duration: const Duration(milliseconds: 700),
                child: const CustomAuthTitle(
                  title: AppStrings.createYourAccount,
                  subTitle: AppStrings.signUpSubtitle,
                ),
              ),
              SizedBox(height: context.heightScale(AppDimensions.spacingXXLarge)),
              AnimatedSlideInWidget(
                duration: const Duration(milliseconds: 850),
                child: const CustomRegisterForm(),
              ),
              BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  state.when(
                    initial: () {},
                    loading: () {},
                    success: () {
                      showCherryToast(context, AppStrings.registerSuccessful, type: ToastType.success);
                      
                        Navigator.of(context).pushReplacement(
                          PageSlideTransition(
                            page: const SetFingerprintScreen(),
                            direction: AxisDirection.left,
                          ),
                        );
                    },
                    failure: (errorMessage) {
                      showCherryToast(context, errorMessage, type: ToastType.error);
                    },
                  );
                },
                child: AnimatedScaleInWidget(
                  duration: const Duration(milliseconds: 500),
                  child: CustomButton(
                    
                    borderRadius: AppDimensions.borderRadiusLarge,
                    widthPadding: AppDimensions.paddingButton,
                    height: AppDimensions.buttonHeightLarge,
                    onTap: () => context.read<RegisterCubit>().register(),
                    text: AppStrings.registerButton,
                    color: AppColors.primaryLight,
                    textStyle: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacingMedium),
              AnimatedFadeInWidget(
                duration: const Duration(milliseconds: 1100),
                child: SwitchAuthText(
                  onTap: () => Navigator.of(context).pushReplacement(
                    PageSlideTransition(
                      page: const LoginScreen(),
                      direction: AxisDirection.right,
                    ),
                  ),
                  questionText: AppStrings.alreadyHaveAccount,
                  actionText: AppStrings.loginAction,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}