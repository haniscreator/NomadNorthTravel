import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/pages/home_page.dart';
import 'package:travel_in_chiangmai/widgets/onboarding_dots.dart';

class OnboardingBottomPanel extends StatelessWidget {
  final int currentIndex;
  final TapGestureRecognizer loginRecognizer;

  const OnboardingBottomPanel({
    super.key,
    required this.currentIndex,
    required this.loginRecognizer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        OnboardingDots(currentIndex: currentIndex),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Container(
            width: double.infinity,
            color: theme.cardColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: isDark ? Colors.black45 : Colors.black26,
                          offset: const Offset(0, 5),
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                      color: primaryBackgroundColor,
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Let's Get Started",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 22,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "already have account? ",
                        style: TextStyle(
                          fontSize: normalTextFontSize,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: textLinkColor,
                          fontWeight: textFontWeight,
                          fontSize: normalTextFontSize,
                        ),
                        recognizer: loginRecognizer,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
