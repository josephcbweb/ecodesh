import 'package:flutter/material.dart';

class Dimensions {
  late double screenWidth;
  late double screenHeight;

  Dimensions(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  double getPercentageHeight(double height) => height / screenHeight * 100.0;

  double getPercentageWidth(double height) => height / screenWidth * 100.0;

  // Percent of screen height
  double height(double percentage) => screenHeight * (percentage / 100);

  // Percent of screen width
  double width(double percentage) => screenWidth * (percentage / 100);

  // Font size
  double font(double factor) => screenWidth / factor;

  // Radius and icon sizes
  double radius(double factor) => screenHeight / factor;

  double iconSize(double factor) => screenHeight / factor;

  //Fixed Sizes

  double font1() => font(2);

  double font2() => font(4);

  double font3() => font(6);

  double font4() => font(8);

  double font5() => font(10);

  double font6() => font(12);

  double font7() => font(14);

  double font8() => font(16);

  double font9() => font(18);

  double font10() => font(20);

  double font11() => font(22);

  double font12() => font(24);

  double font13() => font(26);

  double font14() => font(28);

  double paddingVertical1() => height(30);

  double paddingVertical2() => height(25);

  double paddingVertical3() => height(20);

  double paddingVertical4() => height(15);

  double paddingVertical5() => height(10);

  double paddingVertical6() => height(8);

  double paddingVertical7() => height(5);

  double paddingVertical8() => height(3);

  double paddingVertical9() => height(2);

  double paddingVertical10() => height(1);

  double paddingVertical11() => height(0.5);

  double paddingHorizontal1() => width(30);

  double paddingHorizontal2() => width(25);

  double paddingHorizontal3() => width(20);

  double paddingHorizontal4() => width(15);

  double paddingHorizontal5() => width(10);

  double paddingHorizontal6() => width(8);

  double paddingHorizontal7() => width(5);

  double paddingHorizontal8() => width(3);

  double paddingHorizontal9() => width(2);

  double paddingHorizontal10() => width(1);

  double paddingHorizontal11() => width(0.5);
}
