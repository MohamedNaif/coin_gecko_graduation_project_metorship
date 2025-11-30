import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/utils/validator.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_text_form_field.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomRegisterForm extends StatelessWidget {
  
  CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key:context.read<RegisterCubit>().formKey,
        child: Column(
          children: [
            CustomTextFormField(
            
              controller: context.read<RegisterCubit>(). firstNameController,
              validator: (name) => Validator.validateName(name),
              obscureText: false,
              hintText: 'First Name',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.personIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
          
              controller:context.read<RegisterCubit>(). lastNameController,
              validator: (name) => Validator.validateName(name),
              obscureText: false,
              hintText: 'Last Name',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.personIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
            
              controller:context.read<RegisterCubit>(). emailController,
              validator: (email) => Validator.validateEmail(email),
              obscureText: false,
              hintText: 'Email',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.emailIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
            
              controller:context.read<RegisterCubit>(). passwordController,
              validator: (password) => Validator.validatePassword(password),
              obscureText: false,
              hintText: 'Password',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.passwordIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              
              controller:context.read<RegisterCubit>(). confirmPasswordController,
              validator: (confirmPassword) => Validator.validateConfirmPassword(
                  confirmPassword,context.read<RegisterCubit>(). passwordController.text),
              obscureText: false,
              hintText: 'Confirm Password',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.passwordIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
            
              controller:context.read<RegisterCubit>(). phoneNumberController,
              validator: (phoneNumber) =>
                  Validator.validatePhoneNumber(phoneNumber),
              obscureText: false,
              hintText: 'Phone Number',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: SvgPicture.asset(
                  AppAssets.phoneIcon,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
