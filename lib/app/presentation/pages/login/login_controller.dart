import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../data/models/apdu_command_model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends BaseController {
  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;
  TextEditingController pinTextCtrl = TextEditingController();

  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 1;
  var isFirst = true;
  bool verifyCardResult = true; //Mock Verify card
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();

  @override
  Future<void> onInit() async {
    super.onInit();
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

  Future<void> onSubmitLogin() async {
    List<int> data = [...pinTextCtrl.text.codeUnits];
    for (int i = 0; i < data.length; i++) {
      data[i] = data[i] - 48;
    }
    final res = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.verify,
        p1: 0,
        p2: 0,
        data: data));
    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Verify success');
      Get.offAndToNamed(RouteList.main);
    } else {
      injector.get<LogUtils>().logI('Verify failed');
    }
  }
}
