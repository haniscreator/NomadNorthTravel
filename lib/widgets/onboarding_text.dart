import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';

class OnboardingText extends StatelessWidget {
  final int currentIndex;
  const OnboardingText({super.key, required this.currentIndex});

    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 130),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Stack(
              children: [
                Text(
                  onboarding[currentIndex].title,
                  style: TextStyle(
                    fontSize: 48,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                Text(
                  onboarding[currentIndex].title,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (isShowDescOnboarding)
            Stack(
              children: [
                Text(
                  onboarding[currentIndex].description,
                  style: TextStyle(
                    fontSize: 17,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.black,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                Text(
                  onboarding[currentIndex].description,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

}