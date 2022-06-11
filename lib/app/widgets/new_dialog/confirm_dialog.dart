import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';
import '../custom_button.dart';
import 'base_dialog.dart';

class ConfirmDialog extends BaseDialog {
  final String title;
  final String? description;
  final Function()? onConfirmed;
  final bool isAllowSubmit;

  ConfirmDialog(
      {Key? key,
      this.description,
      Widget? bodyWidget,
      Widget? titleWidget,
      required BuildContext context,
      this.title = 'Thông báo',
      bool? showLoad,
      this.onConfirmed,
      this.isAllowSubmit = true,
      double? width = 533})
      : assert(bodyWidget == null || description == null),
        super(
          key: key,
          context: context,
          width: width,
          titleWidget: Text(
            title,
            textAlign: TextAlign.left,
            style: StyleUtils.style20Bold,
          ),
          bodyWidget: bodyWidget ??
              Text(
                description!,
                style: StyleUtils.style16Normal
                    .copyWith(color: ColorUtils.blackColor),
              ),
          actions: [
            CustomButton(
              label: 'Huỷ',
              labelstyle:
                  StyleUtils.style14Bold.copyWith(color: ColorUtils.blackColor),
              bgColor: ColorUtils.whiteColor,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            CustomButton(
              label: 'Đồng ý',
              bgColor: isAllowSubmit
                  ? ColorUtils.primaryColor
                  : ColorUtils.greyColor,
              onTap: isAllowSubmit
                  ? () {
                      onConfirmed?.call();
                    }
                  : null,
            ),
          ],
          showLoad: showLoad,
        );
}
