// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget stackedHeads() => SizedBox(
      width: 60,
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Align(
            widthFactor: 0.42,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage(
                    'assets/images/avatar.png'), // Provide your custom image
              ),
            ),
          );
        },
      ),
    );
