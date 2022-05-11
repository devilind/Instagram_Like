// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jbs/components/circular_avatar.dart';
import 'package:jbs/components/stack_heads.dart';
import 'package:jbs/constants/colors.dart';
import 'package:jbs/screens/main_screens.dart/chat_screen.dart';
import 'package:jbs/screens/main_screens.dart/post_screen.dart';
import 'package:jbs/screens/main_screens.dart/story_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../story/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController controller = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kbackgroundColor,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GradientText(
              'JBS',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              colors: [
                primaryColor,
                Color(0xffB51866),
                Color(0xff7257B1),
                Color(0xff2D9AFF),
              ],
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostScreen(),
                ),
              );
            },
            child: Container(
                margin: EdgeInsets.all(12),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Icon(
                  Icons.play_arrow_outlined,
                  size: 25,
                )),
          ),
          actions: [
            InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10),
                  child: Icon(
                    FontAwesomeIcons.paperPlane,
                    size: 20,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
              ),
            ),
            SizedBox(
              width: 9,
            )
          ]),
      backgroundColor: kbackgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.70,
            height: size.height * 0.85,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: controller,
                    items: [
                      Container(
                        width: size.width * 0.70,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/carousel.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/carousel.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.70,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/carousel.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        }),
                  ),
                  slideIndicator(),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                          child: postCard(size),
                        );
                      })
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: size.width * 0.20,
            height: size.height * 0.85,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10),
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StoryScreen(stories: stories),
                                ),
                              );
                            },
                            child: CustomCircularAvatar(
                                'assets/images/avatar.png', 60)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Sakshi Singh',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget slideIndicator() {
    return AnimatedSmoothIndicator(
      onDotClicked: (index) {
        controller.animateToPage(index);
      },
      activeIndex: activeIndex,
      count: 3,
      effect: JumpingDotEffect(
          activeDotColor: primaryColor, dotWidth: 8, dotHeight: 8),
    );
  }

  Widget postCard(Size size) {
    return Container(
      width: size.width * 0.7,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
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
                    width: 5,
                  ),
                  Text('Sakshi Singh')
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.bookmark_border_outlined),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width * 0.6,
                height: 140,
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
                    size: 20,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(
                    Icons.comment_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(
                    FontAwesomeIcons.paperPlane,
                    size: 18,
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 20),
            child: Text(
              'Apply before 17th october limmited seats',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                stackedHeads(),
                Text(
                  'liked by Maya & 90 others',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
