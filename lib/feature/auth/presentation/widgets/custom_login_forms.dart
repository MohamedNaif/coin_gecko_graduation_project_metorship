import 'package:coin_gecko_graduation_project_metorship/config/cutom_textformfield_config.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
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
    final cubit = context.read<LoginCubit>();
    
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            config: CustomTextFieldConfig(
              controller: cubit.emailController,
              validator: Validator.validateEmail,
              obscureText: false,
              hintText: AppStrings.emailHint,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: AppDimensions.iconPaddingLeftLarge,
                  right: AppDimensions.iconPaddingRight,
                ),
                child: SvgPicture.asset(AppAssets.emailIcon),
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSmall),
          
          CustomTextFormField(
            config: CustomTextFieldConfig(
              controller: cubit.passwordController,
              validator: Validator.validatePassword,
              obscureText: true,
              hintText: AppStrings.passwordHint,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: AppDimensions.iconPaddingLeftLarge,
                  right: AppDimensions.iconPaddingRight,
                ),
                child: SvgPicture.asset(AppAssets.passwordIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}