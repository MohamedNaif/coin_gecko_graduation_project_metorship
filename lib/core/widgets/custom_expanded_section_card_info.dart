// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

// class CustomExpandedSectionCardInfo extends StatelessWidget {
//   final String title;
//   final List<String> values;
//   final String? infoTitle;
//   final TextStyle? titleStyle;
//   final TextStyle? valueStyle;
//   final Color? valueColor;
//   final Widget? widget;
//   final Widget? icon;

//   const CustomExpandedSectionCardInfo({
//     super.key,
//     required this.title,
//     required this.values,
//     this.infoTitle,
//     this.titleStyle,
//     this.valueColor,
//     this.valueStyle,
//     this.icon,
//     this.widget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final widgets = values.map((val) {
//       return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         margin: const EdgeInsets.only(right: 4),
//         decoration: BoxDecoration(
//           color: valueColor ?? AppColors.zinc100,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             icon ?? const SizedBox.shrink(),
//             const SizedBox(width: 8),
//             Text(
//               val,
//               style:
//                   valueStyle ??
//                   AppTextStyles.regular16.copyWith(color: AppColors.zinc600),
//             ),
//           ],
//         ),
//       );
//     }).toList();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (infoTitle != null)
//           Text(
//             infoTitle!,
//             style: AppTextStyles.semiBold16.copyWith(color: AppColors.zinc700),
//           ),
//         Container(
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: const Color.fromRGBO(252, 252, 252, 1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           width: double.infinity, // Full width inside parent
//           child:
//               widget ??
//               (values.length <= 2
//                   // Use Wrap instead of Row to handle overflow gracefully
//                   ? Wrap(
//                       crossAxisAlignment: WrapCrossAlignment.center,
//                       alignment: WrapAlignment.spaceBetween,
//                       spacing: 8,
//                       runSpacing: 8,
//                       children: [
//                         Text(
//                           title,
//                           style:
//                               titleStyle ??
//                               AppTextStyles.medium16.copyWith(
//                                 color: AppColors.zinc600,
//                               ),
//                         ),
//                         Wrap(children: [...widgets]),
//                       ],
//                     )
//                   : Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style:
//                               titleStyle ??
//                               AppTextStyles.medium16.copyWith(
//                                 color: AppColors.zinc500,
//                               ),
//                         ),
//                         const SizedBox(height: 10),
//                         Wrap(spacing: 8, runSpacing: 8, children: widgets),
//                       ],
//                     )),
//         ),
//       ],
//     );
//   }
// }
