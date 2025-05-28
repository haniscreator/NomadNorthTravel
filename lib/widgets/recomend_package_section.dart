import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/place_model.dart';
import 'package:travel_in_chiangmai/widgets/place_card.dart';
import 'package:travel_in_chiangmai/widgets/recomend_package_card.dart';

class RecommendPackageSection extends StatelessWidget {
  const RecommendPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    
     final recommendPackage = myDestination
        .where((place) => place.category == 'popular')
        .toList();

    
    return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Recomended package for you",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ],
      ),
    ),

    ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // disable internal scroll
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: recommendPackage.length,
      itemBuilder: (context, index) {
        return RecomendPackageCard(place: recommendPackage[index]);
      },
    ),
  ],
);

  }
}