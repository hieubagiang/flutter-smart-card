import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../routes/app_pages.dart';

class CardConnectController extends BaseController {
  RxBool isInitDone = false.obs;

  var isFirst = true;
  RxBool isConnected = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // commonController.startLoading();
  }

  @override
  Future<void> onResumed() async {
    super.onResumed();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  Future<void> onSubmitCardConnect() async {
    final success = await injector.get<SmartCardHelper>().getCardSerialNumber();
    if (success) {
      Get.toNamed(RouteList.signIn);
    }
  }

  void onSubmitCardCo51nnect() {}
}
