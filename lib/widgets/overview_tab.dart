import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/place_model.dart';

class OverviewTab extends StatelessWidget {
  //final Places place;
  final PopularPlaces place; 
  final int currentIndex;

  const OverviewTab({
    super.key,
    required this.place,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(microseconds: 600),

            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(
                    place.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
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
