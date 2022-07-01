import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_card/app/common/extension/extensions.dart';
import 'package:smart_card/app/data/models/user_model.dart';
import 'package:smart_card/app/data/provider/api.dart';
import 'package:smart_card/app/routes/app_pages.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../data/models/apdu_command_model.dart';
import '../profile/profile_controller.dart';

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
  Rx<UserModel?> user = Rx(null);
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  RxBool isSignUp = false.obs;
  Api api = injector.get<Api>();
  Timer? timer;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(
        vsync: this,
        length: 4,
        initialIndex: 0,
        animationDuration: Duration.zero)
      ..addListener(() {
        onChangeTab(tabController.index);
      });
    isSignUp.value = (Get.arguments as ProfileArgs?)?.isSignUp ?? false;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    if (isSignUp.isFalse) {
      await getCardInfo();
      await _getProfileAPI();
      timer = Timer.periodic(
          const Duration(seconds: 3), (Timer t) => _getProfileAPI());
    }

    // commonController.startLoading();
  }

  void handleIndexChanged(int index) {
    selectedIndex.value = index;
  }

  // RxBool isSelected(int index) {
  //   return RxBool(index == tabController.index);
  // }
  Future<void> setIsSignUp(bool value) async {
    isSignUp.value = value;
    await getCardInfo();

    timer = Timer.periodic(
        const Duration(seconds: 3), (Timer t) => _getProfileAPI());
  }

  void onChangeTab(int value) {
    selectedIndex.value = value;
  }

  @override
  Future<void> onResumed() async {
    super.onResumed();
  }

  @override
  Future<void> onClose() async {
    timer?.cancel();

    super.onClose();
  }

  void onTapChangePin() {}

  void logout() {
    injector.get<SmartCardHelper>().disconnect();
    Get.offAllNamed(RouteList.connectCard);
  }

  Future<void> getCardInfo() async {
    // await smartCardHelper.sendApdu(ApduCommand(
    //     cla: SmartCardConstant.walletCla,
    //     ins: SmartCardConstant.verify,
    //     p1: 0,
    //     p2: 0,
    //     data: '1234'.codeUnits));

    final res = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.insGetCardData,
        p1: 0,
        p2: 0));

    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('getCardInfo successful');
      user.value = UserModel.fromRaw(utf8.decode(res!.sn));

      ///call api
      _getProfileAPI();
    } else {
      injector.get<LogUtils>().logI('failed');
      Get.snackbar('', 'failed_message'.tr,
          colorText: Colors.white, backgroundColor: Colors.red[400]);
    }
  }

  Future<void> _getProfileAPI() async {
    if (user.value?.cardId == null) return;
    try {
      final getProfileRes =
          await api.getProfile(identificationId: user.value!.cardId!);
      final userRes =
          UserModel.fromJson(getProfileRes.data as Map<String, dynamic>);
      print('${userRes.toJson()}');
      _notifyAmountChangeWithOther(user.value!, userRes);
      user.value = user.value?.copyWith(
          fullName: userRes.fullName,
          amount: userRes.amount,
          debt: userRes.debt);
    } on Exception catch (e) {
      print('${e.toString()}');
    }
  }

  void _notifyAmountChangeWithOther(UserModel currentUser, UserModel userRes) {
    final change = userRes.amount - currentUser.amount;

    /* if (currentUser.debt > userRes.debt) {
      Get.snackbar('Thông báo', 'Nộp thuế thành công'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
      return;
    }*/
    if (currentUser.amount != userRes.amount) {
      Get.snackbar(
          'Thông báo',
          'Số dư tài khoản thay đổi: ${change.formatCurrency}\nSố dư mới: ${userRes.amount.formatCurrency}'
              .tr,
          colorText: Colors.white,
          backgroundColor: Colors.green[400]);
    }
  }
}
