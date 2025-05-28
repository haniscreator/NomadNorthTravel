import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/place_model.dart';
import 'package:travel_in_chiangmai/widgets/place_card.dart';

class PopularPlaceSection extends StatelessWidget {
  const PopularPlaceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final popularPlaces = myDestination
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
            children: const [
              Text(
                "Popular Places",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                "See All",
                style: TextStyle(fontSize: 14, color: Colors.blue),
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
              return PlaceCard(place: popularPlaces[index]);
            },
          ),
        )
      ],
    );
  }
}
