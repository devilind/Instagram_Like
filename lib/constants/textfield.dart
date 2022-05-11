import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter the value',
  hintStyle: TextStyle(fontSize: 15, color: Color(0xffB1B1B3), fontFamily: 'Nunito', fontWeight: FontWeight.w400),
  contentPadding:
  EdgeInsets.symmetric(vertical: 8.0, horizontal: 9.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE3E3E3), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffCE004A), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);

const kFormFieldTextStyle = TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Nunito', fontWeight: FontWeight.w700);

const kFormFieldHintTextStyle = TextStyle(fontFamily: 'Nunito',color: Color(0xffB1B1B3), fontSize: 15, fontWeight: FontWeight.w600);

