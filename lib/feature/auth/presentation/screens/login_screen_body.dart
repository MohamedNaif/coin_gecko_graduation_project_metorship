import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/biometric_auth.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/custom_auth_title.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/custom_login_forms.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/login_methods_section.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/remember_me_section.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/switch_auth_text.dart';
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
            SizedBox(
              height: 120,
            ),
            CustomAuthTitle(
                title: "Login To Your Account",
                subTitle: 'Welcome back you’ve\nbeen missed!'),
            SizedBox(
              height: 80,
            ),
            CustomLoginForms(),
            SizedBox(
              height: 16,
            ),
            RememberMeSection(),
            SizedBox(
              height: 30,
            ),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  showCherryToast(context, state.errorMessage,
                      type: ToastType.error);
                } else if (state is LoginSuccess) {
                  showCherryToast(context, "Login Successful",
                      type: ToastType.success);
                }
              },
              child: CustomButton(
                borderRadius: 30,
                widthPadding: 16,
                height: 50,
                onTap: () {
                  context.read<LoginCubit>().signIn();
                },
                text: 'Login',
                color: AppColors.primaryLight,
                textStyle: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            LoginMethodsSection(),
            SizedBox(
              height: 20,
            ),
            BiometricAuthSection(),
            SizedBox(
              height: 15,
            ),
            SwitchAuthText(
              questionText: 'Don’t have an account? ',
              actionText: 'Sign Up',
              onTap: () {
                Navigator.pushNamed(context, Routes.register);
              },
            )
          ],
        ),
      ),
    );
  }
}
