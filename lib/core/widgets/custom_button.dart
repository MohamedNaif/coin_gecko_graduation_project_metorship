import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

// import 'package:points/config/theme/app_style.dart';

// ignore: must_be_immutable

class CustomButton extends StatelessWidget {
  final String? text;
  final double? widthPadding;
  final Function()? onTap;
  final Widget? widget;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final Color? loadingColor;
  final bool? haveBorder;
  final bool? isSecColor;
  final TextStyle? textStyle;

  final bool isLoading;
  final bool? isDisabled;
  const CustomButton({
    super.key,
    this.text,
    this.haveBorder = false,
    this.height,
    this.color,
    this.width,
    this.borderRadius,
    required this.onTap,
    this.widget,
    this.textStyle,
    this.isSecColor,
    this.widthPadding,
    this.borderColor,
    this.loadingColor,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: (isDisabled ?? false)
            ? (color ?? AppColors.primaryLight).withValues(alpha: 0.6)
            : (color ?? AppColors.primaryLight),
      ),
      height: height ?? 40,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: widthPadding ?? 16),
          overlayColor: AppColors.primaryLight,
          elevation: 0,
          shadowColor: Colors.black12,
          backgroundColor: color ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            side: !(haveBorder ?? false)
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ?? AppColors.primaryLight,
                    width: 1.5,
                  ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8).copyWith(),
          ),
        ),
        onPressed: isLoading || (isDisabled ?? false) ? null : onTap,
        child: isLoading
            ? Center(
                child: SizedBox(
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator(
                          color: loadingColor ?? AppColors.white,

                          radius: 12,
                        )
                      : CircularProgressIndicator(
                          color: loadingColor ?? AppColors.white,
                          strokeWidth: 2.5,
                        ),
                ),
              )
            : text != null
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text!,
                  style:
                      textStyle ??
                      (haveBorder == true
                          ? AppTextStyles.semiBold16.copyWith(
                              // color: AppColors.primary700,
                            )
                          : AppTextStyles.semiBold16.copyWith(
                              color: Colors.white,
                            )),
                ),
              )
            : widget,
      ),
    );
  }
}
