import 'package:flutter/material.dart';

import '../config.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: isEnglish
                ? const Radius.circular(0)
                : const Radius.circular(25),
            topRight: isEnglish
                ? const Radius.circular(25)
                : const Radius.circular(0),
            bottomLeft: isEnglish
                ? const Radius.circular(0)
                : const Radius.circular(25),
            bottomRight: isEnglish
                ? const Radius.circular(25)
                : const Radius.circular(0),
          ),
          color: backGroundApp,
        ),
        //    child: bodyAlertDialog,
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Row(
              children: [
                const SizedBox(width: 35.0),
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    // color: Colors.white,
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
                        blurRadius: 20,
                        offset:
                            const Offset(0, 13), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20.0),
                const Text(
                  "Palladium",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child:
                        _buildListViewItems(Icons.favorite_border, "Favorites"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildListViewItems(Icons.search, "Search Items"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildListViewItems(Icons.layers_outlined, "Brands"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildListViewItems(Icons.cloud, "Calculator"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildListViewItems(Icons.cloud, "Total Pricing"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildListViewItems(
                        Icons.credit_card_outlined, "Subscriptions"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child:
                        _buildListViewItems(Icons.phone_outlined, "Contact US"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child:
                        _buildListViewItems(Icons.share_outlined, "Share App"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildListViewItems(
                        Icons.settings_outlined, "Settings"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: _buildListViewItems(Icons.login_outlined, "LogIn"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewItems(icon, String textTitle) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 30.0),
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 5.0),
            Text(
              textTitle,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          height: 7.0,
        ),
      ],
    );
  }
}
