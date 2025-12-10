import 'package:coin_gecko_graduation_project_metorship/features/portfolio/widgets/portfolio_body.dart';
import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  void _preventScreenshotOn() async =>
      await ScreenProtector.preventScreenshotOn();

  void _preventScreenshotOff() async =>
      await ScreenProtector.preventScreenshotOff();

  void _protectDataLeakageWithBlur() async =>
      await ScreenProtector.protectDataLeakageWithBlur();

  @override
  void initState() {
    _preventScreenshotOn();
    _protectDataLeakageWithBlur();
    super.initState();
  }

  @override
  void dispose() {
    _preventScreenshotOff();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PortfolioBody(),
    );
  }
}
