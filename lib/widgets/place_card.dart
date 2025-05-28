import 'package:flutter/material.dart';
import '../models/place_model.dart'; // Adjust the path as needed

class PlaceCard extends StatelessWidget {
  final Places place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 8,
            offset: const Offset(0,4),
          )
        ],
        image: DecorationImage(
          image: NetworkImage(
                  place.image![0],
                ),
          fit: BoxFit.cover,
        ),
      ),

      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 5,
            left: 5,
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
                    style: TextStyle(color: Colors.white, fontSize: 18)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            place.location,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 22,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5),

                          Text(
                            place.rate.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
    );
  }
}
