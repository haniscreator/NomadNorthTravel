import 'package:flutter/material.dart';
import '../models/data_model.dart';

class DetailReviewTab extends StatelessWidget {
  const DetailReviewTab({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            
            Column(
              children: List.generate(userReviews.length,(index) {
                final review = userReviews[index];
                return ReviewTile(
                  name: review.name, 
                  comment: review.comment, 
                  photo: review.photo,
                  );
              }),
            ),

          ],
        ),
      ),
    );
  }

  
}

class ReviewTile extends StatelessWidget {
  
  final String name;
  final String comment;
  final String photo;

  const ReviewTile({
    super.key,
    required this.name,
    required this.comment,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(photo)),
      title: Text(name),
      subtitle: Text(comment),
    );

  }
}