import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_card/app/common/utils/utils.dart';
import 'package:smart_card/app/widgets/custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key, this.content = "", this.title = 'Error', this.onTap})
      : super(key: key);

  final String content;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: StyleUtils.style24Medium
                    .copyWith(color: Colors.red, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 6.h),
              Text(content,
                  textAlign: TextAlign.center,
                  style: StyleUtils.style20Normal
                      .copyWith(color: Colors.grey[600])),
              SizedBox(height: 10.h),
              SizedBox(
                width: 200,
                child: CustomButton(
                  label: 'OK',
                  bgColor: ColorUtils.primaryColor,
                  onTap: () => onTap?.call() ?? SmartDialog.dismiss(),
                  labelstyle:
                      StyleUtils.style20Normal.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
