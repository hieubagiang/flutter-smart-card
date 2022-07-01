import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_card/app/common/extension/extensions.dart';
import 'package:smart_card/app/common/utils/utils.dart';
import 'package:smart_card/app/data/provider/api.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../common/utils/log_utils.dart';
import '../../../data/gender_enum.dart';
import '../../../data/models/apdu_command_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/response/base_response.dart';
import '../../../data/response/sign_up_response.dart';
import '../../../widgets/dialogs_widget/error_dialog.dart';
import '../../../widgets/new_dialog/alert_dialog.dart';
import '../main/main_controller.dart';

class ProfileArgs {
  final String? publicKey;
  final bool? isSignUp;

  ProfileArgs({this.publicKey, this.isSignUp});
}

class ProfileController extends BaseController {
  RxBool isInitDone = false.obs;
  TextEditingController cardIdTextCtrl = TextEditingController();
  TextEditingController fullNameTextCtrl = TextEditingController();
  TextEditingController nationalityTextCtrl = TextEditingController();
  TextEditingController placeOfOriginTextCtrl = TextEditingController();
  TextEditingController placeOfResidenceTextCtrl = TextEditingController();
  TextEditingController personalIdentificationTextCtrl =
      TextEditingController();
  TextEditingController releaseDateTextCtrl = TextEditingController(
      text: DateTimeUtils.getStringDate(DateTime.now(),
          pattern: Pattern.ddMMyyyy_vi));
  TextEditingController expireDateTextCtrl = TextEditingController(
      text: DateTimeUtils.getStringDate(
          DateTime.now().add(const Duration(days: 365 * 5)),
          pattern: Pattern.ddMMyyyy_vi));
  Rx<DateTime?> birthDay = Rx(DateTime.now());
  Rx<GenderType> selectedGender = Rx(GenderType.male);
  bool verifyCardResult = true; //Mock Verify card
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  Rx<File?> selectAvatarFile = Rx(null);
  Rx<File?> selectFingerprintFile = Rx(null);
  Rx<UserModel?> currentUser = Rx(null);
  RxBool shouldOpenProfile = Get.find<MainController>().isSignUp;
  final Api api = Get.find<Api>();
  ProfileArgs? args = Get.arguments as ProfileArgs?;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    currentUser.value = await getCardInfo();
    if (currentUser.value != null) {
      _setModelToView(currentUser.value!);
    } else {}
    // commonController.startLoading();
  }

  // RxBool isSelected(int index) {
  //   return RxBool(index == tabController.index);
  // }

  @override
  Future<void> onResumed() async {
    super.onResumed();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  Future<void> onSubmitProfile() async {
    if (shouldOpenProfile.value) {
      currentUser.value = UserModel();
    }
    await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.verify,
        p1: 0,
        p2: 0,
        data: '1234'.codeUnits));

    currentUser.value = currentUser.value?.copyWith(
        cardId: cardIdTextCtrl.text,
        avatarImage: selectAvatarFile.value == null
            ? null
            : await FileUtils.getBase64FromFile(selectAvatarFile.value!),
        fingerPrintImage: selectFingerprintFile.value == null
            ? null
            : await FileUtils.getBase64FromFile(selectFingerprintFile.value!),
        fullName: fullNameTextCtrl.text,
        placeOfResidence: placeOfResidenceTextCtrl.text,
        sex: selectedGender.value,
        nationality: nationalityTextCtrl.text,
        birthday: birthDay.value!,
        expiredDate: DateTimeUtils.getDateTime(expireDateTextCtrl.text,
            pattern: Pattern.ddMMyyyy_vi),
        releaseDate: DateTimeUtils.getDateTime(releaseDateTextCtrl.text,
            pattern: Pattern.ddMMyyyy_vi),
        personalIdentification: personalIdentificationTextCtrl.text,
        placeOfOrigin: placeOfOriginTextCtrl.text,
        amount: 0);
    final SignUpResponse res = await api.signUp(
      avatarImage: selectAvatarFile.value!,
      avatarFingerImage: selectFingerprintFile.value!,
      sex: currentUser.value!.sex!.id,
      cardId: randomString(8),
      personalIdentification: currentUser.value!.personalIdentification!,
      placeOfOrigin: 'Hà Nội', //100%
      publicKey: args!.publicKey!,
      autoPay: false,
      fullName: currentUser.value!.fullName!,
      birthday: currentUser.value!.birthday!.toDateTimeString(),
      national: currentUser.value!.national!,
      address: currentUser.value!.placeOfResidence!,
      releaseDate: currentUser.value!.releaseDate!.toDateTimeString(),
      expiredDate: currentUser.value!.expiredDate!.toDateTimeString(),
    );
    print('${res.data?.identificationId}');
    currentUser.value =
        currentUser.value?.copyWith(cardId: res.data?.identificationId);
    List<int> data = utf8.encode(currentUser.value!.simplify());

    final signUpRes = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.signUpCard,
        p1: 0,
        p2: 0,
        data: data));
    if (signUpRes?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Create profile successful');
      if (shouldOpenProfile.isTrue) {
        await Get.dialog(AlertDialogCustom(
          title: 'Đăng ký thành công',
          description: 'Mật khẩu mặc định của thẻ là: 1234',
          onTap: () async {
            await Get.find<MainController>().setIsSignUp(false);
            shouldOpenProfile.value = false;
            Get.back();
          },
          context: Get.context!,
        ));

        _setModelToView(currentUser.value!);
      } else {
        Get.back();

        await Get.dialog(
          CustomAlertDialog(
              title: 'Thông báo',
              content: 'Cập nhật thành công',
              onTap: () {
                Get.back();
              }),
        );
      }
    } else {
      injector.get<LogUtils>().logI('failed');
      Get.snackbar('', 'failed_message'.tr,
          colorText: Colors.white, backgroundColor: Colors.red[400]);
    }
  }

  Future<void> selectBirthday() async {
    final date = await FunctionUtils.selectDate(Get.context!);
    birthDay.value = date;
    currentUser.value = currentUser.value?.copyWith(birthday: date);
  }

  void onChangeGender(int? value) {
    selectedGender.value = GenderType.values[value ?? 0];
  }

  Future<UserModel?> getCardInfo() async {
    final res = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.insGetCardData,
        p1: 0,
        p2: 0));
    if (res?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('getCardInfo successful');
      if (res?.sn.isEmpty ?? false) {
        return null;
      }
      return UserModel.fromRaw(utf8.decode(res!.sn));
      // ();
    } else {
      injector.get<LogUtils>().logI('failed');
    }
    return null;
  }

  Future<void> _setModelToView(UserModel currentUser) async {
    cardIdTextCtrl.text = currentUser.cardId ?? '';
    fullNameTextCtrl.text = currentUser.fullName ?? '';
    birthDay.value = currentUser.birthday;
    nationalityTextCtrl.text = currentUser.national ?? '';
    placeOfOriginTextCtrl.text = currentUser.placeOfOrigin ?? '';
    placeOfResidenceTextCtrl.text = currentUser.placeOfResidence ?? '';
    placeOfOriginTextCtrl.text = currentUser.placeOfOrigin ?? '';
    selectedGender.value = currentUser.sex ?? GenderType.male;
    personalIdentificationTextCtrl.text =
        currentUser.personalIdentification ?? '';
    // final avafile = File(await FileUtils.getFilePath(currentUser.avatarImage!));
    // final dataAva = await FileUtils.getXFileFromUrl(
    //     ApiConstant.baseImageUrl + currentUser.avatarImage!);
    // avafile.writeAsBytesSync(await dataAva.readAsBytes());
    // selectAvatarFile.value = avafile;
    // final finFile =
    //     File(await FileUtils.getFilePath(currentUser.fingerPrintImage!));
    // final dataFin = await FileUtils.getXFileFromUrl(
    //     ApiConstant.baseImageUrl + currentUser.fingerPrintImage!);
    // finFile.writeAsBytesSync(await dataFin.readAsBytes());
    // selectAvatarFile.value = avafile;
  }

  Future<void> editProfile() async {
    if (shouldOpenProfile.value) {
      currentUser.value = UserModel();
    }
    currentUser.value = currentUser.value?.copyWith(
      cardId: cardIdTextCtrl.text,
      avatarImage: selectAvatarFile.value == null
          ? null
          : await FileUtils.getBase64FromFile(selectAvatarFile.value!),
      fingerPrintImage: selectFingerprintFile.value == null
          ? null
          : await FileUtils.getBase64FromFile(selectFingerprintFile.value!),
      fullName: fullNameTextCtrl.text,
      placeOfResidence: placeOfResidenceTextCtrl.text,
      sex: selectedGender.value,
      nationality: nationalityTextCtrl.text,
      birthday: birthDay.value!,
      expiredDate: DateTimeUtils.getDateTime(expireDateTextCtrl.text,
          pattern: Pattern.ddMMyyyy_vi),
      releaseDate: DateTimeUtils.getDateTime(releaseDateTextCtrl.text,
          pattern: Pattern.ddMMyyyy_vi),
      personalIdentification: personalIdentificationTextCtrl.text,
      placeOfOrigin: placeOfOriginTextCtrl.text,
    );
    final BaseResponse res = await api.updateProfile(
      identificationId: currentUser.value!.cardId!,
      avatarImage: selectAvatarFile.value == null
          ? ''
          : await FileUtils.getBase64FromFile(selectAvatarFile.value!),
      avatarFingerImage: selectAvatarFile.value == null
          ? ''
          : await FileUtils.getBase64FromFile(selectFingerprintFile.value!),
      sex: '${currentUser.value?.sex?.id ?? ''}',
      personalIdentification: currentUser.value?.personalIdentification ?? '',
      placeOfOrigin: currentUser.value!.placeOfOrigin ?? '', //100%
      autoPay: '${currentUser.value?.autoPay ?? false}',
      fullName: currentUser.value?.fullName ?? '', //100%
      birthday: currentUser.value?.birthday?.toDateTimeString() ?? '',
      national: currentUser.value?.national ?? '', //100%
      address: currentUser.value?.placeOfResidence ?? '', //100%
      releaseDate:
          currentUser.value?.releaseDate?.toDateTimeString() ?? '', //100%
      expiredDate:
          currentUser.value?.expiredDate?.toDateTimeString() ?? '', //100%
    );

    List<int> data = utf8.encode(currentUser.value!.simplify());

    final signUpRes = await smartCardHelper.sendApdu(ApduCommand(
        cla: SmartCardConstant.walletCla,
        ins: SmartCardConstant.signUpCard,
        p1: 0,
        p2: 0,
        data: data));

    if (signUpRes?.sw[0] == SmartCardConstant.success) {
      injector.get<LogUtils>().logI('Create profile successful');
      if (shouldOpenProfile.isTrue) {
      } else {
        Get.back();

        await Get.dialog(
          CustomAlertDialog(
              title: 'Thông báo',
              content: 'Cập nhật thành công',
              onTap: () {
                Get.back();
              }),
        );
        Get.find<MainController>().user.value = currentUser.value;
      }
    } else {
      injector.get<LogUtils>().logI('failed');
      Get.snackbar('', 'failed_message'.tr,
          colorText: Colors.white, backgroundColor: Colors.red[400]);
    }
  }
}
