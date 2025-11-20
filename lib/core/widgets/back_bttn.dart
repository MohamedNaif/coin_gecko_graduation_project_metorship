// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';

// /// Back button container
// class BackButtonContainer extends StatelessWidget {
//   const BackButtonContainer({super.key, required this.goLcation, this.extra});

//   final String goLcation;
//   final Object? extra;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 48,
//       decoration: BoxDecoration(
//         color: AppColors.foreground100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: IconButton(
//         style: IconButton.styleFrom(
//           backgroundColor: AppColors.foreground100,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         onPressed: () => context.go(goLcation, extra: extra),
//         icon: const Icon(
//           Icons.arrow_back_ios_new,
//           color: AppColors.foreground700,
//         ),
//       ),
//     );
//   }
// }
