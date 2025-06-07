import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
import 'package:travel_in_chiangmai/const/const.dart';
import 'package:travel_in_chiangmai/widgets/home_location_row.dart';

class HomeLocationDropdown extends StatelessWidget {
  const HomeLocationDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<LocationCubit, String>(
      builder: (context, selectedLocation) {
        return GestureDetector(
          onTap: () => showLocationDropdown(context),
          child: Row(
            children: [
              Icon(
                Iconsax.location,
                color: theme.iconTheme.color ?? Colors.black,
              ),
              const SizedBox(width: 5),
              Text(
                selectedLocation,
                style: TextStyle(
                  fontWeight: textFontWeight,
                  fontSize: normalTextFontSize,
                  color: theme.textTheme.bodyLarge?.color ?? Colors.black,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 30,
                color: theme.iconTheme.color?.withAlpha(128) ?? Colors.black26,
              ),
            ],
          ),
        );
      },
    );
  }
}
