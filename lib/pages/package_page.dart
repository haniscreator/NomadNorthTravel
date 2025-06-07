import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';
import 'package:travel_in_chiangmai/widgets/package_category.dart';
import 'package:travel_in_chiangmai/widgets/package_card_swiper.dart';
import 'package:travel_in_chiangmai/widgets/package_search_bar.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  String category = 'Popular';
  List<AllPackages> packageData = allPackage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Packages',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: textFontWeight,
            fontSize: sectionTitleFontSize,
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            const PackageSearchBar(),
            const SizedBox(height: 30),
            PackageCategory(
              selectedCategory: category,
              categories: categories,
              onCategorySelected: (selected) {
                setState(() {
                  category = selected;
                  packageData = selected == "Popular"
                      ? allPackage
                      : allPackage
                          .where((element) =>
                              element.category!.toLowerCase() ==
                              selected.toLowerCase())
                          .toList();
                });
              },
            ),
            PackageCardSwiper(packages: packageData),
          ],
        ),
      ),
    );
  }
}
