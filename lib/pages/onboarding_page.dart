import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_in_chiangmai/const/const.dart';

import 'package:flutter/gestures.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';
import 'package:travel_in_chiangmai/pages/home_page.dart';
import 'package:travel_in_chiangmai/pages/login_page.dart';
import 'package:travel_in_chiangmai/widgets/main_nav.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late TapGestureRecognizer _loginTapRecognizer;

  @override
  void initState() {
    super.initState();
    _loginTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      };
  }

  @override
  void dispose() {
    _loginTapRecognizer.dispose();
    super.dispose();
  }

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
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onboarding.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                onboarding[index].image,
                fit: BoxFit.cover,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 130), // Replaced Skip button with spacing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        ],//children
                      ),//stack
                    ),
                    const SizedBox(height: 20),
                 Visibility(
                  visible: isShowDescOnboarding,
                  child: Stack(
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
                ),

                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 245,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboarding.length,
                      dotIndicator,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      padding: const EdgeInsets.all(35),
                      color: Colors.white,
                      child: Column(
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
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 5),
                                    spreadRadius: 15,
                                    blurRadius: 15,
                                  ),
                                ],
                                color: kButtonColor,
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Let's Get Started",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: "already have account? ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextSpan(
                                  text: "Login",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  recognizer: _loginTapRecognizer,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
