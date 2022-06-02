import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../common/base/base_view_view_model.dart';
import 'main_controller.dart';

class MainScreen extends BaseView<MainController> {
  final controller = Get.put(MainController());

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(body: const Text('main screen'));
  }
}
