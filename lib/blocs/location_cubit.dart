

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_in_chiangmai/const/const.dart';

class LocationCubit extends Cubit<String> {
  
  LocationCubit() : super(kDefaultLocation);

  void selectedLocation(String location) {
    emit(location);
  }
}