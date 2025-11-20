// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:go_router/go_router.dart';

// class CustomDialog extends StatelessWidget {
//   final String title;
//   final String? subtitle;
//   final String? confirmButtonText;
//   final String? cancelButtonText;
//   final VoidCallback? onConfirm;
//   final VoidCallback? onCancel;
//   final Color? confirmButtonColor;
//   final Color? confirmButtonTextColor;
//   final Widget? content;
//   final String? iconAsset;
//   final Color? iconBackgroundColor;
//   final bool isLoading;
//   final double? width;
//   final EdgeInsets contentPadding;
//   final bool showCloseButton;

//   const CustomDialog({
//     super.key,
//     required this.title,
//     this.subtitle,
//     this.confirmButtonText,
//     this.cancelButtonText = 'الغاء',
//     this.onConfirm,
//     this.onCancel,
//     this.confirmButtonColor = AppColors.main,
//     this.confirmButtonTextColor = Colors.white,
//     this.content,
//     this.iconAsset,
//     this.iconBackgroundColor,
//     this.isLoading = false,
//     this.width,
//     this.contentPadding = const EdgeInsets.all(24),
//     this.showCloseButton = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Container(
//           width: width ?? MediaQuery.of(context).size.width * 0.3,
//           padding: contentPadding,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 45,
//                   height: 8,
//                   decoration: BoxDecoration(
//                     color: AppColors.foreground200,
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       title,
//                       style: AppTextStyles.semiBold20.copyWith(
//                         color: AppColors.zinc700,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () => context.pop(),
//                       icon: const Icon(Icons.close, size: 24),
//                       padding: EdgeInsets.zero,
//                       constraints: const BoxConstraints(),
//                     ),
//                   ],
//                 ),

//                 // Icon
//                 const SizedBox(height: 20),

//                 // Title

//                 // Subtitle
//                 if (subtitle != null) ...[
//                   const SizedBox(height: 12),
//                   Text(
//                     subtitle!,
//                     style: AppTextStyles.regular14.copyWith(
//                       fontSize: 16,
//                       color: AppColors.foreground600,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],

//                 // Custom content
//                 if (content != null) ...[const SizedBox(height: 24), content!],

//                 const SizedBox(height: 24),

//                 // Buttons
//                 CustomRowBttn(
//                   cancelButtonText: cancelButtonText,
//                   onCancel: onCancel,
//                   confirmButtonText: confirmButtonText,
//                   isLoading: isLoading,
//                   onConfirm: onConfirm,
//                   confirmButtonTextColor: confirmButtonTextColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomRowBttn extends StatelessWidget {
//   const CustomRowBttn({
//     super.key,
//     required this.cancelButtonText,
//     required this.onCancel,
//     required this.confirmButtonText,
//     required this.isLoading,
//     required this.onConfirm,
//     required this.confirmButtonTextColor,
//     this.confirmBackgroundColor,
//   });

//   final String? cancelButtonText;
//   final VoidCallback? onCancel;
//   final String? confirmButtonText;
//   final bool isLoading;
//   final VoidCallback? onConfirm;
//   final Color? confirmButtonTextColor;
//   final Color? confirmBackgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // Cancel button
//         if (cancelButtonText != null)
//           Expanded(
//             flex: 1,
//             child: TextButton(
//               onPressed: onCancel ?? () => context.pop(),
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 minimumSize: const Size(double.infinity, 52),
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: AppColors.foreground200,
//                     width: 1.5,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: Text(
//                 cancelButtonText!,
//                 style: AppTextStyles.medium16.copyWith(
//                   color: AppColors.foreground600,
//                 ),
//               ),
//             ),
//           ),

//         // Confirm button
//         if (confirmButtonText != null) ...[
//           if (cancelButtonText != null) const SizedBox(width: 12),
//           Expanded(
//             flex: 3,
//             child: ElevatedButton(
//               onPressed: isLoading ? null : onConfirm,
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 52),
//                 backgroundColor: confirmBackgroundColor ?? AppColors.main,
//                 foregroundColor: confirmButtonTextColor,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(0),
//                     bottomRight: Radius.circular(12),
//                     topLeft: Radius.circular(12),
//                     topRight: Radius.circular(12),
//                   ),
//                 ),
//                 elevation: 0,
//               ),
//               child: isLoading
//                   ? const SizedBox(
//                       width: 24,
//                       height: 24,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                       ),
//                     )
//                   : Text(
//                       confirmButtonText!,
//                       style: AppTextStyles.medium16.copyWith(
//                         color: Colors.white,
//                       ),
//                     ),
//             ),
//           ),
//         ],
//       ],
//     );
//   }
// }
