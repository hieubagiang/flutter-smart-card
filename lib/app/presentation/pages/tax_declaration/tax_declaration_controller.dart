import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_card/app/common/extension/extensions.dart';
import 'package:smart_card/app/data/request/tax_declare_request.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../data/gender_enum.dart';
import '../../../data/models/user_model.dart';
import '../../../data/provider/api.dart';
import '../../../widgets/dialogs_widget/error_dialog.dart';
import '../main/main_controller.dart';

class TaxDeclarationController extends BaseController {
  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;
  TextEditingController fullNameTextCtrl = TextEditingController();
  TextEditingController taxIdTextCtrl = TextEditingController();
  TextEditingController totalTaxTextCtrl = TextEditingController();
  TextEditingController insuranceDeduction = TextEditingController();
  TextEditingController incomeTextCtrl = TextEditingController();
  TextEditingController deductionTextCtrl = TextEditingController();
  Rx<DateTime?> selectedDate = Rx(null);
  Rx<GenderType> selectedGender = Rx(GenderType.male);
  bool verifyCardResult = true; //Mock Verify card
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  Rx<File?> selectAvatarFile = Rx(null);
  Rx<File?> selectFingerprintFile = Rx(null);
  Rx<UserModel?> user = Get.find<MainController>().user;
  final api = injector.get<Api>();
  @override
  Future<void> onInit() async {
    super.onInit();
    user.stream.listen((event) {
      _fillData();
    });

    incomeTextCtrl.addListener(() {
      _calculateTax();
    });
    deductionTextCtrl.addListener(() {
      _calculateTax();
    });
    insuranceDeduction.addListener(() {
      _calculateTax();
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

  Future<void> onSubmitDeclare() async {
    api.declareTax(
      identificationId: user.value!.cardId!,
      taxDeclareRequest: TaxDeclareRequest(
        totalTax: totalTaxTextCtrl.text.toIntParse(),
        insuranceDeduction: deductionTextCtrl.text.toIntParse(),
        deduction: deductionTextCtrl.text.toIntParse() * 4400000,
        personalIncome: incomeTextCtrl.text.toIntParse(),
      ),
    );
    SmartDialog.show(builder: (context) {
      return CustomAlertDialog(
        title: 'Thông báo',
        content: 'Đăng ký thành công'.tr,
      );
    });
  }

  void _fillData() {
    taxIdTextCtrl.text = user.value?.cardId ?? '';
    fullNameTextCtrl.text = user.value?.fullName ?? '';
    totalTaxTextCtrl.text = '0';
    insuranceDeduction.text = '0';
    incomeTextCtrl.text = '0';
    deductionTextCtrl.text = '0';
  }

  void _calculateTax() {
    insuranceDeduction.text =
        (int.parse(incomeTextCtrl.text) * 10.5 / 100).toStringAsFixed(0);

    int thuNhapChiuThue = int.parse(incomeTextCtrl.text) -
        11000000 -
        int.parse(deductionTextCtrl.text) * 4400000 -
        int.parse(insuranceDeduction.text);
    double tax = 0;
    if (thuNhapChiuThue < 5000000 && thuNhapChiuThue > 0) {
      tax = 0.05 * thuNhapChiuThue;
    } else if (thuNhapChiuThue > 5000000 && thuNhapChiuThue < 10000000) {
      tax = 0.1 * thuNhapChiuThue - 250000;
    } else if (thuNhapChiuThue > 10000000 && thuNhapChiuThue < 18000000) {
      tax = 0.15 * thuNhapChiuThue - 0.75 * 1000000;
    } else if (thuNhapChiuThue > 18000000 && thuNhapChiuThue < 32 * 1000000) {
      tax = 0.20 * thuNhapChiuThue - 1.65 * 1000000;
    } else if (thuNhapChiuThue > 32 * 1000000 &&
        thuNhapChiuThue < 52 * 1000000) {
      tax = 0.25 * thuNhapChiuThue - 3.25 * 1000000;
    } else if (thuNhapChiuThue > 52 * 1000000 &&
        thuNhapChiuThue < 80 * 1000000) {
      tax = 0.30 * thuNhapChiuThue - 5.85 * 1000000;
    } else if (thuNhapChiuThue > 80 * 1000000) {
      tax = 0.35 * thuNhapChiuThue - 9.85 * 1000000;
    }

    totalTaxTextCtrl.text = tax > 0 ? tax.toStringAsFixed(0) : 0.toString();
    print('${totalTaxTextCtrl.text}');
  }
}
