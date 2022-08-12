import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{package_name}}/core/utils/theme_extension.dart';

import 'app_colors.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String caption;
  final bool isEnabled;
  final bool isLoading;
  final Color outline;
  final TextStyle? textStyle;
  final double radius;
  const AppButton({
    super.key,
    this.color = AppColors.green,
    this.caption = 'Button',
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
    this.outline = Colors.transparent,
    this.textStyle,
    this.radius = 10,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        OutlinedButton(
          onPressed: isEnabled == true && !isLoading ? () => onPressed() : null,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            backgroundColor: isEnabled == true ? color : Colors.grey,
            textStyle: textStyle ?? context.textTheme.button,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isLoading,
                child: Container(
                  width: 4.w,
                  height: 4.w,
                  margin: const EdgeInsets.only(right: 4),
                  child: const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Text(
                caption,
                style: textStyle ?? context.textTheme.button,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
