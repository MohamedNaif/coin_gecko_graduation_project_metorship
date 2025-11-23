// // import 'package:driver_app/core/core/theming/app_colors.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

// class CustomTextFormField extends StatefulWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.obscureText,
//     this.labelText,
//     this.hintText,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.maxLines,
//     this.onSaved,
//     this.onChanged, // Added onChanged
//     this.validator,
//     this.controller,
//     this.hintStyle,
//     this.decoration,
//     this.style,
//     this.width,
//     this.onTap,
//     this.readonly,
//     this.keyboardType,
//     this.enabled,
//     this.textInputAction, // Added textInputAction
//     this.focusNode,
//     this.fillColor, // Added controller
//     this.onFieldSubmitted,
//     this.headerText,
//     this.maxLength,
//     this.inputFormatters,
//   });

//   final bool obscureText;
//   final String? labelText;
//   final String? hintText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextStyle? style;
//   final int? maxLines;
//   final Function(String?)? onSaved;
//   final String? Function(String?)? validator;
//   final TextEditingController? controller; // Added controller
//   final void Function(String)? onChanged;
//   final TextStyle? hintStyle;
//   final InputDecoration? decoration;
//   final double? width;
//   final void Function()? onTap;
//   final bool? readonly;
//   final TextInputType? keyboardType;
//   final bool? enabled;
//   final FocusNode? focusNode;
//   final TextInputAction? textInputAction; // Added textInputAction
//   final Color? fillColor;
//   final void Function(String)? onFieldSubmitted;
//   final String? headerText;
//   final int? maxLength;
//   final List<TextInputFormatter>? inputFormatters;

//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   // Added onChanged
//   final TextAlign textAlign = TextAlign.left;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // height: 70,
//       // width: widget.width ?? MediaQuery.sizeOf(context).width * 0.9,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           if (widget.headerText != null) ...[
//             Text(
//               widget.headerText ?? '',
//               style: AppTextStyles.regular14.copyWith(
//                 color: AppColors.textMain,
//               ),
//             ),
//             SizedBox(height: 10),
//           ],
//           TextFormField(
//             onTapOutside: (_) => FocusScope.of(context).unfocus(),
//             inputFormatters: widget.inputFormatters,
//             obscuringCharacter: '*',
//             textInputAction: widget.textInputAction,
//             cursorColor: Color(0xFF4DB6AC),
//             textDirection: TextDirection.ltr,
//             style: widget.style ?? AppTextStyles.medium16,
//             autovalidateMode: AutovalidateMode.onUserInteraction,

//             focusNode: widget.focusNode,
//             enabled: widget.enabled ?? true,
//             keyboardType: widget.keyboardType ?? TextInputType.text,
//             readOnly: widget.readonly ?? false,
//             onTap: widget.onTap ?? () {},
//             maxLength: widget.maxLength,
//             controller: widget.controller, // Using the controller here
//             onSaved: widget.onSaved != null
//                 ? (value) => widget.onSaved!(value?.trim())
//                 : null,
//             onChanged: (value) {
//               final trimmed = value.trim();

//               if (widget.onChanged != null) {
//                 widget.onChanged!(trimmed);
//               }
//             }, // Using the onChanged callback
//             onFieldSubmitted: widget.onFieldSubmitted != null
//                 ? (value) => widget.onFieldSubmitted!(value.trim())
//                 : null,
//             textAlign: textAlign,
//             maxLines: widget.maxLines ?? null,
//             validator: widget.validator != null
//                 ? (value) => widget.validator!(value?.trim())
//                 : null,
//             obscureText: widget.obscureText,
//             decoration:
//                 widget.decoration ??
//                 InputDecoration(
//                   filled: true,
//                   hoverColor: Colors.transparent,
//                   fillColor: AppColors.white,

//                   focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                     borderSide: const BorderSide(color: Colors.red, width: 1.5),
//                   ),

//                   labelText: widget.labelText,
//                   alignLabelWithHint: true,
//                   hintText: widget.hintText,
//                   hintStyle:
//                       widget.hintStyle ??
//                       AppTextStyles.regular16.copyWith(
//                         color: AppColors.textSubtle,
//                       ),
//                   prefixIcon: widget.prefixIcon,
//                   suffixIcon: widget.suffixIcon,
//                   // Add unfocused border color
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                     borderSide: const BorderSide(
//                       color: AppColors.grayscaleBorder,
//                       width: 1.0, // Border width
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                     borderSide: const BorderSide(
//                       color: Color(0xFF4DB6AC), // Color when focused
//                       width: 1.5, // Border width
//                     ),
//                   ),

//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                     borderSide: const BorderSide(
//                       color: Colors.red, // Error border color
//                       width: 1.0, // Border width
//                     ),
//                   ),
//                   errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
//                   errorMaxLines: 3,
//                 ),
//           ),
//         ],
//       ),
//     );
//   }
// }
