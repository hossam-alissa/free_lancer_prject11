import 'package:flutter/material.dart';
import 'package:free_laner_project11/languages/custome_languages.dart';
import 'package:free_laner_project11/services/services.dart';
import 'package:provider/provider.dart';

import 'config.dart';
import 'module/moduls.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<LanguageProvider>(
              create: (_) => LanguageProvider()),
          ChangeNotifierProvider<IndexScreen>(
              create: (_) => IndexScreen()),
          ChangeNotifierProvider<Brand>(
              create: (_) => Brand()),
          // ChangeNotifierProvider<MyProvider>(create: (_) => MyProvider()),
          // ChangeNotifierProxyProvider<UserInformation, Advertisement>(
          // create: (_) => Advertisement(),
          // update: (ctx, valueUI, valueAdv) => valueAdv!
          // ..getDataAuthToken(authToken: valueUI.token.toString())),
          // ChangeNotifierProxyProvider<UserInformation, Comments>(
          // create: (_) => Comments(),
          // update: (ctx, valueUI, valueCom) => valueCom!
          // ..getDataAuthToken(authToken: valueUI.token.toString())),
        ],
        child: isLogIn == true ? const NavScreen() : const SplashScreen(),
      ),
    );
  }
}
