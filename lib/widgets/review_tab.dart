import 'package:flutter/material.dart';


class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("User Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            ReviewTile(
              name: "John Doe",
              comment: "Amazing experience, loved the view!",
            ),
            ReviewTile(
              name: "Jane Smith",
              comment: "Comfortable and beautiful location!",
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

  const ReviewTile({
    super.key,
    required this.name,
    required this.comment
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Text(comment),
    );

  }
}