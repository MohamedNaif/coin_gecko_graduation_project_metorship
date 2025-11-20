// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/profits/data/models/transction_model/transction_model.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/profits/data/models/transction_model/datum.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/function/formatted_date.dart';

// class ProfitsExcelExportService {
//   static Future<String> exportProfitsData({
//     required TransctionModel profitsData,
//   }) async {
//     // Create a new Excel document
//     final Workbook workbook = Workbook();
//     final Worksheet worksheet = workbook.worksheets[0];
//     worksheet.name = 'Profits Report';

//     // Set RTL direction for Arabic text
//     worksheet.enableSheetCalculations();

//     // Create styles
//     final Style headerStyle = workbook.styles.add('HeaderStyle');
//     headerStyle.backColor = '#2E7D32';
//     headerStyle.fontColor = '#FFFFFF';
//     headerStyle.fontName = 'Arial';
//     headerStyle.fontSize = 14;
//     headerStyle.bold = true;
//     headerStyle.hAlign = HAlignType.center;
//     headerStyle.vAlign = VAlignType.center;

//     final Style subHeaderStyle = workbook.styles.add('SubHeaderStyle');
//     subHeaderStyle.backColor = '#4CAF50';
//     subHeaderStyle.fontColor = '#FFFFFF';
//     subHeaderStyle.fontName = 'Arial';
//     subHeaderStyle.fontSize = 12;
//     subHeaderStyle.bold = true;
//     subHeaderStyle.hAlign = HAlignType.center;

//     final Style dataStyle = workbook.styles.add('DataStyle');
//     dataStyle.fontName = 'Arial';
//     dataStyle.fontSize = 11;
//     dataStyle.hAlign = HAlignType.center;

//     final Style numberStyle = workbook.styles.add('NumberStyle');
//     numberStyle.fontName = 'Arial';
//     numberStyle.fontSize = 11;
//     numberStyle.hAlign = HAlignType.right;
//     numberStyle.numberFormat = '#,##0.00';

//     final Style dateStyle = workbook.styles.add('DateStyle');
//     dateStyle.fontName = 'Arial';
//     dateStyle.fontSize = 11;
//     dateStyle.hAlign = HAlignType.center;
//     dateStyle.numberFormat = 'dd/mm/yyyy';

//     final Style statusStyle = workbook.styles.add('StatusStyle');
//     statusStyle.fontName = 'Arial';
//     statusStyle.fontSize = 11;
//     statusStyle.hAlign = HAlignType.center;
//     statusStyle.bold = true;

//     int currentRow = 1;

//     // 1. Report Title
//     worksheet.getRangeByName('A$currentRow:H$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('تقرير الأرباح والمكاسب');
//     worksheet.getRangeByName('A$currentRow').cellStyle = headerStyle;
//     currentRow += 2;

//     // 2. Summary Information
//     worksheet.getRangeByName('A$currentRow:H$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('ملخص التقرير');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Summary data
//     final summaryData = [
//       [
//         'إجمالي عدد المعاملات',
//         profitsData.results?.toString() ?? '0',
//         'معاملة',
//       ],
//       [
//         'عدد الصفحات',
//         profitsData.paginationResult?.numberOfPages?.toString() ?? '0',
//         'صفحة',
//       ],
//       ['تاريخ التصدير', DateTime.now().toString().split(' ')[0], ''],
//     ];

//     for (int i = 0; i < summaryData.length; i++) {
//       worksheet.getRangeByName('A$currentRow').setText(summaryData[i][0]);
//       worksheet.getRangeByName('B$currentRow').setText(summaryData[i][1]);
//       worksheet.getRangeByName('C$currentRow').setText(summaryData[i][2]);

//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//       currentRow += 1;
//     }

//     currentRow += 2;

//     // 3. Profits Table Header
//     worksheet.getRangeByName('A$currentRow:H$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('قائمة الأرباح والمكاسب');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Profits table headers
//     final profitHeaders = [
//       'رمز المعاملة',
//       'اسم المستخدم',
//       'نوع المستخدم',
//       'نوع العملية',
//       'المبلغ',
//       'الحالة',
//       'تاريخ الطلب',
//       'تاريخ الإنشاء',
//     ];

//     for (int i = 0; i < profitHeaders.length; i++) {
//       worksheet
//           .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//           .setText(profitHeaders[i]);
//       worksheet
//               .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//               .cellStyle =
//           dataStyle;
//     }
//     currentRow += 1;

//     // Profits data
//     final profits = profitsData.data ?? [];
//     for (final profit in profits) {
//       // Transaction code
//       worksheet.getRangeByName('A$currentRow').setText(profit.code ?? 'N/A');

//       // User name
//       worksheet
//           .getRangeByName('B$currentRow')
//           .setText(profit.user?.name ?? 'N/A');

//       // User type
//       worksheet
//           .getRangeByName('C$currentRow')
//           .setText(profit.user?.role ?? 'N/A');

//       // Operation type
//       worksheet.getRangeByName('D$currentRow').setText('طلب سحب');

//       // Amount
//       worksheet
//           .getRangeByName('E$currentRow')
//           .setText(profit.amount?.toString() ?? 'N/A');

//       // Status
//       final status = profit.status == true ? 'تم الدفع' : 'قيد المراجعة';
//       worksheet.getRangeByName('F$currentRow').setText(status);

