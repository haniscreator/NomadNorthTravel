import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';

class HomeRecommendPackageCard extends StatelessWidget {
  final AllPackages package;

  const HomeRecommendPackageCard({
    super.key,
    required this.package,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDark
            ? []
            : [
                const BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              package.image?.first ?? '',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Package Name
                Text(
                  package.name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: textFontWeight,
                    fontSize: normalTextFontSize,
                  ),
                ),
                const SizedBox(height: 4),

                /// Location
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: theme.hintColor),
                    const SizedBox(width: 4),
                    Text(
                      package.location,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                        fontSize: smallTextFontSize,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                /// Rating
                Row(
                  children: [
                    Text(
                      package.rate.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      ' (${package.review} reviews)',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                        fontSize: smallTextFontSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${package.price}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: primaryBackgroundColor,
                ),
              ),
              Text(
                '/Person',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.hintColor,
                  fontSize: smallTextFontSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:travel_in_chiangmai/const/const.dart';
// import 'package:travel_in_chiangmai/models/data_model.dart';

      
// class HomeRecommendPackageCard extends StatelessWidget {
//   final AllPackages package;

//   const HomeRecommendPackageCard(
//     {
//       super.key,
//       required this.package
//     }
    
//     );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(0, 0, 0, 0.07),
//             blurRadius: 6,
//             offset: const Offset(0,2),
//           )
//         ]
//       ),

//       child: Row(
//         children: [
//           ClipRRect(
//             child: Image.asset(
//               package.image?.first ?? '',
//               width: 90,
//               height: 90,
//               fit: BoxFit.cover,
//             ),
//           ),

//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //package Name 
//                 Text(
//                   package.name,
//                   style: TextStyle(
//                     fontWeight: textFontWeight, fontSize: normalTextFontSize
//                   ),
//                 ),

//                 SizedBox(height: 4),

//                 Row(
//                   children: [
//                     //location icon + location 
//                     Icon(
//                       Icons.location_on, size: 16, color:commonLightBlackColor,
//                     ),
//                     SizedBox(width: 4),

//                     Text(
//                       package.location,
//                       style: TextStyle(
//                         color: commonLightBlackColor, fontSize: smallTextFontSize
//                       ),
//                     )

//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     //rating + review
//                     Text(
//                       package.rate.toString(),
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       ' (${package.review} reviews)',
//                       style: TextStyle(color: commonLightBlackColor, fontSize: smallTextFontSize),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),

//           Column(
//             //crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               //price + person 
//               Text(
//                 '\$${package.price}',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: primaryBackgroundColor,
//                 ),
//               ),
//               Text(
//                 '/Person',
//                 style: TextStyle(color: commonLightBlackColor, fontSize: smallTextFontSize),
//               ),
//             ],
//           )

//         ],
//       ),

//     );
//   }
// }