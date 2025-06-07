import 'package:flutter/material.dart';

//Slide-in + Fade-in Animation
class SlideInFadeInGalleryImage extends StatefulWidget {
  final String imagePath;
  final Duration delay;

  const SlideInFadeInGalleryImage({
    super.key,
    required this.imagePath,
    required this.delay,
  });

  @override
  State<SlideInFadeInGalleryImage> createState() => _FadeInGalleryImageState();
}

class _FadeInGalleryImageState extends State<SlideInFadeInGalleryImage> {
  double _opacity = 0;
  Offset _offset = const Offset(0, 20); // Slide from bottom

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _opacity = 1;
          _offset = Offset.zero;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 500),
      child: AnimatedSlide(
        offset: _offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
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

