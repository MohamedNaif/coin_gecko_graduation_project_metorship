import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/utils/validator.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_text_form_field.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomLoginForms extends StatelessWidget {
  const CustomLoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
        child: Column(
      children: [
        CustomTextFormField(
          controller:context.read<LoginCubit>(). emailController,
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
          controller:context.read<LoginCubit>(). passwordController,
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
      ],
    ));
  }
}
