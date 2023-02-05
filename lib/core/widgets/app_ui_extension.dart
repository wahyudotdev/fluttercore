import 'package:flutter/material.dart';

extension AppUiExtension on BuildContext {
  Future<T?> openBottomSheet<T>(
      {Color? backgroundColor,
      required Widget Function(BuildContext builder) builder}) {
    return showModalBottomSheet<T>(
      context: this,
      backgroundColor: backgroundColor ?? Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: builder,
    );
  }
}
