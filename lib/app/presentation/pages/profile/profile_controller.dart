import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../data/gender_enum.dart';
import '../../../data/models/apdu_command_model.dart';
import '../../../data/models/user_model.dart';

class ProfileController extends BaseController {
  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;
  TextEditingController cardIdTextCtrl = TextEditingController(text: '1'.padLeft(9, '0'));
  TextEditingController fullNameTextCtrl = TextEditingController(text: 'Phạm Doãn Hiếu');
  TextEditingController nationalityTextCtrl = TextEditingController(text: 'Việt Nam');
  TextEditingController placeOfOriginTextCtrl = TextEditingController(text: 'Hà TĨnh');
  TextEditingController placeOfResidenceTextCtrl = TextEditingController(text: 'Hà Nội');
  TextEditingController personalIdentificationTextCtrl = TextEditingController(text: 'Nốt ruồi dưới cằm');
  TextEditingController releaseDateTextCtrl =
      TextEditingController(text: DateTimeUtils.getStringDate(DateTime.now(), pattern: Pattern.ddMMyyyy_vi));
  TextEditingController expireDateTextCtrl = TextEditingController(
      text:
          DateTimeUtils.getStringDate(DateTime.now().add(const Duration(days: 365 * 5)), pattern: Pattern.ddMMyyyy_vi));
  Rx<DateTime?> birthDay = Rx(DateTime.now());
  Rx<GenderType> selectedGender = Rx(GenderType.male);
  bool verifyCardResult = true; //Mock Verify card
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  Rx<File?> selectAvatarFile = Rx(null);
  Rx<File?> selectFingerprintFile = Rx(null);
  Rx<UserModel?> currentUser = Rx(null);
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    currentUser.value = await getCardInfo() ?? UserModel();
    if (currentUser.value != null) {
      _setModelToView(currentUser.value!);
    }
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

  Future<void> onSubmitProfile() async {
    final user = UserModel(
        cardId: cardIdTextCtrl.text,
        pin: '1234',
        avatarImage: FileUtils.base64EncodeFormat(selectAvatarFile.value!.readAsBytesSync()),
        fingerPrintImage: FileUtils.base64EncodeFormat(selectAvatarFile.value!.readAsBytesSync()),
        fullName: fullNameTextCtrl.text,
        placeOfResidence: placeOfResidenceTextCtrl.text,
        sex: selectedGender.value,
        nationality: nationalityTextCtrl.text,
        birthday: birthDay.value!,
        expiredDate: DateTimeUtils.getDateTime(expireDateTextCtrl.text, pattern: Pattern.ddMMyyyy_vi),
        releaseDate: DateTimeUtils.getDateTime(releaseDateTextCtrl.text, pattern: Pattern.ddMMyyyy_vi),
        personalIdentification: personalIdentificationTextCtrl.text,
        placeOfOrigin: placeOfOriginTextCtrl.text,
        amount: 0);
    List<int> data = utf8.encode(user.simplify());
    final verify = await smartCardHelper.sendApdu(
        ApduCommand(cla: SmartCardConstant.walletCla, ins: SmartCardConstant.signUpCard, p1: 0, p2: 0, data: data));
    if (verify?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Create profile successful');
      Get.snackbar('', 'Create profile successful'.tr, colorText: Colors.white, backgroundColor: Colors.green[400]);
      getCardInfo();
    } else {
      injector.get<LogUtils>().logI('failed');
      Get.snackbar('', 'failed_message'.tr, colorText: Colors.white, backgroundColor: Colors.red[400]);
    }
  }

  Future<void> selectBirthday() async {
    final date = await FunctionUtils.selectDate(Get.context!);
    currentUser.value = currentUser.value?.copyWith(birthday: date);
  }

  void onChangeGender(int? value) {
    selectedGender.value = GenderType.values[value ?? 0];
  }

  Future<UserModel?> getCardInfo() async {
    final res = await smartCardHelper
        .sendApdu(ApduCommand(cla: SmartCardConstant.walletCla, ins: SmartCardConstant.insGetCardData, p1: 0, p2: 0));
    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Create profile successful');
      Get.snackbar('', 'Create profile successful'.tr, colorText: Colors.white, backgroundColor: Colors.green[400]);
      return UserModel.fromRaw(utf8.decode(res!.sn));
      // ();
    } else {
      injector.get<LogUtils>().logI('failed');
      Get.snackbar('', 'failed_message'.tr, colorText: Colors.white, backgroundColor: Colors.red[400]);
    }
    return null;
  }

  void _setModelToView(UserModel currentUser) {
    cardIdTextCtrl.text = currentUser.cardId ?? '';
    fullNameTextCtrl.text = currentUser.fullName ?? '';
    birthDay.value = currentUser.birthday;
    nationalityTextCtrl.text = currentUser.nationality ?? '';
    placeOfOriginTextCtrl.text = currentUser.placeOfOrigin ?? '';
    placeOfResidenceTextCtrl.text = currentUser.placeOfResidence ?? '';
    placeOfOriginTextCtrl.text = currentUser.placeOfOrigin ?? '';
    selectedGender.value = currentUser.sex ?? GenderType.male;
  }
}
