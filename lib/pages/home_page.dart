import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/widgets/home_location_dropdown.dart';

import 'package:travel_in_chiangmai/widgets/home_notification_icon.dart';
import 'package:travel_in_chiangmai/widgets/home_popular_place_section.dart';
import 'package:travel_in_chiangmai/widgets/home_recommend_package_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
        backgroundColor: kBackgroundColor, 
        appBar: headerParts(),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              HomePopularPlaceSection(),
              HomeRecommendPackageSection(),
            ],
          ),
        ),

      );
  }

  AppBar headerParts() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HomeLocationDropdown(), // ⬅️ Modular location row
          HomeNotificationIcon(), // ⬅️ Modular notification badge
        ],
      ),
    );
  }
}
