// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/extension/responsive_text.dart';

// import 'package:coin_gecko_graduation_project_metorship/core/function/formatted_date.dart';

// Future<String?> customDatePicker(
//   BuildContext context, {
//   DateTime? initialDate,
// }) {
//   return showDatePicker(
//     context: context,
//     barrierDismissible: false,
//     switchToCalendarEntryModeIcon: const Icon(
//       Icons.calendar_month_outlined,
//       color: AppColors.grayscaleBackground,
//     ),
//     switchToInputEntryModeIcon: const Icon(
//       Icons.edit_calendar_rounded,
//       color: AppColors.grayscaleBackground,
//     ),
//     initialDate: initialDate ?? DateTime.now(),
//     firstDate: DateTime.now(),
//     lastDate: DateTime.now().add(const Duration(days: 365)),
//     builder: (context, child) {
//       return Theme(
//         data: Theme.of(context).copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: AppColors.grayscaleBackground,
//             onPrimary: Colors.white,
//             onSurface: AppColors.grayscaleBackground,
//           ),
//           textButtonTheme: TextButtonThemeData(
//             style: TextButton.styleFrom(
//               backgroundColor: AppColors.grayscaleBackground,
//               foregroundColor: AppColors.grayscaleBackground,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(6),
//               ),
//             ),
//           ),
//           datePickerTheme: DatePickerThemeData(
//             headerHelpStyle: AppTextStyles.medium16.copyWith(
//               fontSize: 20.responsive,
//             ),
//             headerHeadlineStyle: AppTextStyles.medium16.copyWith(
//               fontSize: 20.responsive,
//             ),
//             rangePickerHeaderHeadlineStyle: AppTextStyles.medium16,
//             rangePickerHeaderHelpStyle: AppTextStyles.medium16,
//             dayStyle: AppTextStyles.medium16,
//             yearStyle: AppTextStyles.medium16,
//             weekdayStyle: AppTextStyles.medium16,
//             dayShape: WidgetStateProperty.all<OutlinedBorder?>(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//             ),
//             dividerColor: AppColors.grayscaleBackground,
//             todayBackgroundColor: WidgetStateProperty.all(
//               AppColors.grayscaleBackground.withValues(alpha: .2),
//             ),
//             todayForegroundColor: WidgetStateProperty.all(
//               AppColors.grayscaleBorder,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12), // Change the shape here
//             ),
//             dayOverlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
//               if (states.contains(WidgetState.selected)) {
//                 return AppColors.grayscaleBackground.withValues(alpha: .8);
//               }
//               return null;
//             }),
//             dayForegroundColor: WidgetStateProperty.resolveWith<Color?>((
//               states,
//             ) {
//               if (states.contains(WidgetState.selected)) {
//                 return Colors.white;
//               }
//               return null;
//             }),
//           ),
//         ),
//         child: child!,
//       );
//     },
//   ).then((selectedDate) {
//     if (selectedDate != null) {
//       return formattedDate(selectedDate);
//     }
//     return null;
//   });
// }
