import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/colors_utils.dart';

class CustomMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String? icon;
  final String label;
  final bool selected;
  final Widget? iconWidget;
  const CustomMenuItem({
    required this.onTap,
    this.icon,
    this.label = 'Label',
    this.selected = false,
    Key? key,
    this.iconWidget,
  }) : super(key: key);

  static const selectedColor = ColorUtils.primaryColor;
  static const normalColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: selected ? Colors.white : ColorUtils.primaryColor),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            iconWidget ??
                Image.asset(
                  icon!,
                  color: selected ? selectedColor : normalColor,
                  height: 24.w,
                  width: 24.w,
                ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: selected ? selectedColor : normalColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
