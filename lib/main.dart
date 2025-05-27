import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
import 'package:travel_in_chiangmai/pages/onboarding_travel.dart';
import 'widgets/main_nav.dart';
import 'blocs/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  //runApp(MyApp(isFirstLaunch: isFirstLaunch));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationCubit()),
        // Add other Cubits/Blocs here if needed
      ],
      child: MyApp(isFirstLaunch: isFirstLaunch),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel in Chiang Mai',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: isFirstLaunch
            ? const TravelOnBoardingScreen()
            : const MainNav(), // Always go to MainNav after first launch
      ),
    );
  }
}
