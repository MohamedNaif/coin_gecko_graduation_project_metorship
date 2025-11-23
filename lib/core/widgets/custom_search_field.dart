// // lib/shared/widgets/custom_search_input.dart

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';

// class CustomSearchInput extends StatefulWidget {
//   final TextEditingController? controller;
//   final Function(String)? onSubmitted;
//   final Function(String)? onChange;
//   final VoidCallback? onTap;
//   final String? hintText;
//   final Widget? suffixIconButton;
//   final bool? readOnly;

//   const CustomSearchInput({
//     super.key,
//     this.controller,
//     this.onSubmitted,
//     this.hintText,
//     this.suffixIconButton,
//     this.onTap,
//     this.onChange,
//     this.readOnly,
//   });

//   @override
//   State<CustomSearchInput> createState() => _CustomSearchInputState();
// }

// class _CustomSearchInputState extends State<CustomSearchInput> {
//   Timer? _debounce;

//   void _onChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 400), () {
//       widget.onChange!(query);
//     });
//   }

//   @override
//   void dispose() {
//     _debounce?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
//       onTap: widget.onTap,
//       controller: widget.controller,
//       onSubmitted: widget.onSubmitted,
//       onChanged: _onChanged,
//       readOnly: widget.readOnly ?? false,
//       decoration: InputDecoration(
//         filled: true,
//         suffixIcon: widget.suffixIconButton,
//         fillColor: AppColors.white,
//         hintStyle: AppTextStyles.regular14.copyWith(
//           color: AppColors.neutral500,
//         ),
//         hintText: widget.hintText ?? 'ابحث هنا'.tr(),
//         prefixIcon: Container(
//           padding: const EdgeInsets.all(10),
//           width: 20,
//           height: 20,
//           child: SvgPicture.asset(
//             AppAssets.searchIcon,
//             width: 20,
//             height: 20,
//             colorFilter: const ColorFilter.mode(
//               AppColors.neutral650,
//               BlendMode.srcIn,
//             ),
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: AppColors.neutral200, width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: AppColors.neutral200, width: 1.5),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.red, width: 1.5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.red, width: 1.0),
//         ),
//         errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
//         errorMaxLines: 3,
//       ),
//     );
//   }
// }
