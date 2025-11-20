// import 'dart:io';
// // import 'dart:typed_data';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/control_panel/data/models/dashboard_stats_model.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/control_panel/data/models/revenue_chart_monthly_income_model.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/control_panel/data/models/revenue_chart_growth_model.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/products/data/models/products_model/datum.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/control_panel/presentation/widgets/upcoming_appointments.dart';

// class ExcelExportService {
//   static Future<String> exportDashboardData({
//     required DashboardStatsModel dashboardStats,
//     required List<RevenueChartMonthlyIncomeModel> revenueData,
//     required RevenueChartGrowthModel revenueGrowth,
//     required List<Datum> bestSellingProducts,
//     required List<AppointmentItem> upcomingAppointments,
//     required List<PendingRequestsData> pendingRequests,
//   }) async {
//     // Create a new Excel document
//     final Workbook workbook = Workbook();
//     final Worksheet worksheet = workbook.worksheets[0];
//     worksheet.name = 'Dashboard Report';

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

//     int currentRow = 1;

//     // 1. Dashboard Title
//     worksheet.getRangeByName('A$currentRow:D$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('تقرير لوحة التحكم');
//     worksheet.getRangeByName('A$currentRow').cellStyle = headerStyle;
//     currentRow += 2;

//     // 2. Status Cards Section
//     worksheet.getRangeByName('A$currentRow:D$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('إحصائيات عامة');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Status cards data
//     final statusCardsData = [
//       ['إجمالي الطلبات', dashboardStats.totalOrders.toString(), 'طلب'],
//       ['عدد المستخدمين', dashboardStats.totalUsers.toString(), 'مستخدم'],
//       [
//         'إجمالي الإيرادات',
//         '${dashboardStats.totalMoney.toStringAsFixed(2)} د.ع',
//         'دينار',
//       ],
//       [
//         'منتجات اوشكت على الانتهاء',
//         dashboardStats.productsMayFinish.toString(),
//         'منتج',
//       ],
//     ];

//     for (int i = 0; i < statusCardsData.length; i++) {
//       worksheet.getRangeByName('A$currentRow').setText(statusCardsData[i][0]);
//       worksheet.getRangeByName('B$currentRow').setText(statusCardsData[i][1]);
//       worksheet.getRangeByName('C$currentRow').setText(statusCardsData[i][2]);

//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//       currentRow += 1;
//     }

//     currentRow += 2;

//     // 3. Revenue Percentage Section
//     worksheet.getRangeByName('A$currentRow:D$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('نسبة الإيرادات');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Revenue growth data
//     worksheet.getRangeByName('A$currentRow').setText('نسبة النمو');
//     worksheet
//         .getRangeByName('B$currentRow')
//         .setText('${revenueGrowth.percentage.toStringAsFixed(1)}%');
//     worksheet.getRangeByName('C$currentRow').setText('منذ الشهر الماضي');

//     worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//     worksheet.getRangeByName('B$currentRow').cellStyle = numberStyle;
//     worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//     currentRow += 1;

//     worksheet.getRangeByName('A$currentRow').setText('المبلغ الحالي');
//     worksheet
//         .getRangeByName('B$currentRow')
//         .setText('${revenueGrowth.currentAmount.toStringAsFixed(2)} د.ع');
//     worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//     worksheet.getRangeByName('B$currentRow').cellStyle = numberStyle;
//     currentRow += 1;

//     worksheet.getRangeByName('A$currentRow').setText('المبلغ السابق');
//     worksheet
//         .getRangeByName('B$currentRow')
//         .setText('${revenueGrowth.prevAmount.toStringAsFixed(2)} د.ع');
//     worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//     worksheet.getRangeByName('B$currentRow').cellStyle = numberStyle;
//     currentRow += 2;

//     // 4. Upcoming Appointments and Notifications Section
//     worksheet.getRangeByName('A$currentRow:D$currentRow').merge();
//     worksheet
//         .getRangeByName('A$currentRow')
//         .setText('المواعيد والتنبيهات القادمة');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Appointments
//     if (upcomingAppointments.isNotEmpty) {
//       worksheet.getRangeByName('A$currentRow').setText('استشارة طبية قادمة');
//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       currentRow += 1;

//       for (final appointment in upcomingAppointments) {
//         worksheet
//             .getRangeByName('A$currentRow')
//             .setText(appointment.doctorName);
//         worksheet.getRangeByName('B$currentRow').setText(appointment.time);
//         worksheet.getRangeByName('C$currentRow').setText(appointment.type);

//         worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//         worksheet.getRangeByName('B$currentRow').cellStyle = dataStyle;
//         worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//         currentRow += 1;
//       }
//     }

