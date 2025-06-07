import 'package:flutter/material.dart';

import 'package:travel_in_chiangmai/animations/glow_avatar.dart';
import 'package:travel_in_chiangmai/animations/slidein_fadein_gallery_images.dart';
import 'package:travel_in_chiangmai/const/const.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curved background and header
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    height: 260,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      
                      const GlowAvatar(),

                      const SizedBox(height: 12),
                      const Text(
                        'P.Han',
                        style: TextStyle(fontSize: formSubTitleFontSize, fontWeight: textFontWeight),
                      ),
                      const Text(
                        'Digital Nomad',
                        style: TextStyle(fontSize: normalTextFontSize, color: commonLightBlackColor),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          _StatItem(label: 'Shots', value: '68'),
                          SizedBox(width: 30),
                          _StatItem(label: 'Followers', value: '1.2K'),
                          SizedBox(width: 30),
                          _StatItem(label: 'Following', value: '90'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add follow logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Follow',
                              style: TextStyle(fontSize: normalTextFontSize, color: commonWhiteColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Gallery section title
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 250, 16, 0), // push content below avatar area
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  "Gallery",
                  style: TextStyle(fontSize: sectionTitleFontSize, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
              ]),
            ),
          ),

          // Gallery image grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SlideInFadeInGalleryImage(
                      imagePath: 'assets/images/gallery/${index + 1}.jpg',
                      delay: Duration(milliseconds: 400 * index), 
                    ),
                  );
                },
                childCount: 9,
              ),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 60),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
