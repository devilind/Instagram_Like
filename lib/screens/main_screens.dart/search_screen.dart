// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jbs/constants/colors.dart';
import 'package:jbs/constants/fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CarouselController controller = CarouselController();
  int activeIndex = 0;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Material(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: size.width,
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
                    height: 10,
                  ),
                  Material(
                    elevation: 5,
                    color: Colors.transparent,
                    child: CarouselSlider(
                      carouselController: controller,
                      items: [
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/carousel.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/carousel.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  slideIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Suggested Friends",
                        style: k14pxBold,
                      ),
                      Text(
                        "See all",
                        style: purpleText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customFriendsCard('Sonam Singh', "sonam_singh",
                          'assets/images/avatar.png'),
                      customFriendsCard('Sonam Singh', "sonam_singh",
                          'assets/images/avatar.png'),
                      customFriendsCard('Sonam Singh', "sonam_singh",
                          'assets/images/avatar.png'),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Recently search",
                        style: k14pxBold,
                      ),
                    ),
                  ),
                  GridView.builder(
                      padding: EdgeInsets.all(5),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          crossAxisCount: 3,
                          childAspectRatio: 4 / 5),
                      itemBuilder: (_, index) {
                        return customItemCard("Lays", "assets/images/lays.png");
                      })
                ],
              ),
            ),
          ),
        ),
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

  Widget customFriendsCard(String name, String username, String imgUrl) {
    return Container(
      width: 110,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400, blurRadius: 3, spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imgUrl),
            radius: 30,
          ),
          Text(
            name,
            style: k14px,
          ),
          Text(
            username,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          )
        ],
      ),
    );
  }

  Widget customItemCard(String name, String imgUrl) {
    return Container(
      width: 110,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400, blurRadius: 3, spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imgUrl,
            width: 60,
            height: 60,
            fit: BoxFit.fill,
          ),
          Text(
            name,
            style: k14px,
          ),
        ],
      ),
    );
  }
}
