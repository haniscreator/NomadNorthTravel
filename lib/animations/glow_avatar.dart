import 'package:flutter/material.dart';


class GlowAvatar extends StatefulWidget {
  const GlowAvatar({super.key});

  @override
  State<GlowAvatar> createState() => _GlowAvatarState();
}

class _GlowAvatarState extends State<GlowAvatar>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
      ),
    );
  }
}