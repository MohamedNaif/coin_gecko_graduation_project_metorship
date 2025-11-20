// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';

// class CustomSwitch extends StatelessWidget {
//   const CustomSwitch({
//     super.key,
//     required this.value,
//     required this.onChanged,
//     this.width = 44.0,
//     this.height = 24.0,
//     this.thumbSize = 20.0,
//     this.activeColor = Colors.white,
//     this.inactiveColor = Colors.white,
//     this.activeTrackColor,
//     this.inactiveTrackColor,
//   });

//   final bool value;
//   final ValueChanged<bool> onChanged;
//   final double width;
//   final double height;
//   final double thumbSize;
//   final Color activeColor;
//   final Color inactiveColor;
//   final Color? activeTrackColor;
//   final Color? inactiveTrackColor;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onChanged(!value),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(height / 2),
//           color: value
//               ? (activeTrackColor ?? AppColors.main)
//               : (inactiveTrackColor ?? AppColors.foreground200),
//         ),
//         child: Stack(
//           children: [
//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeInOut,
//               left: value ? width - thumbSize - 2 : 2,
//               top: (height - thumbSize) / 2,
//               child: Container(
//                 width: thumbSize,
//                 height: thumbSize,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: value ? activeColor : inactiveColor,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: 0.1),
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
