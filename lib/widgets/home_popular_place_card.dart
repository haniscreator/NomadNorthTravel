import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';

import 'package:travel_in_chiangmai/pages/place_detail_page.dart';

class HomePopularPlaceCard extends StatelessWidget {
  //final Places place;
  final PopularPlaces place;

  const HomePopularPlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        // Navigate to detail page on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            //builder: (context) => PlaceDetailPage(place: place),
            builder: (context) => PlaceDetailPage(place: place, initialIndex: 0),
          ),
        );
      },

      child: Hero(
        tag: '${place.name}_image_0',
        child: Container(
          width: 320,
          margin: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Image
                Image.asset(
                  place.image![0],
                  fit: BoxFit.cover,
                ),
      
                // Overlay with text and icons
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          const Color.fromARGB(230, 11, 11, 11),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(color: commonWhiteColor, fontSize: cardTitleFontSize),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, color: commonWhiteColor, size: normalTextFontSize),
                                Text(
                                  place.location,
                                  style: TextStyle(color: commonWhiteColor, fontSize: normalTextFontSize),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star_rounded, size: 22, color: commonAmberColor),
                                SizedBox(width: 5),
                                Text(
                                  place.rate.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: commonWhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
