// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/extension/responsive_text.dart';

// typedef DataRowBuilder<T> = DataRow Function(T data, int index);
// typedef CardBuilder<T> = Widget Function(T data, int index);
// typedef TableColumnBuilder = List<DataColumn> Function(int index);

// class ResponsiveTable<T> extends StatelessWidget {
//   final List<T> data;
//   final bool isLoading;
//   final bool hasMoreData;
//   final ScrollController scrollController;
//   final TableColumnBuilder buildColumns;
//   final DataRowBuilder<T> buildDataRow;
//   final CardBuilder<T> buildCard;
//   final String noDataSvgAsset;

//   const ResponsiveTable({
//     super.key,
//     required this.data,
//     required this.isLoading,
//     required this.hasMoreData,
//     required this.scrollController,
//     required this.buildColumns,
//     required this.buildDataRow,
//     required this.buildCard,
//     required this.noDataSvgAsset,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final bool isMobileScreen = size.width < 700;
//     final bool isSmallScreen = size.width < 920 && size.width >= 700;
//     final bool isMediumScreen = size.width >= 920 && size.width < 1200;

//     if (data.isEmpty && isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (data.isEmpty) {
//       return Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 noDataSvgAsset,
//                 width: isMobileScreen
//                     ? 100
//                     : isSmallScreen
//                     ? 150
//                     : 250,
//                 height: isMobileScreen
//                     ? 100
//                     : isSmallScreen
//                     ? 150
//                     : 250,
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'لا توجد بيانات للعرض',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'حاول تغيير معايير البحث أو التصفية',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     if (isSmallScreen) {
//       return SizedBox(
//         height: MediaQuery.of(context).size.height - 200,
//         width: MediaQuery.of(context).size.width,
//         child: MasonryGridView.count(
//           controller: scrollController,
//           crossAxisCount: 2,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           itemCount: data.length + (hasMoreData ? 1 : 0),
//           itemBuilder: (context, index) {
//             if (index == data.length && hasMoreData) {
//               return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child:
//                       CircularProgressIndicator(), // Replace with your custom loader
//                 ),
//               );
//             }
//             return buildCard(data[index], index);
//           },
//         ),
//       );
//     }

//     if (isMobileScreen) {
//       return SizedBox(
//         // height: MediaQuery.of(context).size.height - 200,
//         width: MediaQuery.of(context).size.width,
//         child: ListView.builder(
//           controller: scrollController,
//           itemCount: data.length + (hasMoreData ? 1 : 0),
//           itemBuilder: (context, index) {
//             if (index == data.length && hasMoreData) {
//               return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             }
//             return buildCard(data[index], index);
//           },
//         ),
//       );
//     }

//     return Container(
//       width: double.infinity,
//       constraints: const BoxConstraints(
//         minHeight: 0,
//         // maxHeight: MediaQuery.of(context).size.height - 200,
//       ),
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobileScreen
//             ? 0
//             : isMediumScreen
//             ? 0
//             : 6.responsive,
//         vertical: isMobileScreen ? 8 : 16,
//       ),
//       child: SingleChildScrollView(
//         controller: scrollController,
//         scrollDirection: Axis.vertical,
//         child: Theme(
//           data: _buildTableTheme(context, isSmallScreen),
//           child: DataTable(
//             columnSpacing: isMobileScreen
//                 ? 2
//                 : isMediumScreen
//                 ? 4
//                 : 10,
//             horizontalMargin: isMobileScreen
//                 ? 0
//                 : isMediumScreen
//                 ? 0
//                 : 10,
//             showCheckboxColumn: !isMobileScreen,
//             border: TableBorder.all(
//               borderRadius: BorderRadius.circular(12),
//               color: const Color(0xffE4E4E7),
//               width: 1.5,
//             ),
//             columns: buildColumns(0),
//             rows: data.map<DataRow>((item) {
//               final index = data.indexOf(item);
//               return buildDataRow(item, index);
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }

//   ThemeData _buildTableTheme(BuildContext context, bool isSmallScreen) {
//     return Theme.of(context).copyWith(
//       checkboxTheme: CheckboxThemeData(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//         side: const BorderSide(color: Color(0xFFD4D4D8), width: 2.5),
//       ),
//       dividerColor: const Color(0xffE4E4E7),
//       dataTableTheme: DataTableThemeData(
//         dataRowColor: WidgetStateProperty.all(
//           const Color.fromARGB(255, 255, 255, 255),
//         ),
//         headingRowColor: WidgetStateProperty.all(
//           const Color.fromARGB(172, 245, 245, 245),
//         ),
//         dataRowMaxHeight: isSmallScreen ? 50 : 65,
//         dataRowMinHeight: isSmallScreen ? 30 : 40,
//         headingTextStyle: TextStyle(
//           fontSize: isSmallScreen ? 12 : 14,
//           fontWeight: FontWeight.bold,
//         ),
//         dataTextStyle: TextStyle(fontSize: isSmallScreen ? 11 : 13),
//       ),
//     );
//   }
// }
