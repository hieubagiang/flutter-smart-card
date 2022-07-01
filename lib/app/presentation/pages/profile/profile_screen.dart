import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';
import 'package:smart_card/app/data/gender_enum.dart';
import 'package:smart_card/app/widgets/custom_avatar.dart';

import '../../../../gen/assets.gen.dart';
import '../../../common/base/base_view_view_model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/item_radio_button_group.dart';
import 'profile_controller.dart';

class ProfileScreen extends BaseView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 870.w,
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: (Colors.grey[300])!),
              color: Colors.grey[100],
            ),
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thông tin định danh',
                  style: StyleUtils.style28Medium,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 216.w,
                      child: Text(
                        'Thông tin định danh',
                        style: StyleUtils.style20Normal
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    TextButton(
                        child: Text('Sửa', style: StyleUtils.style20Medium),
                        onPressed: () {
                          Get.dialog(EditProfileDialog());
                        }),
                  ],
                ),
                const Divider(
                  color: ColorUtils.borderColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Obx(() {
                  return _rowInfo('Họ và tên',
                      controller.currentUser.value?.fullName ?? '');
                }),
                Obx(() {
                  return _rowInfo(
                      'Số CCCD', controller.currentUser.value?.cardId ?? '');
                }),
                Obx(() {
                  return _rowInfo(
                      'Ngày sinh',
                      DateTimeUtils.getStringDate(
                              controller.currentUser.value?.birthday,
                              pattern: Pattern.ddMMyyyy_vi) ??
                          '');
                }),
                Obx(() {
                  return _rowInfo('Giới tính',
                      controller.currentUser.value?.sex?.label ?? '');
                }),
                Obx(() {
                  return _rowInfo('Quốc tịch',
                      controller.currentUser.value?.national ?? '');
                }),
                Obx(() {
                  return _rowInfo('Quê quán',
                      controller.currentUser.value?.placeOfOrigin ?? '');
                }),
                Obx(() {
                  return _rowInfo('Địa chỉ thường trú',
                      controller.currentUser.value?.placeOfResidence ?? '');
                }),
                Obx(() {
                  return _rowInfo(
                      'Đặc điểm nhận dạng',
                      controller.currentUser.value?.personalIdentification ??
                          '');
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowInfo(String label, String value) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 34.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 214.w,
            child: Text(
              label,
              style: StyleUtils.style18Normal.copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: StyleUtils.style18Medium.copyWith(color: Colors.black),
            ),
          ),
          SizedBox(
            width: 50.w,
          )
        ],
      ),
    );
  }
}

class EditProfileDialog extends StatelessWidget {
  EditProfileDialog({
    Key? key,
  }) : super(key: key);

  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 870.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                controller.shouldOpenProfile.isTrue
                    ? 'Đăng ký'
                    : 'Cập nhật thông tin'.tr,
                style: StyleUtils.style36Bold,
              ),
              SizedBox(
                height: 24.h,
              ),
              Flexible(
                child: Container(
                  width: 0.8.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorUtils.borderColor),
                      borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(
                      horizontal: SpaceUtils.spaceMedium * 2,
                      vertical: SpaceUtils.spaceMedium),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text('Ảnh: ', style: StyleUtils.style18Normal),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Obx(() {
                                return CustomAvatar(
                                  fullName: 'Avatar',
                                  sizeAvatar: 120.w,
                                  showCameraIcon: true,
                                  memoryImage:
                                      controller.currentUser.value?.avatarImage,
                                  file: controller.selectAvatarFile.value,
                                  onTap: () async {
                                    controller.selectAvatarFile.value =
                                        await FileUtils
                                            .chooseImageWithFilePicker();
                                    controller.currentUser.value =
                                        controller.currentUser.value?.copyWith(
                                      avatarImage:
                                          await FileUtils.getBase64FromFile(
                                              controller
                                                  .selectAvatarFile.value!),
                                    );
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      Obx(() {
                        return controller.shouldOpenProfile.isTrue
                            ? const SizedBox()
                            : CustomTextField(
                                title: 'Số CCCD'.tr,
                                titleStyle: StyleUtils.style18Normal
                                    .copyWith(color: Colors.black),
                                controller: controller.cardIdTextCtrl,
                                isEnable: false,
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                              );
                      }),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Họ và tên'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.fullNameTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: controller.selectBirthday,
                        child: Obx(() {
                          return CustomTextField(
                            title: 'Ngày sinh'.tr,
                            titleStyle: StyleUtils.style18Normal
                                .copyWith(color: Colors.black),
                            isEnable: false,
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 16.w),
                            hintText: DateTimeUtils.getStringDate(
                                    controller.birthDay.value,
                                    pattern: Pattern.ddMMyyyy_vi) ??
                                '',
                            hintTextColor: Colors.black,
                          );
                        }),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'Giới tính: ',
                            style: StyleUtils.style18Normal
                                .copyWith(color: Colors.black),
                          ),
                          Obx(() {
                            return RadioButtonGroup(
                              items: GenderTypeEnum.labels,
                              initialIndex:
                                  controller.selectedGender.value.index,
                              onChanged: (int? value) {
                                controller.onChangeGender(value);
                              },
                            );
                          })
                        ],
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Quê quán'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.placeOfOriginTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Quốc tịch'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.nationalityTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Nơi thường trú'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.placeOfResidenceTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text('Vân tay: ',
                              style: StyleUtils.style18Normal
                                  .copyWith(color: Colors.black)),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Obx(() {
                                return CustomAvatar(
                                  sizeAvatar: 120.w,
                                  showCameraIcon: true,
                                  assetWidget: Assets.svgs.icFingerprint.svg(),
                                  memoryImage: controller
                                      .currentUser.value?.fingerPrintImage,
                                  file: controller.selectFingerprintFile.value,
                                  onTap: () async {
                                    controller.selectFingerprintFile.value =
                                        await FileUtils
                                            .chooseImageWithFilePicker();
                                    controller.currentUser.value =
                                        controller.currentUser.value?.copyWith(
                                      fingerPrintImage:
                                          await FileUtils.getBase64FromFile(
                                              controller.selectFingerprintFile
                                                  .value!),
                                    );
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        title: 'Đặc điểm nhận dạng'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.personalIdentificationTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Ngày cấp'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        isEnable: false,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        hintTextColor: Colors.black,
                        hintText: controller.releaseDateTextCtrl.text,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Ngày hết hạn'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        isEnable: false,
                        controller: controller.expireDateTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        hintTextColor: Colors.black,
                        hintText: DateTimeUtils.getStringDate(
                            controller.currentUser.value?.expiredDate,
                            pattern: Pattern.ddMMyyyy_vi),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 0.1.sw,
                        child: Obx(() {
                          return CustomButton(
                            label: controller.shouldOpenProfile.isTrue
                                ? 'sign_in'.tr
                                : 'update'.tr,
                            onTap: () {
                              if (controller.shouldOpenProfile.isTrue) {
                                controller.onSubmitProfile();
                              } else {
                                controller.editProfile();
                              }
                            },
                            labelstyle: StyleUtils.style18Normal
                                .copyWith(color: Colors.white),
                            bgColor: ColorUtils.primaryColor,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
