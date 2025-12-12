import 'package:bloc/bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';


class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo) : super(const LoginState.initial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  signIn() {
    if (!(formKey.currentState?.validate() ?? true)) return;
    emit(const LoginState.loading());
    _authRepo
        .signIn(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((result) {
      result.fold((failure) {
        emit(LoginState.failure(failure.errMessage));
      }, (userModel) {
        emit(const LoginState.success());
      });
    });
  }

  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
