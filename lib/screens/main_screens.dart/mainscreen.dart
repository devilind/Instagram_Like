// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jbs/constants/colors.dart';
import 'package:jbs/screens/main_screens.dart/add_screen.dart';
import 'package:jbs/screens/main_screens.dart/homepage.dart';
import 'package:jbs/screens/main_screens.dart/notification_screen.dart';
import 'package:jbs/screens/main_screens.dart/profile_screen.dart';
import 'package:jbs/screens/main_screens.dart/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = <Widget>[
    HomePage(),
    SearchScreen(),
    AddScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: primaryColor,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.add, size: 30),
          Icon(FontAwesomeIcons.heart, size: 25),
          Icon(Icons.person_outline, size: 30),
        ],
        onTap: (index) {
          // if (index == 2) {
          //   setState(() {
          //     screenIndex = 0;
          //   });
          // } else {
          setState(() {
            screenIndex = index;
          });
          // }
        },
      ),
    );
  }
}
