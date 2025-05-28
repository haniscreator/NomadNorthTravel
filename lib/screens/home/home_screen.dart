import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/widgets/location_selector_row.dart';
import 'package:travel_in_chiangmai/widgets/notification_icon.dart';
import 'package:travel_in_chiangmai/widgets/place_card.dart';
import 'package:travel_in_chiangmai/widgets/popular_place_section.dart';
import 'package:travel_in_chiangmai/widgets/recomend_package_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              PopularPlaceSection(),
              RecommendPackageSection(),
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
          LocationSelectorRow(), // ⬅️ Modular location row
          NotificationIcon(), // ⬅️ Modular notification badge
        ],
      ),
    );
  }
}
