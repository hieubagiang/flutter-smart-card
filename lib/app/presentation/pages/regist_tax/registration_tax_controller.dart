import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_card/app/data/provider/api.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../data/models/user_model.dart';
import '../main/main_controller.dart';

class RegistrationTaxController extends BaseController {
  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;
  TextEditingController taxtIdTextCtrl = TextEditingController();
  TextEditingController fullNameTextCtrl = TextEditingController();
  TextEditingController citizenCardId = TextEditingController();
  TextEditingController placeOfResidenceTextCtrl = TextEditingController();
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  Rx<File?> selectAvatarFile = Rx(null);
  Rx<File?> selectFingerprintFile = Rx(null);
  Rx<UserModel?> user = Get.find<MainController>().user;
  Api api = injector.get<Api>();
  @override
  Future<void> onInit() async {
    super.onInit();
    user.stream.listen((event) {
      _fillData();
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

  Future<void> onSubmitRegistTax() async {
    final res = await api.updateProfile(
        identificationId: citizenCardId.text,
        autoPay: '${user.value?.autoPay ?? false}');
    if (res.status ?? false) {
      Get.snackbar('Thành công', 'Cập nhật thông tin thành công'.tr,
          colorText: Colors.white, backgroundColor: Colors.green[400]);
      return;
    }
  }

  void _fillData() {
    fullNameTextCtrl.text = user.value?.fullName ?? '';
    citizenCardId.text = user.value?.cardId ?? '';
    taxtIdTextCtrl.text = user.value?.cardId ?? '';
    placeOfResidenceTextCtrl.text = user.value?.placeOfResidence ?? '';
  }
}
