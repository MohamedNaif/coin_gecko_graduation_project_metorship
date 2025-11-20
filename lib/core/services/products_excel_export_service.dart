// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// // import 'package:coin_gecko_graduation_project_metorship/features/products/data/models/products_model/datum.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/products/data/models/products_model/products_model.dart';

// class ProductsExcelExportService {
//   static Future<String> exportProductsData({
//     required ProductsModel productsData,
//   }) async {
//     // Create a new Excel document
//     final Workbook workbook = Workbook();
//     final Worksheet worksheet = workbook.worksheets[0];
//     worksheet.name = 'Products Report';

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

//     int currentRow = 1;

//     // 1. Report Title
//     worksheet.getRangeByName('A$currentRow:I$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('تقرير المنتجات');
//     worksheet.getRangeByName('A$currentRow').cellStyle = headerStyle;
//     currentRow += 2;

//     // 2. Summary Information
//     worksheet.getRangeByName('A$currentRow:I$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('ملخص التقرير');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Summary data
//     final summaryData = [
//       ['إجمالي عدد المنتجات', productsData.results?.toString() ?? '0', 'منتج'],
//       [
//         'عدد الصفحات',
//         productsData.paginationResult?.numberOfPages?.toString() ?? '0',
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

//     // 3. Products Table Header
//     worksheet.getRangeByName('A$currentRow:I$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('قائمة المنتجات');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Products table headers
//     final productHeaders = [
//       'اسم المنتج',
//       'الفئة',
//       'العلامة التجارية',
//       'السعر',
//       'السعر بعد الخصم',
//       'الكمية',
//       'المباع',
//       'الحالة',
//       'تاريخ الإنشاء',
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
//     final products = productsData.data ?? [];
//     for (final product in products) {
//       // Product name
//       worksheet.getRangeByName('A$currentRow').setText(product.title ?? 'N/A');

//       // Category
//       worksheet
//           .getRangeByName('B$currentRow')
//           .setText(product.category?.name ?? 'N/A');

//       // Brand
//       worksheet
//           .getRangeByName('C$currentRow')
//           .setText(product.brand?.name ?? 'N/A');

//       // Price
//       worksheet
//           .getRangeByName('D$currentRow')
//           .setText(product.price?.toString() ?? 'N/A');

//       // Price after discount
//       worksheet
//           .getRangeByName('E$currentRow')
//           .setText(product.priceAfterdiscound?.toString() ?? 'N/A');

//       // Quantity
//       worksheet
//           .getRangeByName('F$currentRow')
//           .setText(product.quantity?.toString() ?? 'N/A');

//       // Sold
//       worksheet
//           .getRangeByName('G$currentRow')
//           .setText(product.sold?.toString() ?? 'N/A');

//       // Status
//       worksheet
//           .getRangeByName('H$currentRow')
//           .setText(
//             (product.quantity != null && product.quantity! > 0)
//                 ? 'معروض'
//                 : 'غير معروض',
//           );

//       // Created date
//       worksheet
//           .getRangeByName('I$currentRow')
//           .setText(product.createdAt?.toString().split(' ')[0] ?? 'N/A');

//       // Apply styles
//       worksheet.getRangeByName('A$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('B$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('C$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('D$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('E$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('F$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('G$currentRow').cellStyle = numberStyle;
//       worksheet.getRangeByName('H$currentRow').cellStyle = dataStyle;
//       worksheet.getRangeByName('I$currentRow').cellStyle = dateStyle;

//       currentRow += 1;
//     }

//     currentRow += 2;

//     // 4. Statistics Section
//     worksheet.getRangeByName('A$currentRow:I$currentRow').merge();
//     worksheet.getRangeByName('A$currentRow').setText('إحصائيات المنتجات');
//     worksheet.getRangeByName('A$currentRow').cellStyle = subHeaderStyle;
//     currentRow += 1;

//     // Calculate statistics
//     int totalProducts = products.length;
//     int availableProducts = products.where((p) => (p.quantity ?? 0) > 0).length;
//     int outOfStockProducts = products
//         .where((p) => (p.quantity ?? 0) <= 0)
//         .length;
//     double totalValue = products.fold(0.0, (sum, p) => sum + (p.price ?? 0));
//     int totalSold = products.fold(0, (sum, p) => sum + (p.sold ?? 0));

//     final statisticsData = [
//       ['إجمالي المنتجات', totalProducts.toString(), 'منتج'],
//       ['المنتجات المتوفرة', availableProducts.toString(), 'منتج'],
//       ['المنتجات غير المتوفرة', outOfStockProducts.toString(), 'منتج'],
//       ['إجمالي القيمة', '${totalValue.toStringAsFixed(2)} د.ع', ''],
//       ['إجمالي المبيعات', totalSold.toString(), 'وحدة'],
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

//     // Auto-fit columns
//     for (int i = 0; i < 9; i++) {
//       worksheet.autoFitColumn(i + 1);
//     }

//     // Save the workbook
//     final List<int> bytes = workbook.saveAsStream();
//     workbook.dispose();

//     // Get the documents directory
//     final Directory appDocDir = await getApplicationDocumentsDirectory();
//     final String fileName =
//         'products_report_${DateTime.now().millisecondsSinceEpoch}.xlsx';
//     final String filePath = '${appDocDir.path}/$fileName';

//     // Write the file
//     final File file = File(filePath);
//     await file.writeAsBytes(bytes);

//     return filePath;
//   }
// }
