import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';


void showLocationDropdown(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: cityList.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cityList[index]),
            onTap: () {
              Navigator.pop(context);
              context.read<LocationCubit>().selectedLocation(cityList[index]);
            },
          );
        },
      );
    },
  );
}
