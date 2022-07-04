import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';

import '../../../common/base/base_view_view_model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import 'registration_tax_controller.dart';

class RegistrationTaxScreen extends BaseView<RegistrationTaxController> {
  const RegistrationTaxScreen({Key? key}) : super(key: key);

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
                'Thông tin mã số thuế'.tr,
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
                      CustomTextField(
                        title: 'Người nộp thuế'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.fullNameTextCtrl,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        isEnable: false,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Mã số thuế'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.taxtIdTextCtrl,
                        isEnable: true,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Số CMND'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.citizenCardId,
                        isEnable: false,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Địa chỉ'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.placeOfResidenceTextCtrl,
                        isEnable: false,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'Tự động thanh toán: ',
                            style: StyleUtils.style18Normal
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(width: 8.w),
                          Obx(() {
                            return Switch(
                              value: controller.user.value?.autoPay ?? false,
                              activeColor: ColorUtils.primaryColor,
                              onChanged: (value) {
                                controller.user.value =
                                    controller.user.value?.copyWith(
                                  autoPay: value,
                                );
                              },
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 0.1.sw,
                        child: CustomButton(
                          label: 'Cập nhật'.tr,
                          onTap: controller.onSubmitRegistTax,
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
