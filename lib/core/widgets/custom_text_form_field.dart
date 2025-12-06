
import 'package:coin_gecko_graduation_project_metorship/config/cutom_textformfield_config.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';

class CustomTextFormField extends StatelessWidget {
  final CustomTextFieldConfig config;

  const CustomTextFormField({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingHorizontal, 
      ),
      child: TextFormField(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        inputFormatters: config.inputFormatters,
        obscuringCharacter: '*',
        textInputAction: config.textInputAction,
        cursorColor: AppColors.primaryLight,
        textDirection: TextDirection.ltr,
        style: config.style ?? AppTextStyles.medium14,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: config.focusNode,
        enabled: config.enabled ?? true,
        keyboardType: config.keyboardType ?? TextInputType.text,
        readOnly: config.readonly ?? false,
        onTap: config.onTap ?? () {},
        maxLength: config.maxLength,
        controller: config.controller,
        onSaved: config.onSaved != null
            ? (value) => config.onSaved!(
                config.shouldTrimInput ? value?.trim() : value) 
            : null,
        onChanged: config.onChanged != null
            ? (value) {
                final processedValue =
                    config.shouldTrimInput ? value.trim() : value;
                config.onChanged!(processedValue);
              }
            : null,
        onFieldSubmitted: config.onFieldSubmitted != null
            ? (value) => config.onFieldSubmitted!(
                config.shouldTrimInput ? value.trim() : value)
            : null,
        textAlign: TextAlign.left,
        validator: config.validator != null
            ? (value) => config.validator!(
                config.shouldTrimInput ? value?.trim() : value)
            : null,
        obscureText: config.obscureText,
        decoration: config.decoration ?? _buildDefaultDecoration(),
      ),
    );
  }

  InputDecoration _buildDefaultDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppDimensions.textFieldVerticalPadding, 
      ),
      filled: true,
      hoverColor: Colors.transparent,
      fillColor: config.fillColor ?? AppColors.lightBackground,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.borderRadiusMedium, 
        ),
        borderSide: const BorderSide(
          color: Colors.red,
          width: AppDimensions.borderWidth, 
        ),
      ),
      labelText: config.labelText,
      alignLabelWithHint: true,
      hintText: config.hintText,
      hintStyle: config.hintStyle ??
          AppTextStyles.medium14.copyWith(
            color: AppColors.gray400,
          ),
      prefixIcon: config.prefixIcon,
      prefixIconConstraints: const BoxConstraints(
        maxHeight: AppDimensions.iconConstraintSize, 
        maxWidth: AppDimensions.iconConstraintSize, 
      ),
      suffixIcon: config.suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.borderRadiusMedium,
        ),
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
          width: AppDimensions.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.borderRadiusMedium,
        ),
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
          width: AppDimensions.borderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.borderRadiusMedium,
        ),
        borderSide: const BorderSide(
          color: Colors.red,
          width: AppDimensions.errorBorderWidth, 
        ),
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: AppDimensions.errorTextSize, 
      ),
      errorMaxLines: AppDimensions.errorMaxLines, 
    );
  }
}