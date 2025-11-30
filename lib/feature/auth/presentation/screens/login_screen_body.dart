import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/utils/validator.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_text_form_field.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/biometric_auth.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/custom_auth_title.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/login_methods_section.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/remember_me_section.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/switch_auth_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            CustomTextFormField(
              // controller:context.read<RegisterCubit>(). emailController,
              validator: (email) => Validator.validateEmail(email),
              obscureText: false,
              hintText: 'Email',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.emailIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              // controller:context.read<RegisterCubit>(). passwordController,
              validator: (password) => Validator.validatePassword(password),
              obscureText: true,
              hintText: 'Password',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.passwordIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RememberMeSection(),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              borderRadius: 30,
              widthPadding: 16,
              height: 50,
              onTap: () {},
              text: 'Login',
              color: AppColors.primaryLight,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
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
              questionText: 'Don’t have an account?',
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
