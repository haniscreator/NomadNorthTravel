import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';

class OnboardingImage extends StatelessWidget {
  final int index;

  const OnboardingImage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      onboarding[index].image,
      fit: BoxFit.cover,
      );
    
  }
}