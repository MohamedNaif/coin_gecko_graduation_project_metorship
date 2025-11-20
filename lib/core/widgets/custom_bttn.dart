// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/extension/responsive_text.dart';

// enum ButtonVariant { primary, outline, dark, danger, success }

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final ButtonVariant variant;
//   final String? icon;
//   final bool isLoading;
//   final double? width;
//   final double height;
//   final bool disabled;

//   const CustomButton({
//     super.key,
//     required this.text,
//     this.onPressed,
//     this.variant = ButtonVariant.primary,
//     this.icon,
//     this.isLoading = false,
//     this.width,
//     this.height = 48,
//     this.disabled = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: Material(
//         color: _getBackgroundColor(),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(8),
//           topRight: Radius.circular(8),
//           bottomLeft: Radius.circular(0),
//           bottomRight: Radius.circular(8),
//         ),
//         child: InkWell(
//           onTap: disabled || isLoading ? null : onPressed,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(8),
//             topRight: Radius.circular(8),
//             bottomLeft: Radius.circular(0),
//             bottomRight: Radius.circular(8),
//           ),
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               vertical: 4.responsive,
//               horizontal: 16.responsive,
//             ),
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(8),
//                 topRight: Radius.circular(8),
//                 bottomLeft: Radius.circular(0),
//                 bottomRight: Radius.circular(8),
//               ),
//               border: _getBorder(),
//             ),
//             child: Center(
//               child: isLoading
//                   ? SizedBox(
//                       width: 24,
//                       height: 24,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           _getContentColor(),
//                         ),
//                       ),
//                     )
//                   : Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         if (icon != null) ...[
//                           SvgPicture.asset(
//                             icon!,
//                             colorFilter: ColorFilter.mode(
//                               _getContentColor(),
//                               BlendMode.srcIn,
//                             ),
//                             height: 24,
//                             width: 24,
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                         Text(
//                           text,
//                           style: AppTextStyles.medium16.copyWith(
//                             color: _getContentColor(),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18.responsive,
//                           ),
//                         ),
//                       ],
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Color _getBackgroundColor() {
//     if (disabled) {
//       return AppColors.foreground100;
//     }

//     switch (variant) {
//       case ButtonVariant.primary:
//         return AppColors.main;
//       case ButtonVariant.outline:
//         return Colors.white;
//       case ButtonVariant.dark:
//         return const Color(0xFF1C1C1C);
//       case ButtonVariant.danger:
//         return AppColors.red500;

//       case ButtonVariant.success:
//         return const Color.fromARGB(255, 22, 168, 85);
//     }
//   }

//   Color _getContentColor() {
//     if (disabled) {
//       return AppColors.foreground600;
//     }

//     switch (variant) {
//       case ButtonVariant.primary:
//         return Colors.white;
//       case ButtonVariant.outline:
//         return AppColors.foreground700;
//       case ButtonVariant.dark:
//         return Colors.white;
//       case ButtonVariant.danger:
//         return Colors.white;
//       case ButtonVariant.success:
//         return Colors.white;
//     }
//   }

//   Border? _getBorder() {
//     if (variant == ButtonVariant.outline) {
//       return Border.all(
//         color: disabled ? AppColors.foreground200 : AppColors.zinc300,
//         width: 1.25,
//       );
//     }
//     return null;
//   }
// }

// // Example usage:
// // Primary Button (Orange):
// // CustomButton(
// //   text: 'إضافة منتج جديد',
// //   icon: Icons.add_box_outlined,
// //   onPressed: () {},
// // )

// // Outline Button (White with border):
// // CustomButton(
// //   text: 'الاقسام الفرعية',
// //   icon: Icons.grid_view,
// //   variant: ButtonVariant.outline,
// //   onPressed: () {},
// // )

// // Dark Button (Black):
// // CustomButton(
// //   text: 'تصدير قائمة المنتجات',
// //   icon: Icons.download,
// //   variant: ButtonVariant.dark,
// //   onPressed: () {},
// // )
