import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Palladium',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              canvasColor: Colors.white.withOpacity(0.0),
            ),
            home: const NavScreen(),
          );
        }
      },
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palladium',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.white.withOpacity(0.0),
      ),
      home: const NavScreen(),
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
