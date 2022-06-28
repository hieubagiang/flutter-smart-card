import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';
import 'package:smart_card/app/presentation/pages/tax_declaration/tax_declaration_controller.dart';

import '../../../common/base/base_view_view_model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class TaxDeclarationScreen extends BaseView<TaxDeclarationController> {
  const TaxDeclarationScreen({Key? key}) : super(key: key);

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
                'Kê khai thuế'.tr,
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
                        controller: controller.taxIdTextCtrl,
                        isEnable: true,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Thu nhập chịu thuế'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.incomeTextCtrl,
                        isEnable: false,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        title: 'Giảm trừ gia cảnh'.tr,
                        titleStyle: StyleUtils.style18Normal
                            .copyWith(color: Colors.black),
                        controller: controller.placeOfResidenceTextCtrl,
                        isEnable: false,
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
