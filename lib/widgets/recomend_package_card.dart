import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/place_model.dart';
      
class RecommendPackageCard extends StatelessWidget {
  final Places place;
  
  const RecommendPackageCard(
    {
      super.key,
      required this.place
    }
    
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 6,
            offset: const Offset(0,2),
          )
        ]
      ),

      child: Row(
        children: [
          ClipRRect(
            child: Image.network(
              place.image?.first ?? '',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Place Name 
                Text(
                  place.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16
                  ),
                ),

                SizedBox(height: 4),

                Row(
                  children: [
                    //location icon + location 
                    Icon(
                      Icons.location_on, size: 16, color: Colors.grey,
                    ),
                    SizedBox(width: 4),

                    Text(
                      place.location,
                      style: TextStyle(
                        color: Colors.grey, fontSize: 13
                      ),
                    )

                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    //rating + review
                    Text(
                      place.rate.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '(${place.review} reviews)',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
          ),

          Column(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //price + person 
              Text(
                '\$${place.price}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              Text(
                '/Person',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          )

        ],
      ),

    );
  }
}