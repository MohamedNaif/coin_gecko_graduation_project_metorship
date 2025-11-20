import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';

class CustomRangeSlider extends StatefulWidget {
  final double minPrice;
  final double maxPrice;
  final double? initialStartValue;
  final double? initialEndValue;
  final ValueChanged<RangeValues> onChange;

  const CustomRangeSlider({
    super.key,
    this.minPrice = 5000,
    this.maxPrice = 100000,
    this.initialStartValue,
    this.initialEndValue,
    required this.onChange,
  });

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late RangeValues values;

  @override
  void initState() {
    super.initState();
    final startValue = widget.initialStartValue ?? widget.minPrice * 2.5;
    final endValue = widget.initialEndValue ?? widget.maxPrice / 1.5;
    values = RangeValues(startValue, endValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 4),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 10,
                  rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 20,
                  ),
                  activeTickMarkColor: AppColors.primary1,
                  inactiveTickMarkColor: AppColors.neutral500,
                  tickMarkShape: const RoundSliderTickMarkShape(
                    tickMarkRadius: 4,
                  ),
                  rangeThumbShape: const RoundRangeSliderThumbShape(
                    elevation: 1,
                    enabledThumbRadius: 12,
                    disabledThumbRadius: 15,
                    pressedElevation: 15,
                  ),
                  activeTrackColor: AppColors.primary1,
                  inactiveTrackColor: AppColors.neutral200,
                  thumbColor: AppColors.white,
                  minThumbSeparation: 0,
                  overlayColor: AppColors.primary1.withValues(alpha: 0.1),
                  valueIndicatorColor: AppColors.primary1,
                ),
                child: RangeSlider(
                  values: values,
                  min: widget.minPrice,
                  max: widget.maxPrice,
                  divisions: ((widget.maxPrice - widget.minPrice) ~/ 500),
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      values = newValues;
                    });
                    widget.onChange(newValues);
                  },
                  labels: RangeLabels(
                    formatCurrencyWithOutSymbol(values.start.floor()),
                    formatCurrencyWithOutSymbol(values.end.floor()),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: _PriceBox(
                    text: formatCurrencyWithOutSymbol(values.start.floor()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 4,
                  decoration: BoxDecoration(color: AppColors.neutral100),
                  width: 12,
                ),
                Expanded(
                  child: _PriceBox(
                    text: formatCurrencyWithOutSymbol(values.end.floor()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String formatCurrencyWithOutSymbol(num value) {
  final formatter = NumberFormat('#,###', 'en_US');
  return formatter.format(value);
}

class _PriceBox extends StatelessWidget {
  final String text;

  const _PriceBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          '$text ${'iqd'.tr()}',
          style: AppTextStyles.bold16.copyWith(color: AppColors.neutral650),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
