import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
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
  RSAPublicKey? publicKey;
  bool verified = false;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // commonController.startLoading();
    // onSubmitLogin();
    // await StorageHelper.setPublicKey(String.fromCharCodes(res!.sn));
  }

  encodePublicKeyToPem(RSAPublicKey publicKey) {
    var algorithmSeq = new ASN1Sequence();
    var algorithmAsn1Obj = new ASN1Object.fromBytes(Uint8List.fromList(
        [0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
    var paramsAsn1Obj =
        new ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
    algorithmSeq.add(algorithmAsn1Obj);
    algorithmSeq.add(paramsAsn1Obj);

    var publicKeySeq = ASN1Sequence();
    publicKeySeq.add(ASN1Integer(publicKey.modulus));
    publicKeySeq.add(ASN1Integer(publicKey.exponent));
    var publicKeySeqBitString =
        ASN1BitString(stringValues: publicKeySeq.encodedBytes);

    var topLevelSeq = ASN1Sequence();
    topLevelSeq.add(algorithmSeq);
    topLevelSeq.add(publicKeySeqBitString);
    var dataBase64 = base64Encode(topLevelSeq.encodedBytes!);

    return """-----BEGIN PUBLIC KEY-----\r\n$dataBase64\r\n-----END PUBLIC KEY-----""";
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
