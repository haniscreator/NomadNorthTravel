import 'package:flutter/material.dart';

class PackageSearchBar extends StatelessWidget {
  const PackageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Package",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black26,
                ),
                prefixIcon: const Icon(Icons.search, size: 30),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.teal,
            ),
            child: const Icon(
              Icons.tune,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}