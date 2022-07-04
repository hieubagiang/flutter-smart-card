import 'package:flutter/material.dart';

import '../common/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Color? hintTextColor;
  final String title;
  final TextStyle? titleStyle;
  final bool isRequire;
  final int line;
  final bool isSecure;
  final bool isEnable;
  final EdgeInsets? padding;

  const CustomTextField({
    this.controller,
    this.hintText,
    this.hintTextColor,
    Key? key,
    required this.title,
    this.isRequire = false,
    this.line = 1,
    this.titleStyle,
    this.padding,
    this.isSecure = false,
    this.isEnable = true,
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
        TextFormField(
          controller: controller,
          obscureText: isSecure,
          enabled: isEnable,
          style:
              StyleUtils.style18Normal.copyWith(color: ColorUtils.blackColor),
          decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.grey[300],
            filled: !isEnable, // dont forget this line

            focusColor: Colors.black,
            contentPadding: padding ??
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            hintText: hintText,
            hintStyle: StyleUtils.style18Normal.copyWith(
              color: hintTextColor ?? ColorUtils.hintTextColor,
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
