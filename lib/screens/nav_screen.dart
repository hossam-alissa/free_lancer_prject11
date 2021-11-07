import 'package:flutter/material.dart';

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
    return Scaffold(
      body: mainScreen[_selectedIndexScreen],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTapped(2);
        },
        // shape: _CustomBorder(),
        backgroundColor: _selectedIndexScreen == 2
            ? Colors.lightBlueAccent.withOpacity(0.7)
            : Colors.black12,
        child: const CustomPaint(
          child: Icon(
            Icons.add,
            size: 40.0,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
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
                  _selectedIndexScreen == 0
                      ? Icons.home
                      : Icons.home_outlined,
                  isEnglish ? "Home" : "الرئيسية",
                  0,
                ),
              ),
              Expanded(
                flex: 2,
                child: columnX(
                  _selectedIndexScreen == 1 ? Icons.saved_search : Icons.search,
                  isEnglish ? "Type" : "النوع",
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
                  _selectedIndexScreen == 3 ? Icons.message : Icons.message_outlined,
                  isEnglish ? "Subscribe" : "الإشتراك",
                  3,
                ),
              ),
              Expanded(
                flex: 2,
                child: columnX(
                  _selectedIndexScreen == 4
                      ? Icons.person
                      : Icons.person_outline,
                  isEnglish ? "Setting" : "الإعدادات",
                  4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell columnX(iconType, String name, int screenNumber) {
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
                : Colors.black38,
          ),
          Text(
            name,
            style: TextStyle(
                color: _selectedIndexScreen == screenNumber
                    ? Colors.lightBlueAccent
                    : Colors.black38),
          ),
        ],
      ),
    );
  }
}
