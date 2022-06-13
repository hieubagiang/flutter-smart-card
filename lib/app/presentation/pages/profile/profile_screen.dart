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
      body: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'profile'.tr,
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
                                  file: controller.selectAvatarFile.value,
                                  onTap: () async {
                                    controller.selectAvatarFile.value =
                                        await FileUtils
                                            .chooseImageWithFilePicker();
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        title: 'Số CCCD'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.cardIdTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
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
                        child: CustomTextField(
                          title: 'Ngày sinh'.tr,
                          titleStyle: StyleUtils.style18Normal
                              .copyWith(color: Colors.black),
                          isEnable: false,
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 16.w),
                          controller: controller.birthDayTextCtrl,
                        ),
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
                                  file: controller.selectFingerprintFile.value,
                                  onTap: () async {
                                    controller.selectFingerprintFile.value =
                                        await FileUtils
                                            .chooseImageWithFilePicker();
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
                        controller: controller.releaseDateTextCtrl,
                        isEnable: false,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
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
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 0.1.sw,
                        child: CustomButton(
                          label: 'sign_in'.tr,
                          onTap: controller.onSubmitProfile,
                          labelstyle: StyleUtils.style18Normal
                              .copyWith(color: Colors.white),
                          bgColor: ColorUtils.primaryColor,
                        ),
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
