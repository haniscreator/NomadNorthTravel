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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.52,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 60, left: 20),
      child: Swiper(
        itemCount: packages.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7 + 15,
        axisDirection: AxisDirection.right,
        onTap: (index) {},
        loop: true,
        itemBuilder: (context, index) {
          final travel = packages[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue[300],
                                  size: 14,
                                ),
                                Text(
                                  travel.location!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue[300],
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
                                        color: Colors.grey.withAlpha(38),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: DottedLine(
                                        dashColor: Colors.grey.withAlpha(102),
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
                                        color: Colors.grey.withAlpha(38),
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
                                    text: "\$${travel.price} /",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Person",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.8),
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
                                color: Colors.blue.shade50,
                              ),
                              child: const Icon(
                                Icons.bookmark_outline,
                                color: Colors.blue,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
