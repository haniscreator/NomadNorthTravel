import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeNotificationIcon extends StatelessWidget {
  const HomeNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.all(7),
      child: const Stack(
        children: [
          Icon(
            Iconsax.notification,
            color: Colors.black,
            size: 30,
          ),
          Positioned(
            top: 5,
            right: 5,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
