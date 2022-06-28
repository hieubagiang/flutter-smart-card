import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../data/gender_enum.dart';

class RegistrationTaxController extends BaseController {
  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;
  TextEditingController taxtIdTextCtrl = TextEditingController();
  TextEditingController fullNameTextCtrl =
      TextEditingController(text: 'Phạm Doãn Hiếu');
  TextEditingController birthDayTextCtrl = TextEditingController();
  TextEditingController sexTextCtrl = TextEditingController();
  TextEditingController citizenCardId =
      TextEditingController(text: '1'.padLeft(9, '0'));
  TextEditingController placeOfResidenceTextCtrl =
      TextEditingController(text: 'Hà Nội');
  Rx<DateTime?> selectedDate = Rx(null);
  Rx<GenderType> selectedGender = Rx(GenderType.male);
  bool verifyCardResult = true; //Mock Verify card
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  Rx<File?> selectAvatarFile = Rx(null);
  Rx<File?> selectFingerprintFile = Rx(null);

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

  Future<void> onSubmitRegistTax() async {}
}
