// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomCircularAvatar(String imgUrl, double innerSize) {
  return Container(
    width: innerSize,
    height: innerSize,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          Color(0xFFCE004A),
          Color(0xff8c2d9aff),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(2),
      child: CircleAvatar(
        backgroundImage: AssetImage(imgUrl),
      ),
    ),
  );
}

Widget CustomCircularAvatarGrey(String imgUrl, double innerSize) {
  return Container(
    width: innerSize,
    height: innerSize,
    decoration:
        BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200),
    child: Padding(
      padding: EdgeInsets.all(2),
      child: CircleAvatar(
        backgroundImage: AssetImage(imgUrl),
      ),
    ),
  );
}
