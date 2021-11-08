import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:const Color.fromRGBO(248, 246, 240, 1.0),
        body: Center(
          child: Image.asset(
            "assets/image_page/splash_screen.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
