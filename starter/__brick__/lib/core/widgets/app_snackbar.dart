import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{package_name}}/core/utils/theme_extension.dart';

extension ShowSnackbar on BuildContext {
  void showSnackbar(String message, {bool isPositive = false}) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          margin: EdgeInsets.symmetric(
            vertical: 4.h,
          ),
          child: ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            tileColor: isPositive == true ? Colors.green : Colors.red,
            title: Text(
              message,
              style: textTheme.bodyText2?.copyWith(
                color: Colors.white,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
