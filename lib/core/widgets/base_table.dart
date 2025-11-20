// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/extension/responsive_text.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_table.dart';

// abstract class BaseTableItem {
//   bool get isSelected;
//   BaseTableItem copyWith({bool? isSelected});
// }

// class BaseTable<T extends BaseTableItem> extends StatefulWidget {
//   const BaseTable({
//     super.key,
//     required this.data,
//     required this.columns,
//     required this.buildRow,
//     this.onSelectAll,
//     this.onItemSelected,
//     this.isLoading = false,
//     this.hasMoreData = false,
//     this.animationDuration = const Duration(milliseconds: 800),
//     this.noDataAsset = '',
//     this.scrollController,
//     this.minWidth = 800,
//     this.horizontalPadding = 16,
//     required this.cardItem,
//   });

//   final List<T> data;
//   final List<DataColumn> columns;
//   final List<DataCell> Function(T item, int index) buildRow;
//   final Function(bool?)? onSelectAll;
//   final Function(T item, bool? value)? onItemSelected;
//   final bool isLoading;
//   final bool hasMoreData;
//   final Duration animationDuration;
//   final String noDataAsset;
//   final ScrollController? scrollController;
//   final double minWidth;
//   final double horizontalPadding;
//   final CardBuilder<T> cardItem;
//   // final Widget Function(T data, int index) cardItem;

//   @override
//   State<BaseTable<T>> createState() => _BaseTableState<T>();
// }

// class _BaseTableState<T extends BaseTableItem> extends State<BaseTable<T>> {
//   late final ScrollController _defaultScrollController;
//   // late final ScrollController _horizontalScrollController;

//   @override
//   void initState() {
//     super.initState();
//     _defaultScrollController = ScrollController();
//     // _horizontalScrollController = ScrollController();
//   }

//   @override
//   void dispose() {
//     if (widget.scrollController == null) {
//       _defaultScrollController.dispose();
//     }
//     // _horizontalScrollController.dispose();
//     super.dispose();
//   }

//   bool get _isAllSelected => widget.data.every((item) => item.isSelected);
//   bool get _isSomeSelected => widget.data.any((item) => item.isSelected);

//   List<DataColumn> _buildColumns() {
//     if (widget.onSelectAll != null) {
//       return [
//         DataColumn(
//           headingRowAlignment: MainAxisAlignment.center,
//           label: Checkbox(
//             value: _isAllSelected,
//             tristate: true,
//             onChanged: widget.onSelectAll,
//             fillColor: WidgetStateProperty.resolveWith<Color>((
//               Set<WidgetState> states,
//             ) {
//               if (states.contains(WidgetState.selected)) {
//                 return AppColors.main;
//               }
//               return Colors.transparent;
//             }),
//             checkColor: Colors.white,
//             side: BorderSide(
//               color: _isSomeSelected ? AppColors.main : Colors.grey,
//               width: 2,
//             ),
//           ),
//         ),
//         ...widget.columns,
//       ];
//     }
//     return widget.columns;
//   }

//   List<DataCell> _buildCells(T item, int index) {
//     if (widget.onItemSelected != null) {
//       return [
//         DataCell(
//           Center(
//             child: Checkbox(
//               value: item.isSelected,
//               onChanged: (value) => widget.onItemSelected?.call(item, value),
//               fillColor: WidgetStateProperty.resolveWith<Color>((
//                 Set<WidgetState> states,
//               ) {
//                 if (states.contains(WidgetState.selected)) {
//                   return AppColors.main;
//                 }
//                 return Colors.transparent;
//               }),
//               checkColor: Colors.white,
//               side: BorderSide(
//                 color: item.isSelected ? AppColors.main : Colors.grey,
//                 width: 2,
//               ),
//             ),
//           ),
//         ),
//         ...widget.buildRow(item, index),
//       ];
//     }
//     return widget.buildRow(item, index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isSmallScreen = constraints.maxWidth < widget.minWidth;

//         if (isSmallScreen) {
//           return ConstrainedBox(
//             constraints: BoxConstraints(minWidth: widget.minWidth),
//             child: _buildTable(),
//           );
//         }

//         return _buildTable();
//       },
//     );
//   }

//   Widget _buildTable() {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Container(
//           constraints: BoxConstraints(
//             minHeight: 0,
//             maxHeight: MediaQuery.of(context).size.height - 200,
//           ),
//           padding: EdgeInsets.symmetric(
//             horizontal: widget.horizontalPadding.responsive,
//           ),
//           child: ResponsiveTable<T>(
//             data: widget.data,
//             isLoading: widget.isLoading,
//             hasMoreData: widget.hasMoreData,
//             scrollController:
//                 widget.scrollController ?? _defaultScrollController,
//             buildColumns: (_) => _buildColumns(),
//             buildDataRow: (item, index) {
//               return DataRow(
//                 color: WidgetStateProperty.resolveWith<Color>((
//                   Set<WidgetState> states,
//                 ) {
//                   return item.isSelected
//                       ? AppColors.main.withValues(alpha: 0.1)
//                       : Colors.transparent;
//                 }),
//                 cells: _buildCells(item, index),
//               );
//             },
//             buildCard: widget.cardItem,
//             noDataSvgAsset: widget.noDataAsset,
//           ),
//         );
//       },
//     );
//   }
// }
