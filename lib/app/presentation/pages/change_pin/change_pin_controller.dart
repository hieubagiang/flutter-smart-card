import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_card/app/common/extension/extensions.dart';
import 'package:smart_card/app/common/utils/colors_utils.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../common/utils/styles.dart';
import '../../../data/models/apdu_command_model.dart';
import '../../../widgets/custom_button.dart';

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
    if (newPinTextCtrl.text != confirmNewPinTextCtrl.text) {
      _showErrorMessage("Mã pin mới phải trùng nhau");
      return;
    }
    if (currentPinTextCtrl.text == newPinTextCtrl.text) {
      _showErrorMessage("Mã pin mới không được giống mã pin cũ");
      return;
    }
    final verifyRes = (await smartCardHelper
        .sendApdu(ApduCommand(
            cla: SmartCardConstant.walletCla,
            ins: SmartCardConstant.verify,
            p1: 0,
            p2: 0,
            data: currentPinTextCtrl.text.codeUnits))
        .withProgressDialog());
    if (verifyRes?.sw[0] != SmartCardConstant.success) {
      if (verifyRes?.sn[0] == 0) {
        _showErrorMessage("Thẻ đã bị khoá");
      } else {
        _showErrorMessage(
            "Mã pin cũ không đúng, số lần thử còn lại ${verifyRes?.sn[0]}");
      }
      return;
    }
    bool verify = verifyRes?.sn[0] == 0x01;

    if (!verify) {
      _showErrorMessage("Mã pin cũ không đúng");
      return;
    }
    final res = await smartCardHelper
        .sendApdu(ApduCommand(
            cla: SmartCardConstant.walletCla,
            ins: SmartCardConstant.changePass,
            p1: 0,
            p2: 0,
            data: newPinTextCtrl.text.codeUnits))
        .withProgressDialog();
    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Change pass success');
      Get.snackbar('', 'Đổi mật khẩu thành công'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
    }
  }

  Future<dynamic> _showErrorMessage(String errorMessage) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Lỗi",
            style: StyleUtils.style24Medium,
          ),
          content: Text(
            errorMessage,
            style: StyleUtils.style18Normal.copyWith(color: Colors.black),
          ),
          actions: <Widget>[
            CustomButton(
              label: 'Đóng',
              onTap: () => Navigator.of(context).pop(),
              bgColor: ColorUtils.primaryColor,
            )
          ],
        );
      },
    );
  }
}
