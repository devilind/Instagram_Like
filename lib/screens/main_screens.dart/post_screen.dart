// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jbs/components/circular_avatar.dart';
import 'package:jbs/components/stack_heads.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Post"),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Icon(
        //       Icons.video_call_outlined,
        //       size: 30,
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20, left: 10),
        //     child: Icon(
        //       FontAwesomeIcons.commentMedical,
        //       size: 20,
        //     ),
        //   ),
        // ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 8),
            child: postCard(size),
          );
        },
      ),
    );
  }

  Widget postCard(Size size) {
    return Container(
      width: size.width * 0.95,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomCircularAvatar('assets/images/avatar.png', 40),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Sakshi Singh')
                  ],
                ),
                Icon(Icons.bookmark_border_outlined, size: 30)
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.78,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage('assets/images/card.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.heart,
                      size: 25,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Icon(
                      Icons.comment_outlined,
                      size: 25,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Icon(
                      FontAwesomeIcons.paperPlane,
                      size: 23,
                    )
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 4.0, bottom: 2),
              alignment: Alignment.centerLeft,
              child: Text(
                'Apply before 17th october limited seats',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4),
              child: Row(
                children: [
                  stackedHeads(),
                  Text(
                    'liked by Maya & 90 others',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View Insights',
                  style: TextStyle(color: Colors.blue),
                ),
                Material(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                  child: SizedBox(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Boost Post",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
