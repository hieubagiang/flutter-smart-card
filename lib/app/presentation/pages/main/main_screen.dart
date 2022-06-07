import 'package:flutter/material.dart';

import '../../../common/base/base_view_view_model.dart';
import 'main_controller.dart';

class MainScreen extends BaseView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return const Scaffold(body: Text('main screen'));
  }
}
