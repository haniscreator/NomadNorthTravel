import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';
import 'package:travel_in_chiangmai/widgets/home_popular_place_card.dart';
import 'package:travel_in_chiangmai/const/const.dart';

class HomePopularPlaceSection extends StatelessWidget {
  const HomePopularPlaceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final popularPlaces = popularPlace
        .where((place) => place.category == 'popular')
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Places",
                style: TextStyle(
                  fontSize: sectionTitleFontSize,
                  fontWeight: textFontWeight,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: smallTextFontSize,
                  color: isDark ? Colors.teal[200] : Colors.teal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: popularPlaces.length,
            itemBuilder: (context, index) {
              return HomePopularPlaceCard(place: popularPlaces[index]);
            },
          ),
        )
      ],
    );
  }
}