//     // Pending requests
//     if (pendingRequests.isNotEmpty) {
//       currentRow += 1;
//       worksheet.getRangeByName('A$currentRow').setText('طلب سحب معلق');
//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       currentRow += 1;

//       for (final request in pendingRequests) {
//         worksheet.getRangeByName('A$currentRow').setText(request.doctorName);
//         worksheet.getRangeByName('B$currentRow').setText(request.time);
//         worksheet
//             .getRangeByName('C$currentRow')
//             .setText(request.price ?? 'N/A');
//         worksheet.getRangeByName('D$currentRow').setText(request.code ?? 'N/A');

//         worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//         worksheet.getRangeByName('B$currentRow').cellStyle = dataStyle;
//         worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//         worksheet.getRangeByName('D$currentRow').cellStyle = dataStyle;
//         currentRow += 1;
//       }
//     }

//     currentRow += 2;

//     // 5. Best Selling Products Section
//     worksheet.getRangeByName('A$currentRow:F$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('أفضل المنتجات مبيعاً');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Products header
//     final productHeaders = [
//       'اسم المنتج',
//       'الفئة',
//       'السعر',
//       'الكمية',
//       'المباع',
//       'الحالة',
//     ];
//     for (int i = 0; i < productHeaders.length; i++) {
//       worksheet
//           .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//           .setText(productHeaders[i]);
//       worksheet
//               .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//               .cellStyle =
//           dataStyle;
//     }
//     currentRow += 1;

//     // Products data
//     for (final product in bestSellingProducts) {
//       worksheet.getRangeByName('A$currentRow').setText(product.title ?? 'N/A');
//       worksheet
//           .getRangeByName('B$currentRow')
//           .setText(product.category?.name ?? 'N/A');
//       worksheet
//           .getRangeByName('C$currentRow')
//           .setText(product.price?.toString() ?? 'N/A');
//       worksheet
//           .getRangeByName('D$currentRow')
//           .setText(product.quantity?.toString() ?? 'N/A');
//       worksheet
//           .getRangeByName('E$currentRow')
//           .setText(product.sold?.toString() ?? 'N/A');
//       worksheet
//           .getRangeByName('F$currentRow')
//           .setText(
//             (product.quantity != null && product.quantity! > 0)
//                 ? 'معروض'
//                 : 'غير معروض',
//           );

//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('D$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('E$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('F$currentRow').cellStyle = dataStyle;
//       currentRow += 1;
//     }

//     currentRow += 2;

//     // 6. Revenue Chart Data Section
//     worksheet.getRangeByName('A$currentRow:D$currentRow').merge();
//     worksheet
//         .getRangeByName('A$currentRow')
//         .setText('بيانات الإيرادات الشهرية');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Revenue chart headers
//     final revenueHeaders = ['الشهر', 'السنة', 'إجمالي المبلغ'];
//     for (int i = 0; i < revenueHeaders.length; i++) {
//       worksheet
//           .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//           .setText(revenueHeaders[i]);
//       worksheet
//               .getRangeByName('${String.fromCharCode(65 + i)}$currentRow')
//               .cellStyle =
//           dataStyle;
//     }
//     currentRow += 1;

//     // Revenue chart data
//     for (final revenue in revenueData) {
//       final monthNames = [
//         'يناير',
//         'فبراير',
//         'مارس',
//         'أبريل',
//         'مايو',
//         'يونيو',
//         'يوليو',
//         'أغسطس',
//         'سبتمبر',
//         'أكتوبر',
//         'نوفمبر',
//         'ديسمبر',
//       ];

//       worksheet
//           .getRangeByName('A$currentRow')
//           .setText(monthNames[revenue.month - 1]);
//       worksheet.getRangeByName('B$currentRow').setText(revenue.year.toString());
//       worksheet
//           .getRangeByName('C$currentRow')
//           .setText('${revenue.totalAmount.toStringAsFixed(2)} د.ع');

//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = numberStyle;
//       currentRow += 1;
//     }

//     // Auto-fit columns
//     for (int i = 0; i < 6; i++) {
//       worksheet.autoFitColumn(i + 1);
//     }

//     // Save the workbook
//     final List<int> bytes = workbook.saveAsStream();
//     workbook.dispose();

//     // Get the documents directory
//     final Directory appDocDir = await getApplicationDocumentsDirectory();
//     final String fileName =
//         'dashboard_report_${DateTime.now().millisecondsSinceEpoch}.xlsx';
//     final String filePath = '${appDocDir.path}/$fileName';

//     // Write the file
//     final File file = File(filePath);
//     await file.writeAsBytes(bytes);

//     return filePath;
//   }
// }
