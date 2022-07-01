import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';
import 'package:smart_card/app/widgets/custom_avatar.dart';

import 'custom_button.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String amount;
  final String? avatar;
  final VoidCallback onLogout;

  const HomeHeader({
    required this.userName,
    required this.amount,
    this.avatar,
    required this.onLogout,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            avatar != null
                ? CustomAvatar(sizeAvatar: 48.w, memoryImage: avatar!)
                : const CupertinoActivityIndicator(),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Xin chào, ',
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      children: [
                        TextSpan(
                          text: userName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: ColorUtils.primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Số dư: ',
                      style: TextStyle(
                          fontSize: 18.sp, color: ColorUtils.hintTextColor),
                      children: [
                        TextSpan(
                          text: amount,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorUtils.primaryTextColor,
                            height: 1.42,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        CustomButton(
          label: 'Đăng xuất',
          onTap: onLogout,
          labelstyle: StyleUtils.style18Normal
              .copyWith(color: ColorUtils.secondaryColor),
          bgColor: ColorUtils.primaryColor,
        ),
      ],
    );
  }
}
