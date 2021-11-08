import 'package:flutter/material.dart';

import 'screens/screens.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
