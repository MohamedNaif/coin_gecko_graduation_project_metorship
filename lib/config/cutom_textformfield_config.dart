import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldConfig {
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final int? maxLines;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final double? width;
  final void Function()? onTap;
  final bool? readonly;
  final TextInputType? keyboardType;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final void Function(String)? onFieldSubmitted;
  final String? headerText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool shouldTrimInput; 

  const CustomTextFieldConfig({
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.maxLines,
    this.onSaved,
    this.validator,
    this.controller,
    this.onChanged,
    this.hintStyle,
    this.decoration,
    this.width,
    this.onTap,
    this.readonly,
    this.keyboardType,
    this.enabled,
    this.focusNode,
    this.textInputAction,
    this.fillColor,
    this.onFieldSubmitted,
    this.headerText,
    this.maxLength,
    this.inputFormatters,
    this.shouldTrimInput = true, // Default: true
  });

  // Builder Pattern Methods 
  CustomTextFieldConfig copyWith({
    bool? obscureText,
    String? labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextStyle? style,
    int? maxLines,
    Function(String?)? onSaved,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function(String)? onChanged,
    TextStyle? hintStyle,
    InputDecoration? decoration,
    double? width,
    void Function()? onTap,
    bool? readonly,
    TextInputType? keyboardType,
    bool? enabled,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    Color? fillColor,
    void Function(String)? onFieldSubmitted,
    String? headerText,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    bool? shouldTrimInput,
  }) {
    return CustomTextFieldConfig(
      obscureText: obscureText ?? this.obscureText,
      labelText: labelText ?? this.labelText,
      hintText: hintText ?? this.hintText,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      style: style ?? this.style,
      maxLines: maxLines ?? this.maxLines,
      onSaved: onSaved ?? this.onSaved,
      validator: validator ?? this.validator,
      controller: controller ?? this.controller,
      onChanged: onChanged ?? this.onChanged,
      hintStyle: hintStyle ?? this.hintStyle,
      decoration: decoration ?? this.decoration,
      width: width ?? this.width,
      onTap: onTap ?? this.onTap,
      readonly: readonly ?? this.readonly,
      keyboardType: keyboardType ?? this.keyboardType,
      enabled: enabled ?? this.enabled,
      focusNode: focusNode ?? this.focusNode,
      textInputAction: textInputAction ?? this.textInputAction,
      fillColor: fillColor ?? this.fillColor,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      headerText: headerText ?? this.headerText,
      maxLength: maxLength ?? this.maxLength,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      shouldTrimInput: shouldTrimInput ?? this.shouldTrimInput,
    );
  }
}