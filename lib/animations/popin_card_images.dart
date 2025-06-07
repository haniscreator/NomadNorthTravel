import 'package:flutter/material.dart';

//1. Scale (Pop-in) Animation

class PopInCardImages extends StatefulWidget {
  final String imagePath;
  final Duration delay;

  const PopInCardImages({
    super.key,
    required this.imagePath,
    required this.delay,
  });

  @override
  State<PopInCardImages> createState() => _FadeInGalleryImageState();
}

class _FadeInGalleryImageState extends State<PopInCardImages>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _scale = 0.9;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _opacity = 1;
          _scale = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 500),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutBack,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
