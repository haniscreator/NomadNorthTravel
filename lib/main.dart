import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
import 'package:travel_in_chiangmai/blocs/auth_cubit.dart';
import 'package:travel_in_chiangmai/blocs/theme/theme_bloc.dart';

import 'package:travel_in_chiangmai/pages/splashscreen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ThemeCubit()), // Add ThemeCubit here
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
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeState.themeData,
          home: SplashScreenPage(isFirstLaunch: isFirstLaunch),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
// import 'package:travel_in_chiangmai/blocs/auth_cubit.dart';
// import 'package:travel_in_chiangmai/pages/splashscreen_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => LocationCubit()),
//         // Add other Cubits/Blocs here if needed
//       ],
//       child: MyApp(isFirstLaunch: isFirstLaunch),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   final bool isFirstLaunch;
//   const MyApp({super.key, required this.isFirstLaunch});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => AuthCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: SplashScreenPage(isFirstLaunch: isFirstLaunch),
//       ),
//     );
//   }
// }

