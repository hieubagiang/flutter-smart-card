import 'dart:async';
import 'dart:convert';

import 'package:basic_utils/basic_utils.dart' hide ColorUtils;
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_card/app/presentation/pages/profile/profile_controller.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../common/utils/utils.dart';
import '../../../data/models/apdu_command_model.dart';
import '../../../data/provider/api.dart';
import '../../../data/request/login_request.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_button.dart';

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
  RSAPublicKey? publicKey;
  bool verified = false;
  bool isCreatedProfile = false;
  bool isCreatedPublicKey = false;
  final api = injector.get<Api>();
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    SmartDialog.showLoading();
    // onSubmitLogin();
    isCreatedProfile = await _checkInitCardData();
    isCreatedPublicKey = await getPublicKey();
    if (!isCreatedPublicKey) {
      await getPublicKey();
    }
    SmartDialog.dismiss();
    if (!isCreatedProfile) {
      Get.offAllNamed(RouteList.main,
          arguments: ProfileArgs(
              isSignUp: true,
              publicKey: CryptoUtils.encodeRSAPublicKeyToPemPkcs1(publicKey!)));
    }
  }

  Future<bool> getPublicKey() async {
    final exponentBytes = (await smartCardHelper.sendApdu(ApduCommand(
      cla: SmartCardConstant.walletCla,
      ins: SmartCardConstant.getExponent,
      p1: 0,
      p2: 0,
    )))
        ?.sn;

    final modulusBytes = (await smartCardHelper.sendApdu(ApduCommand(
      cla: SmartCardConstant.walletCla,
      ins: SmartCardConstant.getModulus,
      p1: 0,
      p2: 0,
    )))
        ?.sn;
    if ((exponentBytes?.isEmpty ?? false) || (modulusBytes?.isEmpty ?? false)) {
      return false;
    }

    ///TODO Call API to sav e public key
    final modulus = decodeBigInt(modulusBytes ?? []);
    final exponent = decodeBigInt(exponentBytes ?? []);

    publicKey = RSAPublicKey(modulus, exponent);
    return true;
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
    // bool verifySign = await verifyCardRsa();
    bool verifySign = await verifyCardRsa();
    if (!verifySign) {
      Get.snackbar('', 'Xác thực thẻ thất bại'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
      return;
    }
    List<int> data = pinTextCtrl.text.codeUnits;
    final res = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.verify,
        p1: 0,
        p2: 0,
        data: data));

    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Verify success');
      Get.offAllNamed(RouteList.main,
          arguments: ProfileArgs(
              isSignUp: false,
              publicKey: CryptoUtils.encodeRSAPublicKeyToPemPkcs1(publicKey!)));
    } else {
      if (res?.sn[0] == 0) {
        _showErrorMessage("Thẻ đã bị khoá");
      } else {
        Get.snackbar(
            '', 'Mã pin cũ không đúng, số lần thử còn lại ${res?.sn[0]}'.tr,
            colorText: Colors.white, backgroundColor: Colors.red[400]);
      }
      return;
    }
  }

  Future<void> unlockCard() async {
    if (count == 0) {
      Get.snackbar('', 'Thẻ bị khoá'.tr,
          colorText: Colors.white, backgroundColor: Colors.red[400]);
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
          colorText: Colors.white, backgroundColor: Colors.red[400]);
    }
  }

  Future<bool> verifyCardRsa() async {
    final data = randomString(8).codeUnits;
    final signature = (await smartCardHelper.sendApdu(ApduCommand(
            cla: SmartCardConstant.walletCla,
            ins: SmartCardConstant.signRsa,
            p1: 0,
            p2: 0,
            data: data)))
        ?.sn;
    //
    // verified = CryptoUtils.rsaVerify(
    //     publicKey!, Uint8List.fromList(data), Uint8List.fromList(signature!),
    //     algorithm: 'SHA-1/RSA');
    final res = await api.login(
        loginRequest: LoginRequest(
            secretMessage: String.fromCharCodes(data),
            signature: base64Encode(signature!)));
    print('data: ${String.fromCharCodes(data)}');
    print('publicKey: ${CryptoUtils.encodeRSAPublicKeyToPemPkcs1(publicKey!)}');
    print('signature: ${base64Encode(signature)}');
    return res.status ?? false;
  }

  Future<bool> _checkInitCardData() async {
    final res = await smartCardHelper.sendApdu(ApduCommand(
      cla: SmartCardConstant.walletCla,
      ins: SmartCardConstant.isInitData,
      p1: 0,
      p2: 0,
    ));
    return res?.sn[0] == 1;
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
