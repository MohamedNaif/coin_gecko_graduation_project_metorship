// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final IconData? prefixIcon;
//   final String? prefixText;
//   final bool obscureText;
//   final TextInputType? keyboardType;
//   final void Function(String)? onChanged;
//   final String? Function(String?)? validator;
//   final bool readOnly;
//   final VoidCallback? onTap;

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     this.prefixIcon,
//     this.prefixText,
//     this.obscureText = false,
//     this.keyboardType,
//     this.onChanged,
//     this.validator,
//     this.readOnly = false,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       onChanged: onChanged,
//       validator: validator,
//       readOnly: readOnly,
//       onTap: onTap,
//       style: AppTextStyles.regular14.copyWith(color: AppColors.grayscaleBorder),
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: AppTextStyles.regular14.copyWith(
//           color: AppColors.grayscaleBackground,
//         ),
//         prefixIcon: prefixIcon != null
//             ? Icon(prefixIcon, color: AppColors.grayscaleBorder, size: 20)
//             : null,
//         prefixText: prefixText,
//         prefixStyle: AppTextStyles.regular14.copyWith(
//           color: AppColors.grayscaleBorder,
//         ),
//         filled: true,
//         fillColor: AppColors.grayscaleBackground,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 12,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: AppColors.grayscaleBorder,
//             width: 1,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: AppColors.grayscaleBorder,
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.primary1, width: 1.5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.red, width: 1),
//         ),
//       ),
//     );
//   }
// }
