import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';

class OnboardingDots extends StatelessWidget {
  final int currentIndex;

  const OnboardingDots({super.key, required this.currentIndex});

  Widget dotIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 6),
      width: 30,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index == currentIndex ? Colors.white : Colors.white54,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onboarding.length, dotIndicator),
    );
  }
}
