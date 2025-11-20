// import 'package:client_flow/core/function/formatted_date.dart';
// import 'package:client_flow/features/home/data/models/admin_user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';

// class ExcelGenerator {
//   static Future<void> generateBulkImportTemplate({
//     required List<AdminUserModel> data,
//     String fileName = 'boxy-bulk-import.xlsx',
//   }) async {
//     if (data.isEmpty) {
//       return;
//     }

//     // Create a new Excel document
//     final Workbook workbook = Workbook();
//     final Worksheet sheet = workbook.worksheets[0];

//     // Define headers
//     final headers = [
//       'اسم العميل',
//       'تاريخ انتهاء الاشتراك',
//       'الحالة',
//       'الايميل',
//       'رقم الهاتف',
//     ];

//     // Add headers to the first row
//     for (var i = 0; i < headers.length; i++) {
//       final cell = sheet.getRangeByIndex(1, i + 1);
//       cell.setText(headers[i]);
//       cell.cellStyle.bold = true;
//       cell.cellStyle.hAlign = HAlignType.center;
//       cell.cellStyle.vAlign = VAlignType.center;
//       sheet.getRangeByIndex(1, i + 1).columnWidth = 35;
//     }

//     // Add data rows
//     for (var rowIndex = 0; rowIndex < data.length; rowIndex++) {
//       final form = data[rowIndex];
//       final rowData = [
//         form.displayName ?? 'غير متوفر',
//         formattedDate(dateTimeFromMillis(form.expiredAt)) ,
//         getStatusName(form.status ?? 8) ,
//         form.email?.isEmpty ?? true ? 'غير متوفر' : form.email,
//         form.phone?.isEmpty ?? true ? 'غير متوفر' : form.phone,
//       ];

//       for (var colIndex = 0; colIndex < rowData.length; colIndex++) {
//         final cell = sheet.getRangeByIndex(rowIndex + 2, colIndex + 1);
//         cell.setText(rowData[colIndex].toString());
//         cell.cellStyle.hAlign = HAlignType.center;
//         cell.cellStyle.vAlign = VAlignType.center;
//       }
//     }

//     // Save the workbook as bytes
//     final List<int> bytes = workbook.saveAsStream();
//     workbook.dispose();

//     // Ask user to pick a location to save the file
//     String? outputFile = await FilePicker.platform.saveFile(
//       dialogTitle: 'Save Excel File',
//       fileName: fileName,
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (outputFile != null) {
//       if (!outputFile.endsWith('.xlsx')) {
//         outputFile += '.xlsx'; // Ensure extension is added
//       }
//       final file = File(outputFile);
//       await file.writeAsBytes(bytes, flush: true);
//     }
//   }
// }

//  String getStatusName(int status) {
//     switch (status) {
//       case 0:
//         return 'جديد';
//       case 1:
//         return 'نشط';
//       case 2:
//         return 'محتمل';
//       case 3:
//         return 'مرفوض';
//       default:
//         return '';
//     }
//   }

// // Debouncer class to prevent rapid clicks
// class Debouncer {
//   final int milliseconds;
//   VoidCallback? action;
//   bool _isWaiting = false;

//   Debouncer({required this.milliseconds});

//   void run(VoidCallback action) {
//     if (_isWaiting) return;
//     _isWaiting = true;
//     action();
//     Future.delayed(Duration(milliseconds: milliseconds), () {
//       _isWaiting = false;
//     });
//   }
// }

// // Global instance
// final debouncer = Debouncer(milliseconds: 2000);
