import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttercore/core/utils/theme_extension.dart';

import 'app_colors.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    Key? key,
    required this.hint,
    this.onClick,
    this.withElevation,
    this.readOnly = false,
    this.onChanged,
  }) : super(key: key);
  final String hint;
  final Function? onClick;
  final bool? withElevation;
  final bool readOnly;
  final Function(String)? onChanged;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final controller = TextEditingController();
  bool? showClearButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick?.call(),
      child: Material(
        color: Colors.white,
        elevation: widget.withElevation == true ? 1 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppColors.softGray,
          ),
        ),
        child: TextField(
          enabled: widget.onClick == null,
          style: context.textTheme.bodyMedium,
          readOnly: widget.readOnly,
          onChanged: (data) {
            widget.onChanged?.call(data);
            setState(() {
              showClearButton = controller.text.isNotEmpty;
            });
          },
          controller: controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textGray,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: showClearButton == true
                ? GestureDetector(
                    onTap: () {
                      controller.text = '';
                      widget.onChanged?.call('');
                      setState(() {
                        showClearButton = false;
                      });
                    },
                    child: const Icon(Icons.cancel_outlined))
                : const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
