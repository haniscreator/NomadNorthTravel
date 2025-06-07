import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_in_chiangmai/blocs/theme/theme_bloc.dart';


class HomeThemeIcon extends StatelessWidget {
  const HomeThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().toggleTheme();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isDark ? Colors.white24 : Colors.black12,
          ),
        ),
        padding: const EdgeInsets.all(7),
        child: Icon(
          isDark ? Iconsax.sun_1 : Iconsax.moon,
          color: isDark ? Colors.white : Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
