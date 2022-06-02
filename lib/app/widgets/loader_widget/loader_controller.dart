import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base/base_common_widgets.dart';
import '../../common/utils/utils.dart';

class CommonController extends GetxController with BaseCommonWidgets {
  RxBool isLoading = RxBool(false);
  RxBool isShowDialog = RxBool(false);
  RxBool isTopLoading = RxBool(true);
  RxList<Widget> dialogQueue = RxList.empty();

  void startLoading({Function? onTimeOut}) {
    isLoading.value = true;
    timer = FunctionUtils.startTimer(
        duration: const Duration(seconds: 5),
        onTimeOut: () {
          hideLoading();
          onTimeOut?.call();
        });
    FunctionUtils.logWhenDebug(this, 'Start Loading');
  }

  void stopLoading() {
    isLoading.value = false;
    hideLoading();
    FunctionUtils.logWhenDebug(this, 'Stop Loading');
  }

  Future<dynamic> showDialog({
    required Widget dialog,
    Function()? onSubmitted,
  }) async {
    if (isLoading.isTrue) {
      stopLoading();
    }
    final result = await FunctionUtils.showDialogCustom(
        context: Get.context!, dialog: dialog);
    return result;
  }

  void hideLoading() {
    timer?.cancel();
  }
}
