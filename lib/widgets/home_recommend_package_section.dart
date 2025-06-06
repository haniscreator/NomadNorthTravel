import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';
import 'package:travel_in_chiangmai/widgets/home_recommend_package_card.dart';

class HomeRecommendPackageSection extends StatelessWidget {
  const HomeRecommendPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendPackage = allPackage
        .where((place) => place.category == 'Recommend')
        .toList();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recomended Packages",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: sectionTitleFontSize,
                  fontWeight: textFontWeight,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: smallTextFontSize,
                  color: isDark ? Colors.lightBlue[200] : Colors.blue,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: recommendPackage.length,
          itemBuilder: (context, index) {
            return HomeRecommendPackageCard(package: recommendPackage[index]);
          },
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:travel_in_chiangmai/const/const.dart';
// import 'package:travel_in_chiangmai/models/data_model.dart';

// import 'package:travel_in_chiangmai/widgets/home_recommend_package_card.dart';


// class HomeRecommendPackageSection extends StatelessWidget {
//   const HomeRecommendPackageSection({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//      final recommendPackage = allPackage
//         .where((place) => place.category == 'Recommend')
//         .toList();

    
//     return Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     SizedBox(height: 40),
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           Text(
//             "Recomended Packages",
//             style: TextStyle(
//               fontSize: sectionTitleFontSize,
//               fontWeight: textFontWeight,
//               color: commonBlackColor,
//             ),
//           ),
//           Text(
//             "See All",
//             style: TextStyle(fontSize: 14, color: Colors.blue),
//           ),
//         ],
//       ),
//     ),

//     ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(), // disable internal scroll
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       itemCount: recommendPackage.length,
//       itemBuilder: (context, index) {
//         return HomeRecommendPackageCard(package: recommendPackage[index]);
//       },
//     ),
//   ],
// );

//   }
// }