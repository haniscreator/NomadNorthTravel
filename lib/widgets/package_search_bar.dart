import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';

class PackageSearchBar extends StatelessWidget {
  const PackageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color,
              ),
              decoration: InputDecoration(
                hintText: "Search Package",
                hintStyle: TextStyle(
                  fontSize: normalTextFontSize,
                  color: isDark ? Colors.grey.shade400 : commonSuperLightBlackColor,
                ),
                prefixIcon: Icon(Icons.search, size: 30, color: theme.iconTheme.color),
                filled: true,
                fillColor: isDark ? Colors.grey.shade800 : Colors.white,
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDark ? Colors.grey.shade700 : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryBackgroundColor,
                  ),
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
              color: primaryBackgroundColor,
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