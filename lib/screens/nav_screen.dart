import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:free_laner_project11/languages/custome_languages.dart';
import 'package:http/http.dart' as http;

import '../widgets/widgets.dart';
import '../config.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndexScreen = 0;
  List mainScreen = [
    const HomeScreen(),
    const TypeScreen(),
    const SearchScreen(),
    const PaymentScreen(),
    const SettingScreen(),
  ];

  onTapped(int index) async {
    setState(() {
      _selectedIndexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isEnglish == true ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        drawer: _selectedIndexScreen == 0 ? const CustomDrawer() : null,
        appBar: _selectedIndexScreen == 0
            ? AppBar(
                title: const Text(
                  'Palladium',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 20,
                    color: Color(0xff199be0),
                    letterSpacing: 0.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: backGroundApp,
                elevation: 0,
                centerTitle: true,
                // leading: IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.menu,
                //       color: Colors.white,
                //     )),
                actions: [
                  IconButton(
                      onPressed: () async {
                        print("start");
                        // Provider.of<LanguageProvider>(context, listen: false)
                        //     .myChangeLanguage();

                        //Register Method
                        // var request = http.MultipartRequest('POST', Uri.parse('https://packages.3codeit.com/api/register'));
                        // request.fields.addAll({
                        //   'name': 'hossam',
                        //   'email': 'hossam@ma.com',
                        //   'password': '12345678',
                        //   'phone': '1555',
                        //   'country_id': '1',
                        //   'account_type': 'company',
                        //   'company_name': ''
                        // });
                        // http.StreamedResponse response = await request.send();
                        // if (response.statusCode == 200) {
                        //   print(await response.stream.bytesToString());
                        // }
                        // else {
                        //   print(response.reasonPhrase);
                        // }

                        // LogIn Method
                        Uri myurl =Uri.parse('https://packages.3codeit.com/api/login');

                        http.post(myurl, headers: {
                          'Accept': 'application/json',
                          'authorization': 'pass your key(optional)'
                        }, body: {
                          "email": 'hossam@ma.com',
                          "password": "12345678"
                        }).then((response) {
                          print(response.statusCode);
                          print(response.body);
                        });

                        // var request = http.MultipartRequest('POST', Uri.parse('https://packages.3codeit.com/api/login'));
                        // request.fields.addAll({
                        //   'email': 'hossam@ma.com',
                        //   'password': '12345678'
                        // });
                        // http.StreamedResponse response = await request.send();
                        // if (response.statusCode == 200) {
                        //   print(await response.stream.bytesToString());
                        // }
                        // else {
                        //   print(response.reasonPhrase);
                        // }


                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              )
            : null,
        body: mainScreen[_selectedIndexScreen],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.0),
          onPressed: () {
            onTapped(2);
          },
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
                  color: Colors.lightBlueAccent.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 9,
                  offset: const Offset(0, 8), // changes position of shadow
                ),
              ],
            ),
            child: const Icon(
              Icons.search,
              size: 32.0,
              color: Colors.white,
            ),
          ),
          // ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: backGroundApp,
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueAccent,
                  offset: Offset(2, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: columnX(
                    Icons.home_outlined,
                    0,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: columnX(
                    Icons.layers_outlined,
                    1,
                  ),
                ),
                //Location Floating Action Button
                const Expanded(
                  flex: 1,
                  child: SizedBox(width: 1),
                ),
                Expanded(
                  flex: 2,
                  child: columnX(
                    Icons.credit_card_outlined,
                    3,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: columnX(
                    Icons.settings_outlined,
                    4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell columnX(iconType, int screenNumber) {
    return InkWell(
      onTap: () => onTapped(screenNumber),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconType,
            color: _selectedIndexScreen == screenNumber
                ? Colors.lightBlueAccent
                : Colors.grey,
          ),
        ],
      ),
    );
  }
}