//       // Request date
//       worksheet
//           .getRangeByName('G$currentRow')
//           .setText(profit.date != null ? formattedDate(profit.date!) : 'N/A');

//       // Created date
//       worksheet
//           .getRangeByName('H$currentRow')
//           .setText(profit.createdAt?.toString().split(' ')[0] ?? 'N/A');

//       // Apply styles
//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('D$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('E$currentRow').cellStyle = numberStyle;

//       // Status styling
//       if (profit.status == true) {
//         worksheet.getRangeByName('F$currentRow').cellStyle = statusStyle;
//         worksheet.getRangeByName('F$currentRow').cellStyle.backColor =
//             '#4CAF50';
//         worksheet.getRangeByName('F$currentRow').cellStyle.fontColor =
//             '#FFFFFF';
//       } else {
//         worksheet.getRangeByName('F$currentRow').cellStyle = statusStyle;
//         worksheet.getRangeByName('F$currentRow').cellStyle.backColor =
//             '#FF9800';
//         worksheet.getRangeByName('F$currentRow').cellStyle.fontColor =
//             '#FFFFFF';
//       }

//       worksheet.getRangeByName('G$currentRow').cellStyle = dateStyle;
//       worksheet.getRangeByName('H$currentRow').cellStyle = dateStyle;

//       currentRow += 1;
//     }

//     currentRow += 2;

//     // 4. Statistics Section
//     worksheet.getRangeByName('A$currentRow:H$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('إحصائيات الأرباح');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Calculate statistics
//     int totalTransactions = profits.length;
//     int paidTransactions = profits.where((p) => p.status == true).length;
//     int pendingTransactions = profits.where((p) => p.status == false).length;
//     double totalAmount = profits.fold(0.0, (sum, p) => sum + (p.amount ?? 0));
//     double paidAmount = profits
//         .where((p) => p.status == true)
//         .fold(0.0, (sum, p) => sum + (p.amount ?? 0));
//     double pendingAmount = profits
//         .where((p) => p.status == false)
//         .fold(0.0, (sum, p) => sum + (p.amount ?? 0));

//     final statisticsData = [
//       ['إجمالي المعاملات', totalTransactions.toString(), 'معاملة'],
//       ['المعاملات المدفوعة', paidTransactions.toString(), 'معاملة'],
//       ['المعاملات المعلقة', pendingTransactions.toString(), 'معاملة'],
//       ['إجمالي المبالغ', '${totalAmount.toStringAsFixed(2)} د.ع', ''],
//       ['إجمالي المبالغ المدفوعة', '${paidAmount.toStringAsFixed(2)} د.ع', ''],
//       ['إجمالي المبالغ المعلقة', '${pendingAmount.toStringAsFixed(2)} د.ع', ''],
//     ];

//     for (int i = 0; i < statisticsData.length; i++) {
//       worksheet.getRangeByName('A$currentRow').setText(statisticsData[i][0]);
//       worksheet.getRangeByName('B$currentRow').setText(statisticsData[i][1]);
//       worksheet.getRangeByName('C$currentRow').setText(statisticsData[i][2]);

//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//       currentRow += 1;
//     }

//     currentRow += 2;

//     // 5. User Type Breakdown
//     worksheet.getRangeByName('A$currentRow:H$currentRow').merge();
//     worksheet
//         .getRangeByName('A$currentRow')
//         .setText('توزيع المعاملات حسب نوع المستخدم');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // User type headers
//     final userTypeHeaders = ['نوع المستخدم', 'عدد المعاملات', 'إجمالي المبالغ'];
//     for (int i = 0; i < userTypeHeaders.length; i++) {
//       worksheet
//           .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//           .setText(userTypeHeaders[i]);
//       worksheet
//               .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//               .cellStyle =
//           dataStyle;
//     }
//     currentRow += 1;

//     // Group by user type
//     final userTypeGroups = <String, List<TransactionDetail>>{};
//     for (final profit in profits) {
//       final userType = profit.user?.role ?? 'غير محدد';
//       userTypeGroups.putIfAbsent(userType, () => []).add(profit);
//     }

//     for (final entry in userTypeGroups.entries) {
//       final userType = entry.key;
//       final userProfits = entry.value;
//       final userCount = userProfits.length;
//       final userTotal = userProfits.fold(
//         0.0,
//         (sum, p) => sum + (p.amount ?? 0),
//       );

//       worksheet.getRangeByName('A$currentRow').setText(userType);
//       worksheet.getRangeByName('B$currentRow').setText(userCount.toString());
//       worksheet
//           .getRangeByName('C$currentRow')
//           .setText('${userTotal.toStringAsFixed(2)} د.ع');

//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = numberStyle;
//       currentRow += 1;
//     }

//     // Auto-fit columns
//     for (int i = 0; i < 8; i++) {
//       worksheet.autoFitColumn(i + 1);
//     }

//     // Save the workbook
//     final List<int> bytes = workbook.saveAsStream();
//     workbook.dispose();

//     // Get the documents directory
//     final Directory appDocDir = await getApplicationDocumentsDirectory();
//     final String fileName =
//         'profits_report_${DateTime.now().millisecondsSinceEpoch}.xlsx';
//     final String filePath = '${appDocDir.path}/$fileName';

//     // Write the file
//     final File file = File(filePath);
//     await file.writeAsBytes(bytes);

//     return filePath;
//   }
// }
