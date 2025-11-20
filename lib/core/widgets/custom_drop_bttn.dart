import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:go_router/go_router.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    required this.hintText,
    this.prefixIcon,
    this.readOnly = true,
    this.onTapOutsideUnFocus = true,
    required this.items,
    this.onChanged,
    this.offset,
    this.value,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.headerText,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;

  final bool? onTapOutsideUnFocus;
  final bool readOnly;
  final Offset? offset;
  final List<PopupMenuEntry> items;
  final void Function(String)? onChanged;
  final String? value;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? headerText;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  double screenWidth = 0;
  bool isPopupOpen = false;

  @override
  void didUpdateWidget(covariant CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Keep controller in sync with value
    if (widget.value != null && widget.value != widget.controller.text) {
      widget.controller.text = widget.value!;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Set controller text to value if not already set
    if (widget.value != null && widget.value != widget.controller.text) {
      widget.controller.text = widget.value!;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double currentScreenWidth = MediaQuery.sizeOf(context).width;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (screenWidth != currentScreenWidth) {
            screenWidth = currentScreenWidth;
            if (isPopupOpen) {
              context.pop();
              isPopupOpen = false;
            }
          }
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.headerText != null) ...[
              Text(
                widget.headerText ?? '',
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.textMain,
                ),
              ),
              SizedBox(height: 8),
            ],
            TextFormField(
              onChanged: widget.onChanged,
              readOnly: widget.readOnly,
              onTapOutside: (value) {
                if (widget.onTapOutsideUnFocus!) {
                  FocusScope.of(context).unfocus();
                }
              },
              onTap: () async {
                isPopupOpen = true;
                final RenderBox renderBox =
                    context.findRenderObject() as RenderBox;
                final Offset position = renderBox.localToGlobal(
                  const Offset(0, 5),
                );
                final selected = await showMenu(
                  color: AppColors.white,
                  useRootNavigator: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppColors.textSubtle),
                  ),
                  position: RelativeRect.fromLTRB(
                    position.dx,
                    position.dy + renderBox.size.height,
                    position.dx + renderBox.size.width,
                    position.dy + renderBox.size.height + 100,
                  ),
                  items: widget.items,
                );
                isPopupOpen = false;
                if (selected != null) {
                  widget.controller.text = selected;
                  if (widget.onChanged != null) widget.onChanged!(selected);
                  setState(() {}); // To update the field
                }
              },
              style: AppTextStyles.medium16.copyWith(
                color: AppColors.textSubtle,
              ),
              maxLines: 1,
              controller: widget.controller,
              validator: widget.validator,
              focusNode: widget.focusNode,
              textInputAction: widget.textInputAction,
              onFieldSubmitted: widget.onFieldSubmitted,
              decoration: InputDecoration(
                enabled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                hintText: widget.hintText,
                suffixIcon:
                    widget.suffixIcon ??
                    const InkWell(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: AppColors.textMain,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                prefixIcon: widget.prefixIcon,
                filled: true,
                isDense: true,
                hintStyle: AppTextStyles.regular16.copyWith(
                  color: widget.controller.text.trim().isEmpty
                      ? AppColors.textSubtle
                      : AppColors.textMain,
                ),
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.grayscaleBorder,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primary1),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
