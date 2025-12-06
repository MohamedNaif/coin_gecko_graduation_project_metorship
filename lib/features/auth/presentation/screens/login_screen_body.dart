import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/cubit/login_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/biometric_auth.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/custom_login_forms.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/login_methods_section.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/remember_me_section.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/widgets/switch_auth_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.spacingMassive),
            
            const CustomAuthTitle(
              title: AppStrings.loginToYourAccount,
              subTitle: AppStrings.loginSubtitle,
            ),
            
            const SizedBox(height: AppDimensions.spacingHuge),
            
            const CustomLoginForms(),
            
            const SizedBox(height: AppDimensions.spacingSmall),
            
            const RememberMeSection(),
            
            const SizedBox(height: AppDimensions.spacingXLarge),
            
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  showCherryToast(
                    context,
                    state.errorMessage,
                    type: ToastType.error,
                  );
                } else if (state is LoginSuccess) {
                  showCherryToast(
                    context,
                    AppStrings.loginSuccessful,
                    type: ToastType.success,
                  );
                }
              },
              child: CustomButton(
                borderRadius: AppDimensions.borderRadiusLarge,
                widthPadding: AppDimensions.paddingButton,
                height: AppDimensions.buttonHeightLarge,
                onTap: () {
                  context.read<LoginCubit>().signIn();
                },
                text: AppStrings.loginButton,
                color: AppColors.primaryLight,
                textStyle: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            
            const SizedBox(height: AppDimensions.spacingXLarge),
            
            const LoginMethodsSection(),
            
            const SizedBox(height: AppDimensions.spacingMedium),
            
            const BiometricAuthSection(),
            
            const SizedBox(height: AppDimensions.spacingXSmall),
            
            SwitchAuthText(
              questionText: AppStrings.dontHaveAccount,
              actionText: AppStrings.signUpAction,
              onTap: () {
                Navigator.pushNamed(context, Routes.register);
              },
            ),
          ],
        ),
      ),
    );
  }
}