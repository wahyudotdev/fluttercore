import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xff54BAB9);
  static const secondary = Color(0xff18978F);
  static const textBlack = Color(0xFF030303);
  static const textGray = Color(0xFFBABABA);
  static const softGray = Color(0xFFF3F3F3);

  static final primarySwatch = MaterialColor(
    primary.value,
    const {
      50: Color(0xffedf8f8), //10%
      100: Color(0xffdcf1f1), //20%
      200: Color(0xffcbeaea), //30%
      300: Color(0xffbae3e3), //40%
      400: Color(0xffa9dcdc), //50%
      500: Color(0xff98d5d5), //60%
      600: Color(0xff87cece), //70%
      700: Color(0xff76c7c7), //80%
      800: Color(0xff65c0c0), //90%
      900: Color(0xff54bab9), //100%
    },
  );
}
