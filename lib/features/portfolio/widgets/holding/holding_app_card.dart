import 'package:flutter/material.dart';

class HoldingAppCard extends StatelessWidget {
  const HoldingAppCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
