import 'package:flutter/material.dart';

const Color KCustomGreen = Color(0xFF4CCC88);
const Color KCustomBlack = Colors.black;

const List<Color> colorList = [
  Color(0xFFF73859),
  Color(0xFF233142),
  Colors.yellowAccent,
  Colors.black,
  Color(0xFFE3E3E3),
  Color(0xFF00FFB2), //LightLeafGreen
  Color(0xFFFF5722),
];

const KTextFieldDecoration = InputDecoration(
  hintText: 'Enter your value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF4CCC88), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF4CCC88), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const KTextStyle =TextStyle(
  color: Colors.black,
  fontSize: 17.5,
  fontWeight: FontWeight.w700,
  fontFamily: 'Quicksand',
);

const KIntStyle = TextStyle(
  color:Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 15,
  fontFamily: 'Quicksand'
);

const KAppBarStyle = TextStyle(
  fontSize: 25.0,
  color: Colors.black,
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.w900,
);