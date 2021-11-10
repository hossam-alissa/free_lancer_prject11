import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../languages/custome_languages.dart';
import '../module/brands.dart';
import '../module/moduls.dart';
import '../services/index_screen.dart';
import '../widgets/widgets.dart';
import '../config.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List mainScreen = [
    const HomeScreen(),
    const TypeScreen(),
    const SearchScreen(),
    const PaymentScreen(),
    const SettingScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Brand>(context, listen: false).fitchData();
    Provider.of<Country>(context, listen: false).fitchData();
    Provider.of<MemberShip>(context, listen: false).fitchData();
    Provider.of<Product>(context, listen: false).fitchData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          getIsEnglish(context) == true ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        drawer: getIndexScreen(context) == 0 ? const CustomDrawer() : null,
        appBar: getIndexScreen(context) == 0
            ? AppBar(
                title: Text(
                  getTranslate(context, "palladium"),
                  style: const TextStyle(
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
                        Provider.of<LanguageProvider>(context, listen: false)
                            .myChangeLanguage();
                        print(Provider.of<Brand>(context, listen: false)
                            .brands![0]
                            .createdAt);
                        print(Provider.of<Country>(context, listen: false)
                            .countries![0]
                            .memberships![0]
                            .pivot!
                            .countryId);

                        var request = http.MultipartRequest(
                            'POST',
                            Uri.parse(
                                'https://packages.3codeit.com/api/login'));
                        request.fields.addAll(
                            {'email': 'maged@ma.com', 'password': '123'});
                        http.StreamedResponse response = await request.send();
                        if (response.statusCode == 200) {
                          print(await response.stream.bytesToString());
                        } else {
                          print(response.reasonPhrase);
                        }
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              )
            : null,
        body: mainScreen[getIndexScreen(context)],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.0),
          onPressed: () {
            changeIndexScreen(context, 2);
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
                    context,
                    Icons.home_outlined,
                    0,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: columnX(
                    context,
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
                    context,
                    Icons.credit_card_outlined,
                    3,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: columnX(
                    context,
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

  InkWell columnX(
    context,
    iconType,
    int screenNumber,
  ) {
    return InkWell(
      onTap: () {
        changeIndexScreen(context, screenNumber);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconType,
            color: getIndexScreen(context) == screenNumber
                ? Colors.lightBlueAccent
                : Colors.grey,
          ),
        ],
      ),
    );
  }
}
