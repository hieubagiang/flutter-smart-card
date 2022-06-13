import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';
import 'package:smart_card/app/widgets/user_avatar.dart';

import 'custom_button.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String userRole;
  final String? avatar;
  final VoidCallback onLogout;
  const HomeHeader({
    required this.userName,
    required this.userRole,
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
            UserAvatar(avatar: avatar),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Xin chào, ',
                    style: TextStyle(
                        fontSize: 16.sp, color: ColorUtils.primaryTextColor),
                    children: [
                      TextSpan(
                        text: userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: ColorUtils.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                /*Text(
                  userRole,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorUtils.hintTextColor,
                    height: 1.42,
                  ),
                ),*/
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
