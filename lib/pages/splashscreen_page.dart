import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_in_chiangmai/pages/onboarding_page.dart';
import 'package:travel_in_chiangmai/widgets/main_nav.dart';

class SplashScreenPage extends StatefulWidget {
  final bool isFirstLaunch;
  const SplashScreenPage({super.key, required this.isFirstLaunch});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => widget.isFirstLaunch
              ? const OnBoardingPage()
              : const MainNav(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/lotties/splash.json',
          width: 250,
          height: 250,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
