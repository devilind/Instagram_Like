// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:jbs/components/custom_scroll_behaviour.dart';

import 'package:jbs/screens/form_screens/add_member_screen.dart';
import 'package:jbs/screens/form_screens/create_job_here_screen.dart';
import 'package:jbs/screens/form_screens/create_job_screen.dart';
import 'package:jbs/screens/form_screens/delivery_partner_registration_screen.dart';
import 'package:jbs/screens/form_screens/home_service_registration_screen.dart';
import 'package:jbs/screens/form_screens/member_added_successfully_screen.dart';
import 'package:jbs/screens/form_screens/registration_screen.dart';

import 'package:jbs/screens/main_screens.dart/homepage.dart';
import 'package:jbs/screens/main_screens.dart/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'JBS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          ),

      home: const MainScreen(),
      //home: CreateJobScreen(),
    );
  }
}