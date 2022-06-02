import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/styles.dart';

import '../../../common/base/base_view_view_model.dart';
import 'login_controller.dart';

class LoginScreen extends BaseView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Căn cước công dân',
          style: StyleUtils.style18Bold,
        )
      ],
    ));
  }
}
