import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';

class PackageCardSwiper extends StatelessWidget {
  final List<AllPackages> packages;

  const PackageCardSwiper({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.52,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 60, left: 20),
      child: Swiper(
        itemCount: packages.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7 + 15,
        axisDirection: AxisDirection.right,
        loop: true,
        onTap: (index) {},
        itemBuilder: (context, index) {
          return _AnimatedPackageCard(
            travel: packages[index],
            isDark: isDark,
            theme: theme,
            index: index,
          );
        },
      ),
    );
  }
}

class _AnimatedPackageCard extends StatefulWidget {
  final AllPackages travel;
  final bool isDark;
  final ThemeData theme;
  final int index;

  const _AnimatedPackageCard({
    required this.travel,
    required this.isDark,
    required this.theme,
    required this.index,
  });

  @override
  State<_AnimatedPackageCard> createState() => _AnimatedPackageCardState();
}

class _AnimatedPackageCardState extends State<_AnimatedPackageCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _shouldAnimate = false;

  @override
  void initState() {
    super.initState();

    _shouldAnimate = widget.index == 0;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    if (_shouldAnimate) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _shouldAnimate
        ? SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _buildCardContent(),
            ),
          )
        : _buildCardContent();
  }

  Widget _buildCardContent() {
    final travel = widget.travel;
    final isDark = widget.isDark;
    final theme = widget.theme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: isDark ? Colors.grey[900] : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(travel.image?.first ?? ''),
                  ),
                ),
              ),
            ),
            // Details
            Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        travel.name!,
                        style: TextStyle(
                          fontSize: formSubTitleFontSize,
                          color: theme.textTheme.bodyLarge?.color,
                          fontWeight: textFontWeight,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: isDark ? Colors.grey[400] : commonLightBlackColor,
                            size: 14,
                          ),
                          Text(
                            travel.location!,
                            style: TextStyle(
                              fontSize: smallTextFontSize,
                              color: isDark ? Colors.grey[400] : commonLightBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Transform.translate(
                              offset: const Offset(-15, 0),
                              child: Container(
                                height: 45,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: isDark ? Colors.grey[800] : Colors.grey.withAlpha(38),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: DottedLine(
                                  dashColor:
                                      isDark ? Colors.grey[700]! : Colors.grey.withAlpha(102),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(15, 0),
                              child: Container(
                                height: 45,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: isDark ? Colors.grey[800] : Colors.grey.withAlpha(38),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "\$${travel.price} ",
                              style: TextStyle(
                                fontSize: cardTitleFontSize,
                                fontWeight: textFontWeight,
                                color: primaryBackgroundColor,
                              ),
                            ),
                            TextSpan(
                              text: "/ Person",
                              style: TextStyle(
                                fontSize: smallTextFontSize,
                                color: isDark ? Colors.grey[400] : commonLightBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: textLinkColor.withAlpha((0.1 * 255).round()),
                        ),
                        child: Icon(
                          Icons.bookmark_outline,
                          color: Colors.blue.shade400,
                          size: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
