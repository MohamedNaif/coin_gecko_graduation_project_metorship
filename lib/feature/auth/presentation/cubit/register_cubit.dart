import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  register() async {
    if (!(formKey.currentState?.validate() ?? true)) return;

    emit(RegisterLoading());
    final result = await authRepo.register(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneNumberController.text,
    );
    result.fold((failure) {
      emit(RegisterFailure(errorMessage: failure.errMessage));
      log('Error in register cubit: ${failure.errMessage}');
    }, (userModel) => emit(RegisterSuccess()));
  }
}
