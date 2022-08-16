import 'package:flutter/material.dart';

class AppColors {
  static const secondary = Color(0xFF7AC241);
  static const primary = Color(0xFF1767B3);
  static const textBlack = Color(0xFF030303);
  static const textGray = Color(0xFFBABABA);
  static const softGray = Color(0xFFF3F3F3);

  static final primarySwatch = MaterialColor(
    primary.value,
    const {
      50: Color(0xff155da1), //10%
      100: Color(0xff12528f), //20%
      200: Color(0xff10487d), //30%
      300: Color(0xff0e3e6b), //40%
      400: Color(0xff0c345a), //50%
      500: Color(0xff092948), //60%
      600: Color(0xff071f36), //70%
      700: Color(0xff051524), //80%
      800: Color(0xff020a12), //90%
      900: Color(0xff000000), //100%
    },
  );
}
