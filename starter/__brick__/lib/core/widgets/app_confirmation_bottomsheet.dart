import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/utils/theme_extension.dart';
import 'package:{{package_name}}/core/utils/translation.dart';

import '../utils/screen.dart';
import 'app_button.dart';
import 'app_colors.dart';

class AppConfirmationBottomSheet extends StatelessWidget {
  const AppConfirmationBottomSheet({
    Key? key,
    required this.onConfirm,
    required this.image,
    required this.title,
    required this.content,
    required this.btnConfirmText,
    this.height = 44,
    this.cancelText,
    this.onCancel,
  }) : super(key: key);
  final Function onConfirm;
  final Image image;
  final String title;
  final String content;
  final String btnConfirmText;
  final double height;
  final String? cancelText;
  final Function? onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.height * height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Screen.height * 4,
        horizontal: Screen.width * 8,
      ),
      child: Column(
        children: [
          image,
          SizedBox(
            height: Screen.height * 2,
          ),
          Text(
            title,
            style: context.textTheme.headline6,
          ),
          SizedBox(
            height: Screen.height * 2,
          ),
          Text(
            content,
            style: context.textTheme.bodyText1?.copyWith(
              color: AppColors.textGray,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Screen.height * 4,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: AppButton(
                  onPressed: () =>
                      onCancel?.call() ?? Navigator.of(context).pop(),
                  isEnabled: true,
                  caption: cancelText ?? context.text.cancel,
                  color: Colors.white,
                  textStyle: context.textTheme.button?.copyWith(
                    color: AppColors.textBlack,
                  ),
                ),
              ),
              SizedBox(
                width: Screen.width * 4,
              ),
              Flexible(
                flex: 1,
                child: AppButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                  isEnabled: true,
                  caption: btnConfirmText,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
