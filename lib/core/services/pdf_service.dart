// import 'dart:io';
// import 'dart:typed_data';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:coin_gecko_graduation_project_metorship/features/orders/data/models/orders_model/datum.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/orders/data/models/orders_model/cart_item.dart';

// class PdfService {
//   static Future<Uint8List> generateOrderPdf(OrderDetail order) async {
//     final pdf = pw.Document();

//     // Load local Cairo fonts
//     final arabicFontData = await rootBundle.load(
//       'assets/fonts/Cairo-Regular.ttf',
//     );
//     final arabicBoldFontData = await rootBundle.load(
//       'assets/fonts/Cairo-Bold.ttf',
//     );

//     final arabicFont = pw.Font.ttf(arabicFontData);
//     final arabicBoldFont = pw.Font.ttf(arabicBoldFontData);

//     pdf.addPage(
//       pw.MultiPage(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(20),
//         build: (context) => [
//           _buildHeader(order, arabicFont, arabicBoldFont),
//           pw.SizedBox(height: 20),
//           _buildOrderInfo(order, arabicFont, arabicBoldFont),
//           pw.SizedBox(height: 20),
//           _buildCustomerInfo(order, arabicFont, arabicBoldFont),
//           pw.SizedBox(height: 20),
//           _buildDeliveryInfo(order, arabicFont, arabicBoldFont),
//           pw.SizedBox(height: 20),
//           _buildProductsInfo(order, arabicFont, arabicBoldFont),
//           pw.SizedBox(height: 20),
//           _buildPaymentInfo(order, arabicFont, arabicBoldFont),
//           pw.SizedBox(height: 20),
//           _buildFooter(arabicFont, arabicBoldFont),
//         ],
//       ),
//     );

//     return pdf.save(); // Removed invalid embedFonts parameter
//   }

