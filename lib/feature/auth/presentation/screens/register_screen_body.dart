import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/custom_register_form.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/custom_auth_title.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/widgets/switch_auth_text.dart';
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
              SizedBox(
                height: 100,
              ),
              CustomAuthTitle(
                title: 'Create Your Account',
                subTitle: "Sign up to enjoy the best managing \nexperience!",
              ),
              SizedBox(
                height: 50,
              ),
              CustomRegisterForm(),
              BlocListener<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterFailure) {
                    showCherryToast(context, state.errorMessage,
                        type: ToastType.error);
                  } else if (state is RegisterSuccess) {
                    showCherryToast(context, "Register Successful",
                        type: ToastType.success);
                  }
                },
                child: CustomButton(
                  isLoading:
                      context.read<RegisterCubit>().state is RegisterLoading,
                  borderRadius: 30,
                  widthPadding: 16,
                  height: 50,
                  onTap: () {
                    context.read<RegisterCubit>().register();
                  },
                  text: 'Register',
                  color: AppColors.primaryLight,
                  textStyle: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SwitchAuthText(
                onTap: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                questionText: 'Already have an account? ',
                actionText: 'Login',
              )
            ],
          ),
        ),
      ),
    );
  }
}
