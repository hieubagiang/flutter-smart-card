import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_card/app/common/utils/utils.dart';

class UserAvatar extends StatelessWidget {
  final String? avatar;
  const UserAvatar({this.avatar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: avatar == null
            ? Container(
                width: 48.0,
                height: 48.0,
                padding: const EdgeInsets.all(9.0),
                color: ColorUtils.primaryColor,
                child: SvgPicture.asset('assets/svg/user_profile_icon.svg'),
              )
            : Image.network(
                avatar!,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
