import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/widgets/home_location_dropdown.dart';

import 'package:travel_in_chiangmai/widgets/home_popular_place_section.dart';
import 'package:travel_in_chiangmai/widgets/home_recommend_package_section.dart';
import 'package:travel_in_chiangmai/widgets/home_theme_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // ✅ Dynamic background
      appBar: headerParts(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20),
            HomePopularPlaceSection(),
            HomeRecommendPackageSection(),
          ],
        ),
      ),
    );
  }

  AppBar headerParts() {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      backgroundColor: theme.appBarTheme.backgroundColor ?? theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HomeLocationDropdown(),
          HomeThemeIcon(),
        ],
      ),
    );
  }
}



