import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';


class PackageCategory extends StatelessWidget {
  final String selectedCategory;
  final List<String> categories;
  final Function(String) onCategorySelected;

  const PackageCategory({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: GestureDetector(
              onTap: () => onCategorySelected(categories[index]),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedCategory == categories[index]
                      ? primaryBackgroundColor
                      : Colors.white,
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: selectedCategory == categories[index]
                        ? Colors.white
                        : commonSuperLightBlackColor,
                    fontSize: normalTextFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
