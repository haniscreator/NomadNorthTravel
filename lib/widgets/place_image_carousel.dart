import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/place_model.dart';

class PlaceImageCarousel extends StatelessWidget {
  final Places place;
  final int currentIndex;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const PlaceImageCarousel({
    super.key,
    required this.place,
    required this.currentIndex,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final images = place.image ?? [];

    return SizedBox(
      height: 400,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: '${place.name}_image_$index',
                        child: Image.network(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 24,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.white, size: 18),
                                const SizedBox(width: 4),
                                Text(
                                  place.location,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 18),
                                const SizedBox(width: 4),
                                Text(
                                  '${place.rate}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(${place.review} reviews)',
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 8,
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 4,
                dotWidth: 24,
                expansionFactor: 1.5,
                activeDotColor: Colors.white,
                dotColor: Colors.white30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
