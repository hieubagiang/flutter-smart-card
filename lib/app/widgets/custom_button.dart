import 'package:flutter/material.dart';

import '../common/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String label;
  final VoidCallback? onTap;
  final TextStyle? labelstyle;
  final Color bgColor;

  const CustomButton({
    required this.label,
    this.onTap,
    this.icon,
    this.bgColor = Colors.blue,
    Key? key,
    this.labelstyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height,
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? const SizedBox(),
                if (icon != null) const SizedBox(width: 12.0),
                Text(
                  label,
                  style: labelstyle ??
                      StyleUtils.style18Normal.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
