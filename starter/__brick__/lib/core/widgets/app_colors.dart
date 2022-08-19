import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0x{{primary_color}});
  static const secondary = Color(0x{{secondary_color}});
  static const textBlack = Color(0xFF030303);
  static const textGray = Color(0xFFBABABA);
  static const softGray = Color(0xFFF3F3F3);

  static final primarySwatch = MaterialColor(
    primary.value,
    const {
      50: Color({{swatches_9}}), //10%
      100: Color({{swatches_8}}), //20%
      200: Color({{swatches_7}}), //30%
      300: Color({{swatches_6}}), //40%
      400: Color({{swatches_5}}), //50%
      500: Color({{swatches_4}}), //60%
      600: Color({{swatches_3}}), //70%
      700: Color({{swatches_2}}), //80%
      800: Color({{swatches_1}}), //90%
      900: Color({{swatches_0}}), //100%
    },
  );
}
