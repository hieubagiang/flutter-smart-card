import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_card/app/data/models/user_model.dart';
import 'package:smart_card/app/routes/app_pages.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../data/models/apdu_command_model.dart';

class MainController extends BaseController
    with GetSingleTickerProviderStateMixin {
  // static final MainController _singleton = MainController._internal();
  late TabController tabController;

  //
  // factory MainController() {
  //   return _singleton;
  // }

  // MainController._internal();

  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;

  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 1;
  var isFirst = true;
  var isSecond = false;
  Rx<UserModel?> user = null.obs;
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 4, initialIndex: 0)
      ..addListener(() {
        onChangeTab(tabController.index);
      });
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // commonController.startLoading();
  }

  void handleIndexChanged(int index) {
    selectedIndex.value = index;
  }

  // RxBool isSelected(int index) {
  //   return RxBool(index == tabController.index);
  // }

  void onChangeTab(int value) {
    selectedIndex.value = value;
  }

  @override
  Future<void> onResumed() async {
    super.onResumed();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  void onTapChangePin() {}

  void logout() {
    injector.get<SmartCardHelper>().disconnect();
    Get.offAllNamed(RouteList.connectCard);
  }

  Future<void> getCardInfo() async {
    final res = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.insGetCardData,
        p1: 0,
        p2: 0));
    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Create profile successful');
      Get.snackbar('', 'Create profile successful'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
      user.value = UserModel.fromRaw(utf8.decode(res!.sn));
    } else {
      injector.get<LogUtils>().logI('failed');
      Get.snackbar('', 'failed_message'.tr,
          colorText: Colors.white, backgroundColor: Colors.red[400]);
    }
  }
}
