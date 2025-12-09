import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
<<<<<<< HEAD:lib/feature/auth/presentation/screens/register_screen_body.dart
import 'package:coin_gecko_graduation_project_metorship/feature/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/register_state.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/custom_auth_title.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/custom_register_form.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/switch_auth_text.dart';
=======
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/cubit/register_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/custom_register_form.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/switch_auth_text.dart';
>>>>>>> origin/main:lib/features/auth/presentation/screens/register_screen_body.dart
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
<<<<<<< HEAD:lib/feature/auth/presentation/screens/register_screen_body.dart
               SizedBox(height: context.heightScale(AppDimensions.spacingXXXLarge)),
              
=======
              const SizedBox(height: AppDimensions.spacingXXXLarge),
>>>>>>> origin/main:lib/features/auth/presentation/screens/register_screen_body.dart
              const CustomAuthTitle(
                title: AppStrings.createYourAccount,
                subTitle: AppStrings.signUpSubtitle,
              ),
<<<<<<< HEAD:lib/feature/auth/presentation/screens/register_screen_body.dart
              
               SizedBox(height:context.heightScale (AppDimensions.spacingXXLarge)),
              
=======
              const SizedBox(height: AppDimensions.spacingXXLarge),
>>>>>>> origin/main:lib/features/auth/presentation/screens/register_screen_body.dart
              const CustomRegisterForm(),
              BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterFailure) {
                    showCherryToast(
                      context,
                      state.errorMessage,
                      type: ToastType.error,
                    );
                  } else if (state is RegisterSuccess) {
                    showCherryToast(
                      context,
                      AppStrings.registerSuccessful,
                      type: ToastType.success,
                    );
                    // Navigate to set biometric auth screen
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.setFingerprintScreen,
                    );
                  }
                },
                child: CustomButton(
                  isLoading:
                      context.read<RegisterCubit>().state is RegisterLoading,
                  borderRadius: AppDimensions.borderRadiusLarge,
                  widthPadding: AppDimensions.paddingButton,
                  height: AppDimensions.buttonHeightLarge,
                  onTap: () {
                    context.read<RegisterCubit>().register();
                  },
                  text: AppStrings.registerButton,
                  color: AppColors.primaryLight,
                  textStyle: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacingLarge),
              SwitchAuthText(
                onTap: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                questionText: AppStrings.alreadyHaveAccount,
                actionText: AppStrings.loginAction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
