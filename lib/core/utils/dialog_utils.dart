// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_dialog.dart';

// Future<T?> showCustomDialog<T>({
//   required BuildContext context,
//   required String title,
//   String? subtitle,
//   String? confirmButtonText,
//   String? cancelButtonText,
//   VoidCallback? onConfirm,
//   VoidCallback? onCancel,
//   Color? confirmButtonColor,
//   Color? confirmButtonTextColor,
//   Widget? content,
//   String? iconAsset,
//   Color? iconBackgroundColor,
//   bool isLoading = false,
//   double? width,
//   EdgeInsets? contentPadding,
//   bool showCloseButton = true,
// }) {
//   return showGeneralDialog<T>(
//     context: context,
//     barrierDismissible: false,
//     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//     barrierColor: Colors.black54,
//     transitionDuration: const Duration(milliseconds: 550),
//     pageBuilder: (context, _, __) => CustomDialog(
//       title: title,
//       subtitle: subtitle,
//       confirmButtonText: confirmButtonText,
//       cancelButtonText: cancelButtonText,
//       onConfirm: onConfirm,
//       onCancel: onCancel,
//       confirmButtonColor: confirmButtonColor,
//       confirmButtonTextColor: confirmButtonTextColor,
//       content: content,
//       iconAsset: iconAsset,
//       iconBackgroundColor: iconBackgroundColor,
//       isLoading: isLoading,
//       width: width,
//       contentPadding: contentPadding ?? const EdgeInsets.all(24),
//       showCloseButton: showCloseButton,
//     ),
//     transitionBuilder: (context, animation, secondaryAnimation, child) {
//       return ScaleTransition(
//         scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
//         child: FadeTransition(opacity: animation, child: child),
//       );
//     },
//   );
// }
