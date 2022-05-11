// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jbs/components/circular_avatar.dart';
import 'package:jbs/constants/colors.dart';
import 'package:jbs/constants/fonts.dart';
import 'package:jbs/screens/main_screens.dart/mainscreen.dart';
import 'package:jbs/screens/main_screens.dart/profile_edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
  ];
  TextStyle numberStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  TextStyle infoStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
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
          actions: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //   child: Icon(FontAwesomeIcons.ellipsis),
            // ),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 'edit') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileEditScreen()));
                  }
                },
                elevation: 2,
                padding: EdgeInsets.all(2),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 15,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Logout'),
                        ],
                      ),
                    )
                  ];
                })
          ],
          title: Text(
            'Sonam Singh',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SliverToBoxAdapter(
          child: Material(
            shadowColor: Colors.white,
            color: Colors.white,
            elevation: 3,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            child: SizedBox(
              height: 310,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomCircularAvatarGrey(
                            'assets/images/avatar.png', 90),
                        Positioned(
                          bottom: 3,
                          right: 3,
                          child: Material(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Sonam Singh",
                    style: k14pxBold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Works in TYL ltd, Chennai\n Bachelors in computer science\n DM me for any queries",
                    style: k12px,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "www.behance3.net/sonamsharma",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 0, 114, 228)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 90,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '223',
                              style: numberStyle,
                            ),
                            Text(
                              "Posts",
                              style: infoStyle,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '89 M',
                              style: numberStyle,
                            ),
                            Text(
                              "Followers",
                              style: infoStyle,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '12',
                              style: numberStyle,
                            ),
                            Text(
                              "Following",
                              style: infoStyle,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 40,
                          width: 120,
                          child: Center(
                            child: Text(
                              'Wallet',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 40,
                          width: 120,
                          child: Center(
                            child: Text(
                              'Insights',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          color: Colors.white,
          child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 25),
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 10,
              itemCount: images.length,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemBuilder: (_, index) => buildCards(index),
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(5, index.isEven ? 6 : 4)),
        ))
      ],
    );
  }

  Widget buildCards(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(
              images[index],
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}
