import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class SendReceipt extends StatefulWidget {
  const SendReceipt({super.key});
  @override
  State<SendReceipt> createState() => _SendReceiptState();
}

class _SendReceiptState extends State<SendReceipt> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.sendReceipt,
          style: AppTextStyles.medium12.copyWith(
            color: context.theme.primaryColor,
          ),
        ),
        const Spacer(),
        Switch(value: value, onChanged: _onChanged)
      ],
    );
  }

  void _onChanged(value) {
    setState(() {
      this.value = value;
    });
  }
}
