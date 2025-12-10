import 'package:cherry_toast/resources/arrays.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

import 'package:toastification/toastification.dart';

enum ToastType { success, error, info }

void showCherryToast(
  BuildContext context,
  String message, {
  ToastType type = ToastType.info,
}) async {
  // Define colors and icons based on type
  Color backgroundColor;
  IconData icon;

  switch (type) {
    case ToastType.success:
      backgroundColor = Colors.green;
      icon = Icons.check_circle;
      break;
    case ToastType.error:
      backgroundColor = Colors.red;
      icon = Icons.error;
      break;
    case ToastType.info:
      backgroundColor = Colors.blue;
      icon = Icons.info;
      break;
  }

  // Show the toast
  CherryToast(
    themeColor: Colors.white,
    title: Text(
      message,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
    backgroundColor: backgroundColor,
    displayIcon: true,
    iconWidget: Icon(icon),
    animationType: AnimationType.fromRight,
    animationDuration: const Duration(milliseconds: 500),
    toastDuration: const Duration(seconds: 2),
  ).show(context);
}

void showSnackBar({
  required String message,
  required BuildContext context,
  ToastificationType notificationType = ToastificationType.success,
  int duration = 3,
}) {
  toastification.show(
    showProgressBar: true,
    context: context,
    title: Text(
      textAlign: TextAlign.center,
      message,
      maxLines: 3,
      style: AppTextStyles.medium14.copyWith(color: AppColors.gray400),
    ),
    type: notificationType,
    style: ToastificationStyle.flat,
    alignment: Alignment.topCenter,
    direction: TextDirection.rtl,
    autoCloseDuration: Duration(seconds: duration),
  );
}
