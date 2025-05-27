import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
import 'package:travel_in_chiangmai/const/const.dart';

void showLocationPicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: kLocationList.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(kLocationList[index]),
            onTap: () {
              Navigator.pop(context);
              context.read<LocationCubit>().selectedLocation(kLocationList[index]);
            },
          );
        },
      );
    },
  );
}
