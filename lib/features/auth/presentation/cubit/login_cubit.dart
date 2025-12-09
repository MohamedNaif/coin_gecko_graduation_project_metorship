import 'package:bloc/bloc.dart';
<<<<<<< HEAD:lib/feature/auth/presentation/cubit/login_cubit.dart
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/login_state.dart';
=======
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
>>>>>>> origin/main:lib/features/auth/presentation/cubit/login_cubit.dart
import 'package:flutter/material.dart';


class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo) : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  signIn() {
    if (!(formKey.currentState?.validate() ?? true)) return;
    emit(LoginLoading());
    _authRepo
        .signIn(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((result) {
      result.fold((failure) {
        emit(LoginFailure(errorMessage: failure.errMessage));
      }, (userModel) {
        emit(LoginSuccess());
      });
    });
  }

  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
