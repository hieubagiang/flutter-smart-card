import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';

import '../../../common/base/base_view_view_model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import 'change_pin_controller.dart';

class ChangePinScreen extends BaseView<ChangePinController> {
  const ChangePinScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'change_pin'.tr,
              style: StyleUtils.style36Bold,
            ),
            SizedBox(
              height: 24.h,
            ),
            Flexible(
              child: Container(
                width: 0.4.sw,
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
                      title: 'current_pin'.tr,
                      titleStyle: StyleUtils.style18Normal
                          .copyWith(color: Colors.black),
                      isSecure: true,
                      controller: controller.currentPinTextCtrl,
                    ),
                    CustomTextField(
                      title: 'new_pin'.tr,
                      titleStyle: StyleUtils.style18Normal
                          .copyWith(color: Colors.black),
                      isSecure: true,
                      controller: controller.newPinTextCtrl,
                    ),
                    CustomTextField(
                      title: 'confirm_new_pin'.tr,
                      titleStyle: StyleUtils.style18Normal
                          .copyWith(color: Colors.black),
                      isSecure: true,
                      controller: controller.confirmNewPinTextCtrl,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        label: 'change_pin'.tr,
                        onTap: controller.onSubmitChangePin,
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
    );
  }
}
