import 'package:flutter/material.dart';

class PortfolioHolding {
  const PortfolioHolding({
    required this.name,
    required this.symbol,
    required this.allocationPercent,
    required this.amountLabel,
    required this.fiatValueLabel,
    required this.dailyChangeLabel,
    required this.dailyChangePercent,
    required this.icon,
    required this.accentColor,
  });

  final String name;
  final String symbol;
  final double allocationPercent;
  final String amountLabel;
  final String fiatValueLabel;
  final String dailyChangeLabel;
  final String dailyChangePercent;
  final IconData icon;
  final Color accentColor;
}
