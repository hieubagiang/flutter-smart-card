import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String label;
  final VoidCallback? onTap;
  final TextStyle? labelstyle;
  final Color bgColor;
  final double height;

  const CustomButton({
    required this.label,
    this.onTap,
    this.icon,
    this.bgColor = Colors.blue,
    this.height = 38.0,
    Key? key,
    this.labelstyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? const SizedBox(),
                if (icon != null) const SizedBox(width: 12.0),
                Text(
                  label,
                  style: labelstyle ??
                      const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.53,
                      ),
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
