import 'package:flutter/material.dart';

class TextStyles{
  static const String fontFamily = 'Poppins';

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium  = FontWeight.w500;
  static const FontWeight semiBold  = FontWeight.w600;
  static const FontWeight bold  = FontWeight.w700;

  static const TextStyle regular10 = TextStyle(
    fontSize: 10,
    fontWeight: regular,
    fontFamily: fontFamily
  );
  static const TextStyle regular12 = TextStyle(
    fontSize: 12,
    fontWeight: regular,
    fontFamily: fontFamily
  );
  static const TextStyle regular15 = TextStyle(
    fontSize: 15,
    fontWeight: regular,
    fontFamily: fontFamily
  );

  static const TextStyle medium12 = TextStyle(
    fontSize: 12,
    fontWeight: medium,
    fontFamily: fontFamily
  );
  static const TextStyle medium15 =  TextStyle(
    fontSize: 15,
    fontWeight: medium,
    fontFamily: fontFamily
  );
  static const TextStyle medium60 = TextStyle(
      fontSize: 60,
      fontWeight: medium,
      fontFamily: fontFamily
  );
  static const TextStyle medium70 = TextStyle(
      fontSize: 70,
      fontWeight: medium,
      fontFamily: fontFamily
  );

  static const TextStyle semibold20 = TextStyle(
      fontSize: 20,
      fontWeight: semiBold,
      fontFamily: fontFamily
  );
  static const TextStyle semibold30 = TextStyle(
      fontSize: 30,
      fontWeight: semiBold,
      fontFamily: fontFamily
  );
}