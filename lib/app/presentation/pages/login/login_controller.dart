import 'dart:async';

import 'package:flutter/material.dart';

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
  TextEditingController pinTextCtrl = TextEditingController(text: '1234');

  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 1;
  var isFirst = true;
  bool verifyCardResult = true; //Mock Verify card
  int count = 3;
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // commonController.startLoading();
    // onSubmitLogin();
    await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.genRsa,
        p1: 0,
        p2: 0,
        data: [0]));
    await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.getPublicKey,
        p1: 0,
        p2: 0,
        data: [0]));
    // await StorageHelper.setPublicKey(String.fromCharCodes(res!.sn));
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
    List<int> data = pinStringToNumber(pinTextCtrl.text.codeUnits);
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
      Get.snackbar('', 'Mở khoá thẻ thành công'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
    }
  }

  Future<void> unlockCard() async {
    if (count == 0) {
      Get.snackbar('', 'Thẻ bị khoá'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
      return;
    }
    final res = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.unblock,
        p1: 0,
        p2: 0,
        data: []));
    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Mở khoá thẻ thành công');
      Get.snackbar('', 'Mở khoá thẻ thành công'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
    } else {
      count--;
      Get.snackbar('', 'Mở khoá thẻ thất bại'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
    }
  }
}
