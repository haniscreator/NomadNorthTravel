import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
import 'package:travel_in_chiangmai/widgets/location_picker.dart';

class LocationSelectorRow extends StatelessWidget {
  const LocationSelectorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, String>(
      builder: (context, selectedLocation) {
        return GestureDetector(
          onTap: () => showLocationPicker(context),
          child: Row(
            children: [
              const Icon(Iconsax.location, color: Colors.black),
              const SizedBox(width: 5),
              Text(
                selectedLocation,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 30,
                color: Colors.black26,
              ),
            ],
          ),
        );
      },
    );
  }
}
