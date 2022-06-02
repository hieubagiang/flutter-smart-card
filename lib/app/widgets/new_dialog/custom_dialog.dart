import 'package:smart_card/app/common/utils/utils.dart';
import 'package:flutter/material.dart';

import '../custom_button.dart';

class Consts {
  Consts._();

  static const double padding = 15.0;
  static const double avatarRadius = 66.0;
}

class CustomDialog extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    String title = 'Thông báo',
    String description = '',
    required VoidCallback onAccept,
    VoidCallback? onCancel,
  }) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: description,
        onAccept: onAccept,
        onCancel: onCancel,
      ),
    );
  }

  final String title;
  final String description;
  final VoidCallback onAccept;
  final String acceptText;
  final VoidCallback? onCancel;
  final String cancelText;
  final double width;

  const CustomDialog({
    this.title = 'Thông báo',
    this.description = '',
    required this.onAccept,
    this.acceptText = 'ĐỒNG Ý',
    this.onCancel,
    this.cancelText = 'HỦY',
    this.width = 533.0,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                color: ColorUtils.primaryTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
                color: ColorUtils.primaryTextColor,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 38.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  onCancel != null
                      ? TextButton(
                          onPressed: onCancel,
                          child: Text(
                            cancelText,
                            style:
                                const TextStyle(color: ColorUtils.primaryColor),
                          ))
                      : const SizedBox(),
                  SizedBox(width: onCancel != null ? 8.0 : 0.0),
                  CustomButton(
                    label: acceptText,
                    bgColor: ColorUtils.primaryColor,
                    onTap: onAccept,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
