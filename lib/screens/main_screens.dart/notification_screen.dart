// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jbs/constants/colors.dart';
import 'package:jbs/screens/main_screens.dart/mainscreen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextStyle blackText = TextStyle(color: Colors.black, fontSize: 14);
  TextStyle blackTextBold =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle purpleText = TextStyle(color: primaryColor, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        MainScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                  (route) => false);
            },
          ),
          centerTitle: true,
          title: Text(
            "Notification",
            style: TextStyle(fontSize: 22),
          ),
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: blackText,
              labelStyle: purpleText,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              tabs: <Tab>[
                Tab(
                  text: "Your",
                ),
                Tab(
                  text: 'My Job',
                ),
                Tab(
                  text: 'Delivery Partner',
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            yourTab(),
            Center(
              child: Text('2'),
            ),
            Center(
              child: Text('3'),
            )
          ],
        ),
      ),
    );
  }

  Widget yourTab() {
    return ListView.builder(
        itemCount: 4,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return index < 2 ? requestTile() : likedTile();
        });
  }

  Widget requestTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Material(
        elevation: 2,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          contentPadding: EdgeInsets.all(4),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          title: Text(
            'Sanvi Mehra',
            style: blackTextBold,
          ),
          subtitle: Text(
            "requests to follow you.",
            style: blackText,
          ),
          trailing: SizedBox(
            width: 145,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(5),
                  elevation: 1,
                  color: primaryColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mentionTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Material(
        elevation: 2,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
            contentPadding: EdgeInsets.all(4),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            title: SizedBox(
              width: 100,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'nandini_.16 ', style: blackTextBold),
                    TextSpan(
                        text: 'mention you in a comment: ', style: blackText),
                    TextSpan(text: '@tusharkhera12 ', style: purpleText),
                    TextSpan(text: 'Nice post', style: blackText),
                  ],
                ),
              ),
            ),
            trailing: Image.asset(
              'assets/images/img1.png',
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            )),
      ),
    );
  }

  Widget likedTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Material(
        elevation: 2,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
            contentPadding: EdgeInsets.all(4),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            title: SizedBox(
              width: 100,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'nandini_.16 ', style: blackTextBold),
                    TextSpan(text: 'liked your comment: ', style: blackText),
                    TextSpan(text: '@tusharkhera12 ', style: purpleText),
                    TextSpan(text: 'Nice post', style: blackText),
                  ],
                ),
              ),
            ),
            trailing: Image.asset(
              'assets/images/img1.png',
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
