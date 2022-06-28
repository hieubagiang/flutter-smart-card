import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_card/app/common/base/base_view_view_model.dart';
import 'package:smart_card/app/common/utils/colors_utils.dart';
import 'package:smart_card/app/presentation/pages/tax_transaction/tax_controller.dart';
import 'package:smart_card/app/presentation/pages/tax_transaction/widgets/register_tax.dart';
import 'package:smart_card/gen/assets.gen.dart';

import '../../../common/utils/layout_utils.dart';
import '../../../common/utils/styles.dart';
import '../../../widgets/custom_button.dart';

enum SingingCharacter { thanhtoan }

class TaxScreen extends BaseView<TaxController> {
  const TaxScreen({Key? key}) : super(key: key);
  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.backgroundColor,
        body: Container(
          height: 1.sh,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 180,
                // color: Colors.black,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TaxWidgetItem(
                      onTap: () {
                        controller.tabController.animateTo(0);
                      },
                      description: 'Kê khai thuế',
                      svgImage: Assets.svgs.elumerTax.svg(color: ColorUtils.iconTaxColor),
                      isSelect: controller.selectedIndex.value == 0,
                    ),
                    TaxWidgetItem(
                      onTap: () {
                        controller.tabController.animateTo(1);
                      },
                      description: 'Đăng kí thuế',
                      svgImage: Assets.svgs.registerTax.svg(
                        color: ColorUtils.iconTaxColor,
                      ),
                      isSelect: controller.selectedIndex.value == 1,
                    ),
                    TaxWidgetItem(
                      onTap: () {
                        controller.tabController.animateTo(2);
                      },
                      description: 'Nộp thuế',
                      svgImage: Assets.svgs.submiTax.svg(color: ColorUtils.iconTaxColor),
                      isSelect: controller.selectedIndex.value == 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: [RegisterTax(), RegisterTax(), RegisterTax()]),
              )
            ],
          ),
        ));
  }
}

class RowTitle extends StatelessWidget {
  String? title;
  RowTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.w,
        color: Colors.black12,
        child: Center(
            child: Text(title ?? 'Chọn thanh toán',
                style: StyleUtils.style16Bold.copyWith(color: ColorUtils.blackColor))));
  }
}

class RowItemInfor extends StatelessWidget {
  String? normalText;
  String? boldText;
  RowItemInfor({Key? key, this.normalText, this.boldText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: RichText(
        text: TextSpan(
          text: normalText ?? 'Họ và tên :  ',
          style: StyleUtils.style16Normal.copyWith(color: ColorUtils.blackColor),
          children: <TextSpan>[
            TextSpan(
              text: boldText ?? 'Phạm Doãn Hiếu', style: StyleUtils.style16Bold.copyWith(color: ColorUtils.blackColor),
              // TextSpan(text: ' world!'),
            )
          ],
        ),
      ),
    );
  }
}

class TaxWidgetItem extends StatelessWidget {
  Widget? svgImage;
  VoidCallback? onTap;
  String? description;
  bool isSelect;
  TaxWidgetItem({Key? key, this.onTap, this.svgImage, this.description, this.isSelect = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(SpaceUtils.spaceSmall),
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.taxItemColor,
              ),
              child: svgImage,
            ),
            Text(
              description ?? '',
              style: StyleUtils.style16Medium.copyWith(color: ColorUtils.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
