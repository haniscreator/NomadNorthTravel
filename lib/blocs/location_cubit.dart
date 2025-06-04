
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';


class LocationCubit extends Cubit<String> {
  
  LocationCubit() : super(defaultCity);

  void selectedLocation(String location) {
    emit(location);
  }
}