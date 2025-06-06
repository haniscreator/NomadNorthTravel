import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
import 'package:travel_in_chiangmai/blocs/auth_cubit.dart';
import 'package:travel_in_chiangmai/pages/splashscreen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

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
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashScreenPage(isFirstLaunch: isFirstLaunch),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travel_in_chiangmai/blocs/auth_cubit.dart';
// import 'package:travel_in_chiangmai/pages/splashscreen_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => AuthCubit(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: SplashScreenPage(),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travel_in_chiangmai/blocs/auth_cubit.dart';

// import 'package:travel_in_chiangmai/pages/splashscreen_page.dart';

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



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:travel_in_chiangmai/blocs/location_cubit.dart';
// import 'package:travel_in_chiangmai/const/const.dart';
// import 'package:travel_in_chiangmai/pages/onboarding_page.dart';
// import 'widgets/main_nav.dart';
// import 'blocs/auth_cubit.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

//   //runApp(MyApp(isFirstLaunch: isFirstLaunch));
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
//         home: isFirstLaunch
//             ? const OnBoardingPage()
//             : const MainNav(), // Always go to MainNav after first launch
//       ),
//     );
//   }
// }
