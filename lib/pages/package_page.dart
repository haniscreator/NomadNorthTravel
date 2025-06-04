import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/models/destination_model.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  String category = 'Popular';
  int selectedIndex = 0;
  List<Destination> myDestination = destinations;
  List<IconData> icons = [
    Icons.home_rounded,
    Icons.location_on_rounded,
    Icons.bookmark_outline_rounded,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // headerParts(), // 🚫 AppBar removed
            SizedBox(height: size.height * 0.03),
            searchBar(),
            const SizedBox(height: 30),
            exploreCities(),
            caategorySelection(),
            cardSwiper(size),
          ],
        ),
      ),
      // 🚫 BottomNavigationBar removed
    );
  }

  Container cardSwiper(Size size) {
    return Container(
      height: size.height * 0.52,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 60, left: 20),
      child: Swiper(
        itemCount: myDestination.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        axisDirection: AxisDirection.right,
        onTap: (index) {},
        loop: true,
        itemBuilder: (context, index) {
          final travel = myDestination[index];
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
                          image: NetworkImage(travel.image!),
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 25,
                              child: Row(
                                children: [
                                  // Left Bubble (shifted left)
                                  Transform.translate(
                                    offset: const Offset(-10, 0), // move left
                                    child: Container(
                                      height: 25,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey.withOpacity(0.15),
                                      ),
                                    ),
                                  ),

                                  // Dotted Line (fills space between bubbles)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: DottedLine(
                                        dashColor: Colors.grey.withOpacity(0.4),
                                      ),
                                    ),
                                  ),

                                  // Right Bubble (shifted right)
                                  Transform.translate(
                                    offset: const Offset(10, 0), // move right
                                    child: Container(
                                      height: 25,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey.withOpacity(0.15),
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
                                color: blue.shade50,
                              ),
                              child: const Icon(
                                Icons.bookmark_outline,
                                color: blue,
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

  SingleChildScrollView caategorySelection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            categories.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    category = categories[index];
                    category == "Popular"
                        ? myDestination = destinations
                        : myDestination = destinations
                            .where(
                              (element) =>
                                  element.category!.toLowerCase() ==
                                  categories[index].toLowerCase(),
                            )
                            .toList();
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: category == categories[index]
                        ? Colors.blue
                        : Colors.white,
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: category == categories[index]
                          ? Colors.white
                          : Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding exploreCities() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Explore Cities",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                "All",
                style: TextStyle(
                  fontSize: 14,
                  color: blue,
                ),
              ),
              Icon(
                Icons.arrow_right_rounded,
                size: 25,
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Place",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black26,
                ),
                prefixIcon: const Icon(Icons.search, size: 30),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: lightblue,
            ),
            child: const Icon(
              Icons.tune,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
