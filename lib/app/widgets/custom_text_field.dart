import 'package:flutter/material.dart';

import '../common/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;
  final TextStyle? titleStyle;
  final bool isRequire;
  final int line;
  final bool isSecure;

  const CustomTextField({
    required this.controller,
    this.hintText = '',
    Key? key,
    required this.title,
    this.isRequire = false,
    this.line = 1,
    this.titleStyle,
    this.isSecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRequire ? "$title (*)" : title,
          style: titleStyle ?? StyleUtils.style18Normal,
        ),
        SizedBox(
          height: 8.h,
        ),
        TextField(
          controller: controller,
          obscureText: isSecure,
          style:
              StyleUtils.style18Medium.copyWith(color: ColorUtils.blackColor),
          decoration: InputDecoration(
            // isDense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            hintText: hintText,
            hintStyle: StyleUtils.style18Normal.copyWith(
              color: ColorUtils.hintTextColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: ColorUtils.greyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: ColorUtils.greyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: ColorUtils.greyColor),
            ),
          ),
          maxLines: line,
          minLines: line,
        ),
      ],
    );
  }
}
