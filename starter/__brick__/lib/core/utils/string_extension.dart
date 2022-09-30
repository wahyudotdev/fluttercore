import 'dart:ui';

import 'package:flutter/services.dart';

extension StringExtension on String? {
  String get removeHtmlTags {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    // return replaceAll(exp, '');
    if (this != null) {
      return this!.replaceAll(exp, '');
    }
    return '';
  }

  Future<Uint8List> get uint8List async {
    ByteData data = await rootBundle.load(this ?? '');
    Codec codec =
        await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 50);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  bool get isValidEmail {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this ?? '');
  }
}
