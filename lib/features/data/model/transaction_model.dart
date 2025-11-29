class PortfolioTransaction {
  const PortfolioTransaction({
    required this.title,
    required this.since,
    required this.valueLabel,
    required this.amountLabel,
  });

  final String title;
  final String since;
  final String valueLabel;
  final String amountLabel;
}
