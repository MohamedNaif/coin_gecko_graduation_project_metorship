// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// // import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_table.dart';

// class CustomTableShimmer extends StatelessWidget {
//   const CustomTableShimmer({super.key, this.itemCount = 6});

//   final int itemCount;

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveTable<ShimmerUserData>(
//       data: List.generate(itemCount, (index) => ShimmerUserData()),
//       isLoading: false,
//       hasMoreData: false,
//       scrollController: ScrollController(),
//       buildColumns: (index) => [
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: _buildShimmerBox(20, 20),
//         ),
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: _buildShimmerText(80, 16),
//         ),
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: _buildShimmerText(100, 16),
//         ),
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: _buildShimmerText(90, 16),
//         ),
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: _buildShimmerText(120, 16),
//         ),
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: _buildShimmerText(60, 16),
//         ),
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: _buildShimmerText(70, 16),
//         ),
//       ],
//       buildDataRow: (data, index) {
//         return DataRow(
//           cells: [
//             // Checkbox cell
//             DataCell(Center(child: _buildShimmerBox(20, 20))),
//             // User number cell
//             DataCell(Center(child: _buildShimmerText(30, 16))),
//             // User name with avatar cell
//             DataCell(
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildShimmerCircle(32),
//                     const SizedBox(width: 8),
//                     _buildShimmerText(120, 16),
//                   ],
//                 ),
//               ),
//             ),
//             // Account type cell
//             DataCell(Center(child: _buildShimmerText(80, 16))),
//             // Registration date cell
//             DataCell(Center(child: _buildShimmerText(100, 16))),
//             // Status cell
//             DataCell(Center(child: _buildShimmerPill(60, 24))),
//             // Action cell
//             DataCell(Center(child: _buildShimmerBox(24, 24))),
//           ],
//         );
//       },
//       buildCard: (data, index) => _buildShimmerCard(),
//       noDataSvgAsset: '', // Empty since we're showing shimmer
//     );
//   }

//   Widget _buildShimmerText(double width, double height) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.foreground200,
//       highlightColor: AppColors.foreground100,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: AppColors.foreground200,
//           borderRadius: BorderRadius.circular(4),
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerBox(double width, double height) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.foreground200,
//       highlightColor: AppColors.foreground100,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: AppColors.foreground200,
//           borderRadius: BorderRadius.circular(4),
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerCircle(double size) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.foreground200,
//       highlightColor: AppColors.foreground100,
//       child: Container(
//         width: size,
//         height: size,
//         decoration: const BoxDecoration(
//           color: AppColors.foreground200,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerPill(double width, double height) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.foreground200,
//       highlightColor: AppColors.foreground100,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: AppColors.foreground200,
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerCard() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.08),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//             spreadRadius: 0,
//           ),
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.04),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   _buildShimmerBox(50, 50),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildShimmerText(150, 16),
//                         const SizedBox(height: 4),
//                         _buildShimmerText(200, 14),
//                       ],
//                     ),
//                   ),
//                   _buildShimmerBox(24, 24),
//                 ],
//               ),
//               const Divider(height: 24),
//               _buildShimmerInfoRow(),
//               _buildShimmerInfoRow(),
//               _buildShimmerInfoRow(),
//               const SizedBox(height: 8),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerInfoRow() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [_buildShimmerText(80, 14), _buildShimmerText(100, 14)],
//       ),
//     );
//   }
// }

// // Dummy class for shimmer data
// class ShimmerUserData {
//   // Empty class just for type safety
// }

// // Alternative shimmer widget with more customization
// class CustomUsersTableShimmer extends StatelessWidget {
//   const CustomUsersTableShimmer({
//     super.key,
//     this.itemCount = 8,
//     this.baseColor,
//     this.highlightColor,
//     this.shimmerDuration = const Duration(milliseconds: 1500),
//   });

//   final int itemCount;
//   final Color? baseColor;
//   final Color? highlightColor;
//   final Duration shimmerDuration;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: itemCount,
//       itemBuilder: (context, index) {
//         if (index == 0) {
//           // Header row
//           return _buildShimmerHeader();
//         }
//         return _buildShimmerRow();
//       },
//     );
//   }

//   Widget _buildShimmerHeader() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: AppColors.foreground50,
//         border: Border(
//           bottom: BorderSide(color: AppColors.foreground200, width: 1),
//         ),
//       ),
//       child: Row(
//         children: [
//           _buildShimmerElement(20, 20),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerElement(80, 16)),
//           const SizedBox(width: 16),
//           Expanded(flex: 2, child: _buildShimmerElement(100, 16)),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerElement(90, 16)),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerElement(120, 16)),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerElement(60, 16)),
//           const SizedBox(width: 16),
//           _buildShimmerElement(70, 16),
//         ],
//       ),
//     );
//   }

//   Widget _buildShimmerRow() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         border: Border(
//           bottom: BorderSide(color: AppColors.foreground100, width: 1),
//         ),
//       ),
//       child: Row(
//         children: [
//           _buildShimmerElement(20, 20),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerElement(30, 16)),
//           const SizedBox(width: 16),
//           Expanded(
//             flex: 2,
//             child: Row(
//               children: [
//                 _buildShimmerCircle(32),
//                 const SizedBox(width: 8),
//                 Expanded(child: _buildShimmerElement(double.infinity, 16)),
//               ],
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerElement(80, 16)),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerElement(100, 16)),
//           const SizedBox(width: 16),
//           Expanded(flex: 1, child: _buildShimmerPill(60, 24)),
//           const SizedBox(width: 16),
//           _buildShimmerElement(24, 24),
//         ],
//       ),
//     );
//   }

//   Widget _buildShimmerElement(double width, double height) {
//     return Shimmer.fromColors(
//       baseColor: baseColor ?? AppColors.foreground200,
//       highlightColor: highlightColor ?? AppColors.foreground100,
//       period: shimmerDuration,
//       child: Container(
//         width: width == double.infinity ? null : width,
//         height: height,
//         decoration: BoxDecoration(
//           color: baseColor ?? AppColors.foreground200,
//           borderRadius: BorderRadius.circular(4),
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerCircle(double size) {
//     return Shimmer.fromColors(
//       baseColor: baseColor ?? AppColors.foreground200,
//       highlightColor: highlightColor ?? AppColors.foreground100,
//       period: shimmerDuration,
//       child: Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(
//           color: baseColor ?? AppColors.foreground200,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerPill(double width, double height) {
//     return Shimmer.fromColors(
//       baseColor: baseColor ?? AppColors.foreground200,
//       highlightColor: highlightColor ?? AppColors.foreground100,
//       period: shimmerDuration,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: baseColor ?? AppColors.foreground200,
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }
