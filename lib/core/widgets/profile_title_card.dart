// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

// class ProfileTitleCard extends StatelessWidget {
//   final String title;
//   final Widget icon;
//   final EdgeInsetsGeometry? margin;
//   final EdgeInsetsGeometry? padding;
//   final Widget? widget;
//   final TextDirection? textDirection;

//   const ProfileTitleCard({
//     super.key,
//     required this.title,
//     required this.icon,
//     this.margin,
//     this.padding,
//     this.widget,
//     this.textDirection,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: margin ?? const EdgeInsets.symmetric(horizontal: 12),
//       padding:
//           padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColors.foreground100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           icon,
//           const SizedBox(width: 12),
//           Text(
//             title,
//             textAlign: TextAlign.right,
//             style: AppTextStyles.medium16.copyWith(color: AppColors.black),
//             textDirection: textDirection ?? TextDirection.rtl,
//           ),
//           const Spacer(),
//           widget ?? const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
