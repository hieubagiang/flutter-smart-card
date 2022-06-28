import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../data/gender_enum.dart';

class TaxDeclarationController extends BaseController {
  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;
  TextEditingController taxIdTextCtrl = TextEditingController();
  TextEditingController fullNameTextCtrl =
      TextEditingController(text: 'Phạm Doãn Hiếu');
  TextEditingController birthDayTextCtrl = TextEditingController();
  TextEditingController sexTextCtrl = TextEditingController();
  TextEditingController incomeTextCtrl =
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
    _fillData();
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

  void _fillData() {
    taxIdTextCtrl.text = '123456789';
    fullNameTextCtrl.text = 'Phạm Doãn Hiếu';
    birthDayTextCtrl.text = '01/01/2000';
    sexTextCtrl.text = 'Nam';
    incomeTextCtrl.text = '1'.padLeft(9, '0');
    placeOfResidenceTextCtrl.text = 'Hà Nội';
  }
}
