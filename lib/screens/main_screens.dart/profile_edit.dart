// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jbs/components/circular_avatar.dart';
import 'package:jbs/constants/fonts.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController name = TextEditingController(text: "Sonam Singh");
  TextEditingController username = TextEditingController(text: "sonam_singh");
  TextEditingController website =
      TextEditingController(text: "www.behance3.net/sonamsharma");
  TextEditingController bio = TextEditingController(
      text:
          "Works in TYL ltd, ChennaiBachelors in computer science DM me for any queries");

  TextStyle titleStyle = TextStyle(color: Colors.grey.shade500, fontSize: 14);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Edit Profile",
            style: k18pxBold,
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          actions: [
            InkWell(
              onTap: () => Navigator.maybePop(context),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Done",
                    style: purpleTextBold,
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: CustomCircularAvatarGrey(
                        'assets/images/avatar.png', 80)),
                SizedBox(
                  width: size.width,
                  height: 50,
                ),
                textfieldContainer(size, name, "Name"),
                SizedBox(
                  height: 15,
                ),
                textfieldContainer(size, username, "Username"),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Website",
                  style: titleStyle,
                ),
                SizedBox(
                  width: size.width,
                  child: TextField(
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                    controller: website,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Bio",
                  style: titleStyle,
                ),
                SizedBox(
                  width: size.width,
                  child: TextField(
                    maxLines: 2,
                    style: TextStyle(fontSize: 14),
                    controller: bio,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textfieldContainer(
      Size size, TextEditingController controller, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        SizedBox(
          width: size.width,
          child: TextField(
            style: TextStyle(fontSize: 14),
            controller: controller,
          ),
        )
      ],
    );
  }
}