//   static pw.Widget _buildHeader(
//     OrderDetail order,
//     pw.Font arabicFont,
//     pw.Font arabicBoldFont,
//   ) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.all(20),
//         decoration: const pw.BoxDecoration(
//           color: PdfColors.grey100,
//           borderRadius: pw.BorderRadius.all(pw.Radius.circular(10)),
//         ),
//         child: pw.Column(
//           children: [
//             // Company header
//             pw.Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: [
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       'شركة زبير',
//                       style: pw.TextStyle(
//                         font: arabicBoldFont,
//                         fontSize: 28,
//                         color: PdfColors.black,
//                       ),
//                       textAlign: pw.TextAlign.right,
//                     ),
//                     pw.SizedBox(height: 5),
//                     pw.Text(
//                       'نظام إدارة الطلبات',
//                       style: pw.TextStyle(
//                         font: arabicFont,
//                         fontSize: 16,
//                         color: PdfColors.grey700,
//                       ),
//                       textAlign: pw.TextAlign.right,
//                     ),
//                   ],
//                 ),
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.end,
//                   children: [
//                     pw.Text(
//                       'فاتورة الطلب',
//                       style: pw.TextStyle(
//                         font: arabicBoldFont,
//                         fontSize: 24,
//                         color: PdfColors.black,
//                       ),
//                       textAlign: pw.TextAlign.right,
//                     ),
//                     pw.SizedBox(height: 5),
//                     pw.Text(
//                       'رقم الطلب: ${order.code ?? ''}',
//                       style: pw.TextStyle(
//                         font: arabicFont,
//                         fontSize: 16,
//                         color: PdfColors.grey700,
//                       ),
//                       textAlign: pw.TextAlign.right,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 20),
//             // Order details row
//             pw.Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: [
//                 pw.Text(
//                   'التاريخ: ${order.createdAt?.toString().split(' ').first ?? ''}',
//                   style: pw.TextStyle(
//                     font: arabicFont,
//                     fontSize: 14,
//                     color: PdfColors.grey700,
//                   ),
//                   textAlign: pw.TextAlign.right,
//                 ),
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 5,
//                   ),
//                   decoration: pw.BoxDecoration(
//                     color: _getStatusColor(order.status),
//                     borderRadius: const pw.BorderRadius.all(
//                       pw.Radius.circular(5),
//                     ),
//                   ),
//                   child: pw.Text(
//                     _getStatusText(order.status),
//                     style: pw.TextStyle(
//                       font: arabicBoldFont,
//                       fontSize: 12,
//                       color: PdfColors.white,
//                     ),
//                     textAlign: pw.TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static pw.Widget _buildOrderInfo(
//     OrderDetail order,
//     pw.Font arabicFont,
//     pw.Font arabicBoldFont,
//   ) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.all(15),
//         decoration: pw.BoxDecoration(
//           border: pw.Border.all(color: PdfColors.grey300),
//           borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
//         ),
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               'معلومات الطلب الأساسي',
//               style: pw.TextStyle(
//                 font: arabicBoldFont,
//                 fontSize: 18,
//                 color: PdfColors.black,
//               ),
//               textAlign: pw.TextAlign.right,
//             ),
//             pw.SizedBox(height: 15),
//             _buildInfoRow('رقم الطلب:', order.code ?? '', arabicFont),
//             _buildInfoRow(
//               'تاريخ الطلب:',
//               order.createdAt?.toString().split(' ').first ?? '',
//               arabicFont,
//             ),
//             _buildInfoRow(
//               'حالة الطلب:',
//               _getStatusText(order.status),
//               arabicFont,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static pw.Widget _buildCustomerInfo(
//     OrderDetail order,
//     pw.Font arabicFont,
//     pw.Font arabicBoldFont,
//   ) {
//     final user = order.user;
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.all(15),
//         decoration: pw.BoxDecoration(
//           border: pw.Border.all(color: PdfColors.grey300),
//           borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
//         ),
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               'بيانات العميل',
//               style: pw.TextStyle(
//                 font: arabicBoldFont,
//                 fontSize: 18,
//                 color: PdfColors.black,
//               ),
//               textAlign: pw.TextAlign.right,
//             ),
//             pw.SizedBox(height: 15),
//             _buildInfoRow('اسم العميل:', user?.name ?? '', arabicFont),
//             _buildInfoRow('رقم الهاتف:', user?.phone ?? '', arabicFont),
//             if (order.address != null)
//               _buildInfoRow(
//                 'العنوان:',
//                 order.address?.description ?? '',
//                 arabicFont,
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   static pw.Widget _buildDeliveryInfo(
//     OrderDetail order,
//     pw.Font arabicFont,
//     pw.Font arabicBoldFont,
//   ) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.all(15),
//         decoration: pw.BoxDecoration(
//           border: pw.Border.all(color: PdfColors.grey300),
//           borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
//         ),
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               'تفاصيل الشحن والتوصيل',
//               style: pw.TextStyle(
//                 font: arabicBoldFont,
//                 fontSize: 18,
//                 color: PdfColors.black,
//               ),
//               textAlign: pw.TextAlign.right,
//             ),
//             pw.SizedBox(height: 15),
//             _buildInfoRow(
//               'نوع التوصيل:',
//               (order.address?.region != null &&
//                       order.address?.region?.isNotEmpty == true)
//                   ? 'توصيل داخلي'
//                   : 'توصيل خارجي',
//               arabicFont,
//             ),
//             if (order.shippingPrice != null)
//               _buildInfoRow(
//                 'رسوم الشحن:',
//                 '${order.shippingPrice} د.ع',
//                 arabicFont,
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   static pw.Widget _buildProductsInfo(
//     OrderDetail order,
//     pw.Font arabicFont,
//     pw.Font arabicBoldFont,
//   ) {
//     final items = order.cartItems ?? [];
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.all(15),
//         decoration: pw.BoxDecoration(
//           border: pw.Border.all(color: PdfColors.grey300),
//           borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
//         ),
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               'تفاصيل المنتجات',
//               style: pw.TextStyle(
//                 font: arabicBoldFont,
//                 fontSize: 18,
//                 color: PdfColors.black,
//               ),
//               textAlign: pw.TextAlign.right,
//             ),
//             pw.SizedBox(height: 15),
//             // Header row
//             pw.Container(
//               padding: const pw.EdgeInsets.symmetric(vertical: 10),
//               decoration: const pw.BoxDecoration(
//                 color: PdfColors.grey100,
//                 border: pw.Border(
//                   bottom: pw.BorderSide(color: PdfColors.grey300),
//                 ),
//               ),
//               child: pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Expanded(
//                     flex: 3,
//                     child: pw.Text(
//                       'المنتج',
//                       style: pw.TextStyle(
//                         font: arabicBoldFont,
//                         fontSize: 14,
//                         color: PdfColors.black,
//                       ),
//                       textAlign: pw.TextAlign.center,
//                     ),
//                   ),
//                   pw.Expanded(
//                     flex: 1,
//                     child: pw.Text(
//                       'الكمية',
//                       style: pw.TextStyle(
//                         font: arabicBoldFont,
//                         fontSize: 14,
//                         color: PdfColors.black,
//                       ),
//                       textAlign: pw.TextAlign.center,
//                     ),
//                   ),
//                   pw.Expanded(
//                     flex: 1,
//                     child: pw.Text(
//                       'السعر',
//                       style: pw.TextStyle(
//                         font: arabicBoldFont,
//                         fontSize: 14,
//                         color: PdfColors.black,
//                       ),
//                       textAlign: pw.TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Products list
//             ...items.map((item) => _buildProductRow(item, arabicFont)),
//           ],
//         ),
//       ),
//     );
//   }

//   static pw.Widget _buildProductRow(CartItem item, pw.Font arabicFont) {
//     final product = item.product;
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.symmetric(vertical: 10),
//         decoration: const pw.BoxDecoration(
//           border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey200)),
//         ),
//         child: pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Expanded(
//               flex: 3,
//               child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text(
//                     product?.brand?.name ?? '',
//                     style: pw.TextStyle(
//                       font: arabicFont,
//                       fontSize: 12,
//                       color: PdfColors.grey600,
//                     ),
//                     textAlign: pw.TextAlign.right,
//                   ),
//                   pw.SizedBox(height: 2),
//                   pw.Text(
//                     product?.name ?? '',
//                     style: pw.TextStyle(
//                       font: arabicFont,
//                       fontSize: 14,
//                       color: PdfColors.black,
//                     ),
//                     textAlign: pw.TextAlign.right,
//                   ),
//                 ],
//               ),
//             ),
//             pw.Expanded(
//               flex: 1,
//               child: pw.Text(
//                 '${item.quantity ?? 0}',
//                 style: pw.TextStyle(
//                   font: arabicFont,
//                   fontSize: 14,
//                   color: PdfColors.black,
//                 ),
//                 textAlign: pw.TextAlign.center,
//               ),
//             ),
//             pw.Expanded(
//               flex: 1,
//               child: pw.Text(
//                 '${item.price?.toStringAsFixed(0) ?? ''} د.ع',
//                 style: pw.TextStyle(
//                   font: arabicFont,
//                   fontSize: 14,
//                   color: PdfColors.black,
//                 ),
//                 textAlign: pw.TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static pw.Widget _buildPaymentInfo(
//     OrderDetail order,
//     pw.Font arabicFont,
//     pw.Font arabicBoldFont,
//   ) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.all(15),
//         decoration: pw.BoxDecoration(
//           border: pw.Border.all(color: PdfColors.grey300),
//           borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
//         ),
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               'تفاصيل الدفع',
//               style: pw.TextStyle(
//                 font: arabicBoldFont,
//                 fontSize: 18,
//                 color: PdfColors.black,
//               ),
//               textAlign: pw.TextAlign.right,
//             ),
//             pw.SizedBox(height: 15),
//             _buildInfoRow(
//               'إجمالي المبلغ:',
//               '${order.totalOrderPrice?.toStringAsFixed(0) ?? ''} د.ع',
//               arabicFont,
//             ),
//             if (order.paymentMethodType != null)
//               _buildInfoRow(
//                 'طريقة الدفع:',
//                 order.paymentMethodType ?? '',
//                 arabicFont,
//               ),
//             if (order.isPaid != null)
//               _buildInfoRow(
//                 'حالة الدفع:',
//                 order.isPaid! ? 'مدفوع' : 'غير مدفوع',
//                 arabicFont,
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   static pw.Widget _buildInfoRow(
//     String label,
//     String value,
//     pw.Font arabicFont,
//   ) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Padding(
//         padding: const pw.EdgeInsets.symmetric(vertical: 5),
//         child: pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Text(
//               label,
//               style: pw.TextStyle(
//                 font: arabicFont,
//                 fontSize: 14,
//                 color: PdfColors.grey700,
//               ),
//               textAlign: pw.TextAlign.right,
//             ),
//             pw.SizedBox(width: 10),
//             pw.Expanded(
//               child: pw.Text(
//                 value,
//                 style: pw.TextStyle(
//                   font: arabicFont,
//                   fontSize: 14,
//                   color: PdfColors.black,
//                 ),
//                 textAlign: pw.TextAlign.right,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static String _getStatusText(String? status) {
//     switch (status) {
//       case 'waiting':
//         return 'قيد الانتظار';
//       case 'inProgress':
//         return 'قيد المعالجة';
//       case 'complete':
//         return 'مكتمل';
//       case 'cancel':
//         return 'ملغي';
//       default:
//         return status ?? '';
//     }
//   }

//   static PdfColor _getStatusColor(String? status) {
//     switch (status) {
//       case 'waiting':
//         return PdfColors.orange;
//       case 'inProgress':
//         return PdfColors.blue;
//       case 'complete':
//         return PdfColors.green;
//       case 'cancel':
//         return PdfColors.red;
//       default:
//         return PdfColors.grey;
//     }
//   }

//   static pw.Widget _buildFooter(pw.Font arabicFont, pw.Font arabicBoldFont) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Container(
//         padding: const pw.EdgeInsets.all(15),
//         decoration: pw.BoxDecoration(
//           color: PdfColors.grey50,
//           border: pw.Border.all(color: PdfColors.grey300),
//           borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
//         ),
//         child: pw.Column(
//           children: [
//             pw.Text(
//               'شكراً لثقتكم بنا',
//               style: pw.TextStyle(
//                 font: arabicBoldFont,
//                 fontSize: 16,
//                 color: PdfColors.black,
//               ),
//               textAlign: pw.TextAlign.center,
//             ),
//             pw.SizedBox(height: 10),
//             pw.Text(
//               'للاستفسارات والمساعدة: info@zubair.com',
//               style: pw.TextStyle(
//                 font: arabicFont,
//                 fontSize: 12,
//                 color: PdfColors.grey600,
//               ),
//               textAlign: pw.TextAlign.center,
//             ),
//             pw.SizedBox(height: 5),
//             pw.Text(
//               'تم إنشاء هذا المستند بواسطة نظام إدارة الطلبات - شركة زبير',
//               style: pw.TextStyle(
//                 font: arabicFont,
//                 fontSize: 10,
//                 color: PdfColors.grey500,
//               ),
//               textAlign: pw.TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static Future<String> saveOrderPdf(OrderDetail order) async {
//     final pdfBytes = await generateOrderPdf(order);
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File(
//       '${directory.path}/order_${order.code ?? ''}.pdf',
//     ); // Changed to Latin-based naming
//     await file.writeAsBytes(pdfBytes);
//     return file.path;
//   }
// }
