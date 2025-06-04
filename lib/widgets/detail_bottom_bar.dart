import 'package:flutter/material.dart';

class DetailBottomBar extends StatelessWidget {
  final String price;

  const DetailBottomBar({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("/ Person"),
          Spacer(),

          ElevatedButton.icon(
            onPressed: () {},

            icon: Icon(Icons.shopping_cart, color: Colors.white,),
            label: Text("Add to Cart", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              backgroundColor: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
