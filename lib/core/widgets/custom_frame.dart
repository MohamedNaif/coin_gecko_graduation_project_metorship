// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/extension/responsive_text.dart';

// class CustomFrame extends StatelessWidget {
//   const CustomFrame({
//     super.key,
//     this.backgroundColor,
//     this.backgroundIconColor,
//     this.title,
//     this.subtitle,
//     this.count,
//     this.frameIcon,
//     this.icon,
//     this.flex = 1,
//   });

//   final Color? backgroundColor;
//   final Color? backgroundIconColor;
//   final String? title;
//   final String? subtitle;
//   final String? count;
//   final String? frameIcon;
//   final String? icon;
//   final int flex;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: flex,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           // Calculate responsive sizes
//           final isSmallScreen = constraints.maxWidth < 900;
//           // final isMediumScreen = constraints.maxWidth < 900;

//           final iconSize = isSmallScreen ? 40.0 : 50.0;
//           final frameIconSize = isSmallScreen ? 80.0 : 130.0;
//           final titleFontSize = isSmallScreen
//               ? 16.0.responsive
//               : 18.0.responsive;
//           final countFontSize = isSmallScreen
//               ? 24.0.responsive
//               : 32.0.responsive;
//           final subtitleFontSize = isSmallScreen
//               ? 14.0.responsive
//               : 16.0.responsive;

//           return Container(
//             constraints: BoxConstraints(minHeight: isSmallScreen ? 100 : 150),
//             decoration: BoxDecoration(
//               color: backgroundColor ?? AppColors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.05),
//                   spreadRadius: 0,
//                   blurRadius: 10,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         width: iconSize,
//                         height: iconSize,
//                         padding: EdgeInsets.all((iconSize / 6).responsive),
//                         decoration: BoxDecoration(
//                           color: backgroundIconColor,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           icon!,
//                           colorFilter: const ColorFilter.mode(
//                             AppColors.white,
//                             BlendMode.srcIn,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: isSmallScreen ? 12 : 16),
//                       Text(
//                         title ?? 'عنوان العنصر',
//                         style: AppTextStyles.regular16.copyWith(
//                           color: AppColors.zinc500,
//                           fontSize: titleFontSize,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: isSmallScreen ? 6 : 8),
//                       Wrap(
//                         crossAxisAlignment: WrapCrossAlignment.center,
//                         spacing: 8,
//                         children: [
//                           Text(
//                             count ?? '0',
//                             style: AppTextStyles.regular16.copyWith(
//                               color: AppColors.black,
//                               fontSize: countFontSize,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                           Text(
//                             subtitle ?? 'عدد العناصر',
//                             style: AppTextStyles.regular16.copyWith(
//                               color: AppColors.zinc500,
//                               fontSize: subtitleFontSize,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: isSmallScreen ? -5 : -10,
//                   left: 1,
//                   child: SvgPicture.asset(
//                     frameIcon!,
//                     colorFilter: ColorFilter.mode(
//                       backgroundIconColor!.withAlpha(22),
//                       BlendMode.srcIn,
//                     ),
//                     width: frameIconSize,
//                     height: frameIconSize,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class CustomRedFrame extends StatelessWidget {
//   const CustomRedFrame({
//     super.key,
//     this.flex = 1,
//     this.title,
//     this.subtitle,
//     this.count,
//     this.icon,
//   });

//   final int flex;
//   final String? title;
//   final String? subtitle;
//   final String? count;

//   final String? icon;
//   @override
//   Widget build(BuildContext context) {
//     return CustomFrame(
//       flex: flex,
//       backgroundColor: AppColors.red50,
//       backgroundIconColor: AppColors.baseDanger,
//       title: title ?? 'منتجات واشكت على الانتهاء',
//       subtitle: subtitle ?? 'منتجات',
//       count: count ?? '10',
//       frameIcon: AppAssets.star,
//       icon: icon ?? AppAssets.products,
//     );
//   }
// }

// class CustomGreenFrame extends StatelessWidget {
//   const CustomGreenFrame({
//     super.key,
//     this.flex = 1,
//     this.title,
//     this.subtitle,
//     this.count,
//     this.icon,
//   });

//   final int flex;

//   final String? title;
//   final String? subtitle;
//   final String? count;
//   final String? icon;

//   @override
//   Widget build(BuildContext context) {
//     return CustomFrame(
//       flex: flex,
//       backgroundColor: AppColors.green100,
//       backgroundIconColor: AppColors.greenIcon,
//       title: title ?? 'منتجات جديدة',
//       subtitle: subtitle ?? 'منتجات',
//       count: count ?? '10',
//       frameIcon: AppAssets.star2,
//       icon: icon ?? AppAssets.products,
//     );
//   }
// }

// class CustomYellowFrame extends StatelessWidget {
//   const CustomYellowFrame({
//     super.key,
//     this.flex = 1,
//     this.title,
//     this.subtitle,
//     this.count,
//     this.icon,
//   });

//   final int flex;
//   final String? title;
//   final String? subtitle;
//   final String? count;
//   final String? icon;

//   @override
//   Widget build(BuildContext context) {
//     return CustomFrame(
//       flex: flex,
//       backgroundColor: AppColors.yellow50,
//       backgroundIconColor: AppColors.yellow500,
//       title: title ?? 'إجمالي المنتجات',
//       subtitle: subtitle ?? 'منتجات',
//       count: count ?? '10',
//       frameIcon: AppAssets.star,
//       icon: icon ?? AppAssets.orders,
//     );
//   }
// }

// class CustomPurpleFrame extends StatelessWidget {
//   const CustomPurpleFrame({
//     super.key,
//     this.flex = 1,
//     this.title,
//     this.subtitle,
//     this.count,
//     this.icon,
//   });

//   final int flex;
//   final String? title;
//   final String? subtitle;
//   final String? count;
//   final String? icon;

//   @override
//   Widget build(BuildContext context) {
//     return CustomFrame(
//       flex: flex,
//       backgroundColor: AppColors.purple50,
//       backgroundIconColor: AppColors.purple500,
//       title: title ?? 'إجمالي الطلبات',
//       subtitle: subtitle ?? 'طلبات',
//       count: count ?? '10',
//       frameIcon: AppAssets.star2,
//       icon: icon ?? AppAssets.users,
//     );
//   }
// }
