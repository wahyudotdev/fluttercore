import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen {
  late MediaQueryData _mediaQueryData;
  static late double width;
  static late double height;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width / 100;
    height = _mediaQueryData.size.height / 100;
  }

  static void setPortraitOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void setLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static void clearOrientation() {
    SystemChrome.setPreferredOrientations([]);
  }
}
