import 'dart:ui';



import 'package:flutter/material.dart';

class AppColor {
  // Light Theme Colors
  static const Color silverLight = Color(0xffC4C4C4);
  static const Color mineShaftLight = Color(0xff2C2C2C);
  static const Color dustyGrayLight = Color(0xff9A9A9A);
  static const Color goldLight = Color(0xffFFD600);
  static const Color whiteLight = Color(0xffFFFFFF);
  static const Color hintOfRedLight = Color(0xffFDFDFE);
  static const Color porpoiseLight = Color(0xffDADADA);

  // Dark Theme Colors
  static const Color silverDark = Color(0xff8A8A8A);
  static const Color mineShaftDark = Color(0xff1A1A1A);
  static const Color dustyGrayDark = Color(0xff6A6A6A);
  static const Color goldDark = Color(0xffFFD600);
  static const Color whiteDark = Color(0xff0A0A0A);
  static const Color hintOfRedDark = Color(0xff1F1F1F);
  static const Color porpoiseDark = Color(0xffA1A1A1);

  // Method to get the appropriate color based on brightness
  static Color silver(Brightness brightness) => brightness == Brightness.dark ? silverDark : silverLight;
  static Color mineShaft(Brightness brightness) => brightness == Brightness.dark ? dustyGrayDark : mineShaftLight;
  static Color dustyGray(Brightness brightness) => brightness == Brightness.dark ? dustyGrayDark : dustyGrayLight;
  static Color gold(Brightness brightness) => brightness == Brightness.dark ? goldDark : goldLight;
  static Color white(Brightness brightness) => brightness == Brightness.dark ? whiteDark : whiteLight;
  static Color hintOfRed(Brightness brightness) => brightness == Brightness.dark ? hintOfRedDark : hintOfRedLight;
  static Color porpoise(Brightness brightness) => brightness == Brightness.dark ? porpoiseDark : porpoiseLight;
}
