// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jbs/components/circular_avatar.dart';
import 'package:jbs/constants/colors.dart';
import 'package:jbs/constants/fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
          title: Text("Chat"),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    enableDrag: true,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    //elevation: 20,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return videoBottomSheet(context);
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.video_call_outlined,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    enableDrag: true,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    //elevation: 20,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return chatBottomSheet(context);
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: Icon(
                  FontAwesomeIcons.commentMedical,
                  size: 20,
                ),
              ),
            ),
          ],
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
                        'The lorem ipsum is a placeholder',
                        style: k12px,
                      ),
                      trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            index == 0 || index == 1
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        (index + 2).toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )
                                : SizedBox(height: 16),
                            Text(
                              '3:42 am',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey.shade500),
                            )
                          ]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget chatBottomSheet(BuildContext context) {
    TextEditingController ksearch = TextEditingController();
    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      builder: (context, scrollController) {
        Size size = MediaQuery.of(context).size;
        return Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.maybePop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: purpleTextBold,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      "New Message",
                      style: k18pxBold,
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: size.width,
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "To: ",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: 30,
                        width: size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: TextField(
                            controller: ksearch,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 37,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade400),
                  child: Icon(
                    FontAwesomeIcons.users,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Create a new group",
                  style: k14pxBold,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Suggested",
                        style: blackTextBold,
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 50,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              ListTile(
                                minVerticalPadding: 0,
                                leading: CustomCircularAvatar(
                                    'assets/images/avatar.png', 50),
                                title: Text(
                                  'Sonam Singh',
                                  style: k14pxBold,
                                ),
                                subtitle: Text(
                                  'sonam_singh',
                                  style: k12px,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 70.0, right: 10),
                                child: SizedBox(
                                  height: 2,
                                  width: size.width,
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    height: 2,
                                    thickness: 1,
                                  ),
                                ),
                              )
                            ],
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget videoBottomSheet(BuildContext context) {
    TextEditingController ksearch = TextEditingController();
    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      builder: (context, scrollController) {
        Size size = MediaQuery.of(context).size;
        return Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.maybePop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: purpleTextBold,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      "Start a call",
                      style: k18pxBold,
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: size.width,
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "To: ",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: 30,
                        width: size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: TextField(
                            controller: ksearch,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 37,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade400),
                  child: Icon(
                    FontAwesomeIcons.users,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Start a new group call",
                  style: k14pxBold,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Suggested",
                        style: blackTextBold,
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 50,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ListTile(
                              minVerticalPadding: 0,
                              leading: CustomCircularAvatar(
                                  'assets/images/avatar.png', 50),
                              title: Text(
                                'Sonam Singh',
                                style: k14pxBold,
                              ),
                              subtitle: Text(
                                'sonam_singh',
                                style: k12px,
                              ),
                              trailing: SizedBox(
                                height: 40,
                                width: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey.shade100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.call_outlined,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey.shade100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.videocam_outlined,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 70.0, right: 10),
                              child: SizedBox(
                                height: 2,
                                width: size.width,
                                child: Divider(
                                  color: Colors.grey.shade300,
                                  height: 2,
                                  thickness: 1,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
