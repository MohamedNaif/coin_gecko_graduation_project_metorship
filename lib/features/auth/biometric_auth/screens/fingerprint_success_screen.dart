// // FingerprintSuccessScreen
// import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class FingerprintSuccessScreen extends StatelessWidget {
//   const FingerprintSuccessScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return CustomBackground(
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppDimensions.biometricPaddingHorizontal,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: context.heightScale(AppDimensions.spacingGigantic),
//               ),
//               SvgPicture.asset(
//                 AppAssets.successIcon,
//                 width: AppDimensions.biometricIconSize,
//                 height: AppDimensions.biometricIconSize,
//               ),
//               SizedBox(
//                 height: context.heightScale(AppDimensions.spacingLarge),
//               ),
//               Text(
//                 AppStrings.youreVerified,
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                       color: AppColors.biometricTextPrimary,
//                       fontWeight: FontWeight.w700,
//                     ),
//               ),
//               SizedBox(
//                 height: context.heightScale(AppDimensions.spacingMedium),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: AppDimensions.paddingLarge,
//                 ),
//                 child: Text(
//                   AppStrings.verifiedSuccessMessage,
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: AppColors.biometricTextSecondary,
//                         height: 1.5,
//                       ),
//                 ),
//               ),
//               SizedBox(
//                 height: context.heightScale(AppDimensions.spacingEnormous),
//               ),
//               CustomButton(
//                 borderRadius: AppDimensions.borderRadiusLarge,
//                 widthPadding: AppDimensions.paddingButton,
//                 height: AppDimensions.buttonHeightLarge,
//                 text: AppStrings.continueText,
//                 onTap: () {
//                   context.read<BiometricCubit>().enableBiometric();
//                   Navigator.pushReplacementNamed(
//                     context,
//                     Routes.faceIdCameraScreen,
//                   );
//                 },
//                 color: AppColors.primaryLight,
//                 textStyle: context.textTheme.titleMedium?.copyWith(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(
//                 height: context.heightScale(AppDimensions.spacingXSmall),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
