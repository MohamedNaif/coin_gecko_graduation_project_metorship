// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:toastification/toastification.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:intl/intl.dart' as intl;
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/extension/responsive_text.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/function/show_tost.dart';

// class CustomDateFilter extends StatelessWidget {
//   const CustomDateFilter({
//     super.key,
//     this.onTap,
//     this.startDate,
//     this.endDate,
//     this.label,
//     this.showClearButton = false,
//     this.onClear,
//   });

//   final Function()? onTap;
//   final DateTime? startDate;
//   final DateTime? endDate;
//   final String? label;
//   final bool showClearButton;
//   final VoidCallback? onClear;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: AppColors.foreground200, width: 1),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               AppAssets.date,
//               colorFilter: const ColorFilter.mode(
//                 AppColors.zinc700,
//                 BlendMode.srcIn,
//               ),
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(width: 8),
//             Flexible(
//               child: (label == null || label!.isEmpty)
//                   ? const SizedBox.shrink()
//                   : Text(
//                       _getDateRangeText(),
//                       style: AppTextStyles.medium14.copyWith(
//                         color: AppColors.zinc700,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//             ),
//             if (showClearButton)
//               Padding(
//                 padding: const EdgeInsets.only(left: 4),
//                 child: InkWell(
//                   onTap: onClear,
//                   borderRadius: BorderRadius.circular(16),
//                   child: const Icon(
//                     Icons.clear,
//                     size: 18,
//                     color: AppColors.zinc700,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _getDateRangeText() {
//     if (startDate == null && endDate == null) {
//       return label ?? 'حسب تاريخ الإضافة';
//     }

//     final start = startDate != null ? _formatDate(startDate!) : '';
//     final end = endDate != null ? _formatDate(endDate!) : '';

//     if (startDate != null && endDate != null) {
//       return '$start - $end';
//     } else if (startDate != null) {
//       return 'من $start';
//     } else if (endDate != null) {
//       return 'إلى $end';
//     }

//     return label ?? 'حسب تاريخ الإضافة';
//   }

//   String _formatDate(DateTime date) {
//     // Format date in Arabic
//     final arabicFormat = intl.DateFormat('d MMMM yyyy', 'ar');
//     return arabicFormat.format(date);
//   }
// }

// class DateFilterGroup extends StatefulWidget {
//   const DateFilterGroup({
//     super.key,
//     this.onDateSelected,
//     this.initialStartDate,
//     this.initialEndDate,
//     required this.text,
//   });

//   final String text;
//   final Function(DateTime? startDate, DateTime? endDate)? onDateSelected;
//   final DateTime? initialStartDate;
//   final DateTime? initialEndDate;

//   @override
//   State<DateFilterGroup> createState() => _DateFilterGroupState();
// }

// class _DateFilterGroupState extends State<DateFilterGroup> {
//   DateTime? _startDate;
//   DateTime? _endDate;

//   @override
//   void initState() {
//     super.initState();
//     _startDate = widget.initialStartDate;
//     _endDate = widget.initialEndDate;
//   }

//   Future<void> _selectDateRange(BuildContext context) async {
//     DateTime? tempStart = _startDate;
//     DateTime? tempEnd = _endDate;

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setDialogState) {
//             return AlertDialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               contentPadding: const EdgeInsets.all(0),
//               content: Container(
//                 width: 500.responsive,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 16,
//                   horizontal: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'اختر الفترة الزمنية',
//                       style: AppTextStyles.bold16.copyWith(
//                         color: AppColors.main,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SfDateRangePicker(
//                       backgroundColor: AppColors.white,
//                       selectionMode: DateRangePickerSelectionMode.range,
//                       initialSelectedRange:
//                           _startDate != null && _endDate != null
//                           ? PickerDateRange(_startDate, _endDate)
//                           : null,
//                       onSelectionChanged:
//                           (DateRangePickerSelectionChangedArgs args) {
//                             if (args.value is PickerDateRange) {
//                               tempStart = args.value.startDate;
//                               tempEnd = args.value.endDate;
//                             }
//                           },
//                       todayHighlightColor: AppColors.main,
//                       rangeSelectionColor: AppColors.main.withValues(alpha: .3),
//                       startRangeSelectionColor: AppColors.main,
//                       endRangeSelectionColor: AppColors.main,
//                       selectionColor: AppColors.main,
//                       headerStyle: DateRangePickerHeaderStyle(
//                         textAlign: TextAlign.center,
//                         textStyle: AppTextStyles.bold16.copyWith(
//                           color: AppColors.main,
//                         ),
//                       ),
//                       monthCellStyle: DateRangePickerMonthCellStyle(
//                         textStyle: AppTextStyles.regular14,
//                         todayTextStyle: AppTextStyles.bold14.copyWith(
//                           color: AppColors.main,
//                         ),
//                         disabledDatesTextStyle: AppTextStyles.regular14
//                             .copyWith(color: AppColors.zinc300),
//                       ),
//                       showActionButtons: false, // We'll use our own buttons
//                     ),

//                     const SizedBox(height: 16),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.white,
//                               foregroundColor: AppColors.main,
//                               elevation: 0,
//                               side: const BorderSide(color: AppColors.main),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                             ),
//                             child: Text(
//                               'إلغاء',
//                               style: AppTextStyles.bold14.copyWith(
//                                 color: AppColors.main,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if ((tempStart == null && tempEnd == null) ||
//                                   (tempStart != null && tempEnd != null)) {
//                                 Navigator.of(context).pop();
//                               } else {
//                                 showSnackBar(
//                                   message:
//                                       'الرجاء اختيار تاريخ البداية و النهاية معا',
//                                   context: context,
//                                   notificationType: ToastificationType.error,
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.main,
//                               foregroundColor: AppColors.white,
//                               elevation: 0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                             ),
//                             child: Text(
//                               'تأكيد',
//                               style: AppTextStyles.bold14.copyWith(
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );

//     if (!mounted) return;
//     // Only update if both are null (clear) or both are set (valid range)
//     if ((tempStart == null && tempEnd == null) ||
//         (tempStart != null && tempEnd != null)) {
//       setState(() {
//         _startDate = tempStart;
//         _endDate = tempEnd;
//       });
//       if (widget.onDateSelected != null) {
//         widget.onDateSelected!(_startDate, _endDate);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomDateFilter(
//       label: widget.text,
//       startDate: _startDate,
//       endDate: _endDate,
//       onTap: () => _selectDateRange(context),
//       showClearButton: _startDate != null || _endDate != null,
//       onClear: () {
//         setState(() {
//           _startDate = null;
//           _endDate = null;
//         });
//         if (widget.onDateSelected != null) {
//           widget.onDateSelected!(null, null);
//         }
//       },
//     );
//   }
// }
