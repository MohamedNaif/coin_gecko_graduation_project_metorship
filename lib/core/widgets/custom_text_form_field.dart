import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.obscureText,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.onSaved,
    this.onChanged, // Added onChanged
    this.validator,
    this.controller,
    this.hintStyle,
    this.decoration,
    this.style,
    this.width,
    this.onTap,
    this.readonly,
    this.keyboardType,
    this.enabled,
    this.textInputAction, // Added textInputAction
    this.focusNode,
    this.fillColor, // Added controller
    this.onFieldSubmitted,
    this.headerText,
    this.maxLength,
    this.inputFormatters,
  });
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final int? maxLines;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller; // Added controller
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final double? width;
  final void Function()? onTap;
  final bool? readonly;
  final TextInputType? keyboardType;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction; // Added textInputAction
  final Color? fillColor;
  final void Function(String)? onFieldSubmitted;
  final String? headerText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  // Added onChanged
  final TextAlign textAlign = TextAlign.left;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: TextFormField(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        inputFormatters: inputFormatters,
        obscuringCharacter: '*',
        textInputAction: textInputAction,
        cursorColor: AppColors.primaryLight,
        textDirection: TextDirection.ltr,
        style: style ?? AppTextStyles.medium14,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        enabled: enabled ?? true,
        keyboardType: keyboardType ?? TextInputType.text,
        readOnly: readonly ?? false,
        onTap: onTap ?? () {},
        maxLength: maxLength,
        controller: controller, // Using the controller here
        onSaved: onSaved != null ? (value) => onSaved!(value?.trim()) : null,
        onChanged: (value) {
          final trimmed = value.trim();

          if (onChanged != null) {
            onChanged!(trimmed);
          }
        }, // Using the onChanged callback
        onFieldSubmitted: onFieldSubmitted != null
            ? (value) => onFieldSubmitted!(value.trim())
            : null,
        textAlign: textAlign,
        // maxLines: widget.maxLines ?? null,
        validator:
            validator != null ? (value) => validator!(value?.trim()) : null,
        obscureText: obscureText,
        decoration: decoration ??
            InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),

              filled: true,
              hoverColor: Colors.transparent,
              fillColor: AppColors.lightBackground,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),

              labelText: labelText,
              alignLabelWithHint: true,
              hintText: hintText,
              hintStyle: hintStyle ??
                  AppTextStyles.medium14.copyWith(
                    color: AppColors.gray400,
                  ),
              prefixIcon: prefixIcon,

              prefixIconConstraints: const BoxConstraints(
                maxHeight: 55.0,
                maxWidth: 55.0,
              ),
              suffixIcon: suffixIcon,
              // Add unfocused border color
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: AppColors.primaryLight,
                  width: 1.5, // Border width
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: AppColors.primaryLight, // Color when focused
                  width: 1.5, // Border width
                ),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.red, // Error border color
                  width: 1.0, // Border width
                ),
              ),
              errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
              errorMaxLines: 3,
            ),
      ),
    );
  }
}
