import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundApp,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlueAccent,
                      Colors.blue,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withOpacity(0.2),
                      spreadRadius: 20,
                      blurRadius: 25,
                      offset: const Offset(0, 23), // changes position of shadow
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60.0),
              const Text(
                "Palladium",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 1.0,
                width: 40.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10.0),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Log & record your activities",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
