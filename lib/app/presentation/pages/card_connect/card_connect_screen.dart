import 'package:flutter/material.dart';
import 'package:smart_card/app/common/utils/utils.dart';

import '../../../common/base/base_view_view_model.dart';
import '../../../widgets/custom_button.dart';
import 'card_connect_controller.dart';

class CardConnectScreen extends BaseView<CardConnectController> {
  const CardConnectScreen({Key? key}) : super(key: key);

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
                    // border: Border.all(color: ColorUtils.borderColor),
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.symmetric(
                    horizontal: SpaceUtils.spaceMedium * 2,
                    vertical: SpaceUtils.spaceMedium),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (controller.isConnected.isTrue)
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          label: 'card_connect'.tr,
                          onTap: controller.onSubmitCardConnect,
                          labelstyle: StyleUtils.style18Normal
                              .copyWith(color: Colors.white),
                          bgColor: ColorUtils.primaryColor,
                        ),
                      )
                    else
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          label: 'card_connect'.tr,
                          onTap: controller.onSubmitCardConnect,
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
