// import 'package:easy_localization/easy_localization.dart' hide TextDirection;
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
// import 'package:go_router/go_router.dart';

// class CustomDialog extends StatefulWidget {
//   final Function()? onSubmitTap;
//   final Function()? onBttnTwoSubmitTap;
//   final Color backgroundColor;
//   final Color buttonColor;
//   final Color buttonTwoColor;
//   final Color iconColor;
//   final Color iconBackgroundColor;
//   final String logoAsset;
//   final String titleText;
//   final String confirmationText;
//   final String buttonText;
//   final String buttonTwoText;
//   final Widget? widget;
//   final bool bttnTwo;
//   final Widget? bttnWidget;
//   final Widget? bttnTwoWidget;
//   final bool isCancel;
//   final bool isClose;
//   final bool isLoading;
//   final bool isLoadingBttnTwo;
//   const CustomDialog({
//     super.key,
//     this.onSubmitTap,
//     this.onBttnTwoSubmitTap,
//     this.bttnWidget,
//     this.bttnTwoWidget,
//     this.bttnTwo = false,
//     this.widget = const SizedBox.shrink(),
//     this.backgroundColor = Colors.white,
//     this.buttonColor = AppColors.primary1,
//     this.buttonTwoColor = AppColors.primary200,
//     this.iconBackgroundColor = AppColors.primary50,
//     this.logoAsset = AppAssets.ordersIcon,
//     this.iconColor = AppColors.primary600,
//     this.titleText = 'تسجيل الخروج',
//     this.confirmationText = 'هل أنت متأكد من تسجيل الخروج؟',
//     this.buttonText = 'تسجيل الخروج',
//     this.buttonTwoText = 'انهاء',
//     this.isCancel = false,
//     this.isLoading = false,
//     this.isLoadingBttnTwo = false,
//     this.isClose = false,
//   });

//   @override
//   State<CustomDialog> createState() => _CustomDialogState();
// }

// class _CustomDialogState extends State<CustomDialog> {
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: widget.backgroundColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   if (widget.isClose) ...[
//                     IconButton(
//                       onPressed: () => context.pop(),
//                       icon: Icon(
//                         Icons.close_rounded,
//                         color: AppColors.neutral200,
//                       ),
//                     ),
//                     Expanded(flex: 2, child: SizedBox()),
//                   ],
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: widget.iconBackgroundColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: SvgPicture.asset(
//                         widget.logoAsset,
//                         width: 24,
//                         height: 24,
//                         color: widget.iconColor,
//                       ),
//                     ),
//                   ),
//                   if (widget.isClose) ...[Expanded(flex: 3, child: SizedBox())],
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 widget.titleText,
//                 style: AppTextStyles.bold16.copyWith(color: AppColors.zinc700),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 widget.confirmationText,
//                 style: AppTextStyles.regular14.copyWith(
//                   color: AppColors.neutral500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               widget.widget ?? const SizedBox.shrink(),
//               const SizedBox(height: 24),
//               Row(
//                 children: [
//                   if (widget.bttnTwo)
//                     Expanded(
//                       child: SizedBox(
//                         child: ElevatedButton(
//                           onPressed: widget.onBttnTwoSubmitTap ?? () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: widget.buttonTwoColor,
//                             foregroundColor: Colors.white,
//                             fixedSize: const Size(double.infinity, 45),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 12,
//                               ).copyWith(bottomLeft: Radius.zero),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                           ),
//                           child: widget.isLoadingBttnTwo
//                               ? Center(
//                                   child: SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.white,
//                                       strokeWidth: 2,
//                                     ),
//                                   ),
//                                 )
//                               : widget.bttnTwoWidget ??
//                                     Text(
//                                       widget.buttonTwoText,
//                                       style: AppTextStyles.semiBold14,
//                                     ),
//                         ),
//                       ),
//                     ),
//                   if (widget.isCancel) ...[
//                     if (!isLoading)
//                       Expanded(
//                         child: SizedBox(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               context.pop();
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               foregroundColor: Colors.white,
//                               fixedSize: const Size(double.infinity, 45),
//                               shape: RoundedRectangleBorder(
//                                 side: BorderSide(
//                                   color: AppColors.neutral200,
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(
//                                   12,
//                                 ).copyWith(bottomLeft: Radius.zero),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                             ),
//                             child: Text(
//                               'cancel'.tr(),
//                               style: AppTextStyles.semiBold14.copyWith(
//                                 color: AppColors.neutral650,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: SizedBox(
//                       child: ElevatedButton(
//                         onPressed:
//                             widget.onSubmitTap ??
//                             () async {
//                               // context.read<BottomNavBarCubit>().savedUser =
//                               //     null;
//                               // isLoading = true;
//                               // setState(() {});
//                               // await FirebaseUnsubscribe.unsubscribeFromTopics(
//                               //   userId: AppSharedPreferences.getString(
//                               //     key: AppStrings.userId,
//                               //   ),
//                               // );

//                               // await AppSharedPreferences.remove(
//                               //   AppStrings.accessToken,
//                               // );
//                               // await AppSharedPreferences.remove(
//                               //   AppStrings.refreshToken,
//                               // );
//                               // await AppSharedPreferences.remove(
//                               //   AppStrings.userId,
//                               // );
//                               // await AppSharedPreferences.remove(
//                               //   AppStrings.userModel,
//                               // );
//                               // isLoading = false;
//                               // setState(() {});
//                               // if (context.mounted) {
//                               //   context.go(Routes.login);
//                               // }

//                               // log(
//                               //   '===refreshToken====: ${AppSharedPreferences.getString(key: AppStrings.refreshToken)}',
//                               // );
//                               // log(
//                               //   '==accessToken=====: ${AppSharedPreferences.getString(key: AppStrings.accessToken)}',
//                               // );
//                               // log(
//                               //   '==userId=====: ${AppSharedPreferences.getString(key: AppStrings.userId)}',
//                               // );
//                               // log(
//                               //   '==userModel=====: ${AppSharedPreferences.getString(key: AppStrings.userModel)}',
//                               // );
//                             },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: widget.buttonColor,
//                           foregroundColor: Colors.white,
//                           fixedSize: const Size(double.infinity, 45),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                               12,
//                             ).copyWith(bottomLeft: Radius.zero),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                         ),
//                         child: widget.isLoading || isLoading
//                             ? Center(
//                                 child: SizedBox(
//                                   width: 20,
//                                   height: 20,
//                                   child: CircularProgressIndicator(
//                                     color: Colors.white,
//                                     strokeWidth: 2,
//                                   ),
//                                 ),
//                               )
//                             : widget.bttnWidget ??
//                                   Text(
//                                     widget.buttonText,
//                                     style: AppTextStyles.semiBold14,
//                                   ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
