// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jbs/components/circular_avatar.dart';
import 'package:jbs/constants/colors.dart';
import 'package:jbs/constants/fonts.dart';

class SearchScreen2 extends StatefulWidget {
  const SearchScreen2({Key? key}) : super(key: key);

  @override
  State<SearchScreen2> createState() => _SearchScreen2State();
}

class _SearchScreen2State extends State<SearchScreen2> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text("Search"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: size.width * 0.9,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.search,
                      size: 20,
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: TextField(
                          maxLength: 40,
                          style: TextStyle(fontSize: 14),
                          controller: searchController,
                          decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: 'Search'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading:
                          CustomCircularAvatar('assets/images/avatar.png', 60),
                      title: Text(
                        'Sonam Singh',
                        style: k14pxBold,
                      ),
                      subtitle: Text(
                        'sonam_singh',
                        style: k12px,
                      ),
                      trailing: index == 2
                          ? Material(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              elevation: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                child: Text(
                                  'Following',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          : Material(
                              borderRadius: BorderRadius.circular(5),
                              elevation: 1,
                              color: primaryColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 22),
                                child: Text(
                                  'Follow',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
