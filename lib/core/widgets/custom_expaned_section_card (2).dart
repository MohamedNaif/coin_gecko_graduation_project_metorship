// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// // import 'package:coin_gecko_graduation_project_metorship/core/animations/fade_transition_animation.dart';
// // import 'package:coin_gecko_graduation_project_metorship/core/animations/slide_transition_animation.dart';

// class CustomExpandedSectionCard extends StatefulWidget {
//   final String title;
//   final String? expandedTitle;
//   final Widget child;
//   final bool initiallyExpanded;
//   final double? paddingH;
//   final double? paddingV;
//   final bool isHaveMargin;
//   final double? paddingForTitle;

//   const CustomExpandedSectionCard({
//     super.key,
//     required this.title,
//     required this.child,
//     this.initiallyExpanded = true,
//     this.isShowExpandedText = true,
//     this.isHaveMargin = true,
//     this.isShowExpanded = true,
//     this.expandedTitle,
//     this.backgroundColor = AppColors.zinc100,
//     this.paddingH,
//     this.paddingV,
//     this.paddingForTitle,
//   });

//   final bool isShowExpandedText;
//   final bool isShowExpanded;
//   final Color? backgroundColor;
//   @override
//   State<CustomExpandedSectionCard> createState() =>
//       _CustomExpandedSectionCardState();
// }

// class _CustomExpandedSectionCardState extends State<CustomExpandedSectionCard>
//     with TickerProviderStateMixin {
//   late bool isExpanded;
//   late AnimationController _expansionController;
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//   late Animation<double> _expansionAnimation;

//   @override
//   void initState() {
//     super.initState();
//     isExpanded = widget.initiallyExpanded;

//     // Initialize animation controllers
//     _expansionController = AnimationController(
//       duration: const Duration(milliseconds: 400),
//       vsync: this,
//     );

//     _rotationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     // Initialize animations
//     _rotationAnimation =
//         Tween<double>(
//           begin: 0.0,
//           end: 0.5, // Half rotation (180 degrees)
//         ).animate(
//           CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
//         );

//     _expansionAnimation = CurvedAnimation(
//       parent: _expansionController,
//       curve: Curves.easeInOut,
//     );

//     // Set initial state
//     if (isExpanded) {
//       _expansionController.value = 1.0;
//       _rotationController.value = 1.0;
//     }
//   }

//   @override
//   void dispose() {
//     _expansionController.dispose();
//     _rotationController.dispose();
//     super.dispose();
//   }

//   void _toggleExpansion() {
//     setState(() {
//       isExpanded = !isExpanded;
//     });

//     if (isExpanded) {
//       _expansionController.forward();
//       _rotationController.forward();
//     } else {
//       _expansionController.reverse();
//       _rotationController.reverse();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       margin: !widget.isShowExpanded
//           ? null
//           : widget.isHaveMargin
//           ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8)
//           : null,
//       padding: EdgeInsets.symmetric(
//         horizontal: widget.paddingH ?? 16,
//         vertical: widget.paddingV ?? 10,
//       ),
//       decoration: BoxDecoration(
//         color: widget.backgroundColor,
//         borderRadius: const BorderRadius.all(Radius.circular(12)),
//         boxShadow: isExpanded
//             ? [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: .05),
//                   blurRadius: 8,
//                   offset: const Offset(0, 2),
//                 ),
//               ]
//             : null,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title + Toggle Button
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: widget.paddingForTitle ?? 0,
//             ),
//             child: Row(
//               children: [
//                 AnimatedDefaultTextStyle(
//                   duration: const Duration(milliseconds: 200),
//                   style: AppTextStyles.semiBold14.copyWith(
//                     color: isExpanded ? AppColors.zinc700 : AppColors.zinc600,
//                   ),
//                   child: Text(
//                     widget.title,
//                     style: AppTextStyles.semiBold16.copyWith(
//                       color: isExpanded ? AppColors.zinc700 : AppColors.zinc500,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 if (widget.isShowExpanded)
//                   InkWell(
//                     onTap: _toggleExpansion,
//                     borderRadius: BorderRadius.circular(8),
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: isExpanded
//                             ? AppColors.yellow500.withValues(alpha: .09)
//                             : Colors.transparent,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         children: [
//                           if (widget.isShowExpandedText)
//                             AnimatedSwitcher(
//                               duration: const Duration(milliseconds: 200),
//                               child: Text(
//                                 widget.expandedTitle ??
//                                     (isExpanded ? 'إخفاء' : 'اظهار'),
//                                 key: ValueKey(isExpanded),
//                                 style: AppTextStyles.semiBold14.copyWith(
//                                   color: const Color.fromARGB(255, 250, 154, 0),
//                                 ),
//                               ),
//                             ),
//                           const SizedBox(width: 10),
//                           AnimatedBuilder(
//                             animation: _rotationAnimation,
//                             builder: (context, child) {
//                               return Transform.rotate(
//                                 angle:
//                                     _rotationAnimation.value *
//                                     3.14159, // Convert to radians
//                                 child: const Icon(
//                                   Icons.keyboard_arrow_down_rounded,
//                                   color: AppColors.yellow500,
//                                   size: 20,
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Animated content
//           SizeTransition(
//             sizeFactor: _expansionAnimation,
//             child: FadeTransition(
//               opacity: _expansionAnimation,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   SlideTransition(
//                     position: Tween<Offset>(
//                       begin: const Offset(0, -0.1),
//                       end: Offset.zero,
//                     ).animate(_expansionAnimation),
//                     child: widget.child,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
