import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  final BuildContext context;
  final String header;
  final String? description;
  final ToastificationType type;

  CustomToast({
    required this.context,
    required this.header,
    this.description,
    this.type = ToastificationType.success,
  });

  void showBottomToast() {
    toastification.dismissAll();

    toastification.show(
      primaryColor: type == ToastificationType.success
          ? AppColors.primary1
          : null,
      context: context,
      dragToClose: true,
      // showProgressBar: true,
      style: ToastificationStyle.fillColored,
      applyBlurEffect: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.always,
        // buttonBuilder: (context, onClose) {
        //   return IconButton(
        //     icon: const Icon(
        //       Icons.close,
        //       size: 20,
        //       color: Colors.white,
        //     ),
        //     onPressed: onClose,
        //     color: type == ToastificationType.success
        //         ? AppColors.red500
        //         : Colors.white,
        //   );
        // },
      ),
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 4).copyWith(bottom: 16),
      type: type,
      showIcon: true,
      icon: Icon(
        size: 28,
        type == ToastificationType.success
            ? Icons.check_circle_outline_rounded
            : Icons.error_outline_rounded,
        color: type == ToastificationType.success
            ? AppColors.white
            : Colors.white,
      ),
      title: Text(header, style: AppTextStyles.regular16),
      description: description != null
          ? Text(description!, style: AppTextStyles.regular14)
          : null,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
