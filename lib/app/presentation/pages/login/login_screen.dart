import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';

import '../../../common/base/base_view_view_model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import 'login_controller.dart';

class LoginScreen extends BaseView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Căn cước công dân',
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
                    Text(
                      'login'.tr,
                      style: StyleUtils.style18Bold.copyWith(
                          fontSize: 26.sp,
                          height: 1.3,
                          color: ColorUtils.primaryTextColor),
                    ),
                    CustomTextField(
                      title: 'pin'.tr,
                      titleStyle: StyleUtils.style18Normal
                          .copyWith(color: Colors.black),
                      isSecure: true,
                      controller: controller.pinTextCtrl,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                controller.unlockCard();
                              },
                              child: Text(
                                'Mở khoá thẻ'.tr,
                                style: StyleUtils.style18Normal.copyWith(
                                    color: ColorUtils.primaryTextColor),
                              )),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                controller.verifyCardRsa();
                              },
                              child: Text(
                                'Tesst'.tr,
                                style: StyleUtils.style18Normal.copyWith(
                                    color: ColorUtils.primaryTextColor),
                              )),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'register'.tr,
                                style: StyleUtils.style18Normal.copyWith(
                                    color: ColorUtils.primaryTextColor),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        label: 'login'.tr,
                        onTap: controller.onSubmitLogin,
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
