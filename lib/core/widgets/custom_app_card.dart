import 'package:flutter/material.dart';

class CustomAppCard extends StatelessWidget {
  const CustomAppCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14344BC1),
            blurRadius: 20,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}
