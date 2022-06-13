import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../data/models/apdu_command_model.dart';

class ChangePinController extends BaseController {
  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;
  TextEditingController currentPinTextCtrl = TextEditingController();
  TextEditingController newPinTextCtrl = TextEditingController();
  TextEditingController confirmNewPinTextCtrl = TextEditingController();

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

  Future<void> onSubmitChangePin() async {
    if (newPinTextCtrl.text == confirmNewPinTextCtrl.text) {
      List<int> data1 = pinStringToNumber(currentPinTextCtrl.text.codeUnits);
      List<int> data = pinStringToNumber(newPinTextCtrl.text.codeUnits);
      final verify = await smartCardHelper.sendApdu(ApduCommand(
          cla: SmartCardConstant.walletCla,
          ins: SmartCardConstant.verify,
          p1: 0,
          p2: 0,
          data: data1));

      if (verify?.sw[0] == SmartCardConstant.success) {
        final res = await smartCardHelper.sendApdu(ApduCommand(
            cla: SmartCardConstant.walletCla,
            ins: SmartCardConstant.changePass,
            p1: 0,
            p2: 0,
            data: data));
        if (res?.sw[0] == SmartCardConstant.success) {
          injector.get<LogUtils>().logI('Change pass success');
          Get.snackbar('', 'change_pin_success_message'.tr,
              colorText: Colors.white, backgroundColor: Colors.green[400]);
        }
      } else {
        injector.get<LogUtils>().logI('Change pass failed');
        Get.snackbar('', 'change_pin_failed_message'.tr,
            colorText: Colors.white, backgroundColor: Colors.red[400]);
      }
    }
  }
}
