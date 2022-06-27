import 'package:flutter/material.dart';

import '../../../common/base/base_controller.dart';

class TaxController extends BaseController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 3, initialIndex: 0)
      ..addListener(() {
        onChangeTab(tabController.index);
      });
  }

  void onChangeTab(int value) {
    selectedIndex.value = value;
  }
}
