// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';

// class ActionItem {
//   final String value;
//   final String text;
//   final String iconPath;
//   final bool isDanger;
//   final bool showDivider;

//   const ActionItem({
//     required this.value,
//     required this.text,
//     required this.iconPath,
//     this.isDanger = false,
//     this.showDivider = true,
//   });
// }

// class ActionPopupMenu extends StatefulWidget {
//   const ActionPopupMenu({
//     super.key,
//     required this.items,
//     this.width,
//     this.height,
//     required this.onSelected,
//     this.icon = const Icon(Icons.more_vert),
//     this.borderRadius = 16,
//     this.backgroundColor = Colors.white,
//     this.dividerColor,
//     this.color,
//     this.itemSpacing = 8.0,
//   });

//   final List<ActionItem> items;
//   final Function(String) onSelected;
//   final Widget icon;
//   final double borderRadius;
//   final Color backgroundColor;
//   final Color? dividerColor;
//   final Color? color;
//   final double itemSpacing;
//   final double? width;
//   final double? height;

//   @override
//   State<ActionPopupMenu> createState() => _ActionPopupMenuState();
// }

// class _ActionPopupMenuState extends State<ActionPopupMenu> {
//   Size? _lastSize;

//   @override
//   Widget build(BuildContext context) {
//     final Size currentSize = MediaQuery.of(context).size;
//     if (_lastSize == null || _lastSize != currentSize) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         // Replace AppConstants.ifFromSuggestionDesktop with your actual constant or import if needed
//         if (context.mounted && context.canPop()) {
//           context.pop();
//         }
//       });
//       _lastSize = currentSize;
//     }

//     return Container(
//       width: widget.width,
//       height: widget.height,
//       decoration: BoxDecoration(
//         color: widget.color ?? Colors.transparent,
//         borderRadius: BorderRadius.circular(widget.borderRadius),
//       ),
//       child: PopupMenuButton<String>(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//         ),
//         color: widget.backgroundColor,
//         icon: widget.icon,
//         itemBuilder: (context) => widget.items.map((item) {
//           return PopupMenuItem<String>(
//             value: item.value,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       item.iconPath,
//                       colorFilter: ColorFilter.mode(
//                         item.isDanger ? Colors.red : AppColors.zinc600,
//                         BlendMode.srcIn,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       item.text,
//                       style: TextStyle(
//                         color: item.isDanger ? Colors.red : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 if (item.showDivider) ...[
//                   SizedBox(height: widget.itemSpacing),
//                   Divider(
//                     color: widget.dividerColor ?? AppColors.foreground300,
//                     height: 1,
//                   ),
//                 ],
//               ],
//             ),
//           );
//         }).toList(),
//         onSelected: widget.onSelected,
//       ),
//     );
//   }
// }
