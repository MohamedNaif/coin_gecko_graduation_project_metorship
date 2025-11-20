// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

// enum StatusType {
//   active,
//   inactive,
//   pending,
//   blocked,
//   rejected;

//   Color get backgroundColor {
//     switch (this) {
//       case StatusType.active:
//         return AppColors.green50;
//       case StatusType.inactive:
//         return AppColors.red50;
//       case StatusType.pending:
//         return AppColors.yellow50;
//       case StatusType.blocked:
//         return AppColors.red50;
//       case StatusType.rejected:
//         return AppColors.red50;
//     }
//   }

//   Color get textColor {
//     switch (this) {
//       case StatusType.active:
//         return AppColors.green500;
//       case StatusType.inactive:
//         return AppColors.red500;
//       case StatusType.pending:
//         return AppColors.yellow500;
//       case StatusType.blocked:
//         return AppColors.red500;
//       case StatusType.rejected:
//         return AppColors.red500;
//     }
//   }

//   String get arabicText {
//     switch (this) {
//       case StatusType.active:
//         return 'نشط';
//       case StatusType.inactive:
//         return 'غير نشط';
//       case StatusType.pending:
//         return 'معلق';
//       case StatusType.blocked:
//         return 'محظور';
//       case StatusType.rejected:
//         return 'مرفوض';
//     }
//   }
// }

// class StatusBadge extends StatelessWidget {
//   const StatusBadge({
//     super.key,
//     required this.status,
//     this.customText,
//     this.customBackgroundColor,
//     this.customTextColor,
//     this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     this.borderRadius = 6,
//     this.textStyle,
//   });

//   final StatusType status;
//   final String? customText;
//   final Color? customBackgroundColor;
//   final Color? customTextColor;
//   final EdgeInsetsGeometry padding;
//   final double borderRadius;
//   final TextStyle? textStyle;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding,
//       decoration: BoxDecoration(
//         color: customBackgroundColor ?? status.backgroundColor,
//         borderRadius: BorderRadius.circular(borderRadius),
//       ),
//       child: Text(
//         customText ?? status.arabicText,
//         style: (textStyle ?? AppTextStyles.semiBold16).copyWith(
//           color: customTextColor ?? status.textColor,
//         ),
//       ),
//     );
//   }
// }
