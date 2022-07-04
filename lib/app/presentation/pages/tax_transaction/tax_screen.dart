import 'package:flutter/material.dart';
import 'package:smart_card/app/common/base/base_view_view_model.dart';
import 'package:smart_card/app/common/utils/colors_utils.dart';
import 'package:smart_card/app/presentation/pages/regist_tax/registration_tax_screen.dart';
import 'package:smart_card/app/presentation/pages/tax_transaction/tax_controller.dart';
import 'package:smart_card/app/presentation/pages/tax_transaction/widgets/register_tax.dart';
import 'package:smart_card/gen/assets.gen.dart';

import '../../../common/utils/styles.dart';
import '../tax_declaration/tax_declaration_screen.dart';

enum SingingCharacter { thanhtoan }

class TaxScreen extends BaseView<TaxController> {
  const TaxScreen({Key? key}) : super(key: key);
  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.backgroundColor,
        body: SizedBox(
          height: 1.sh,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 180.h,
                // color: Colors.black,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TaxWidgetItem(
                      onTap: () {
                        controller.tabController.animateTo(0);
                      },
                      description: 'Đăng kí thuế',
                      svgImage: Assets.svgs.icDkthue.svg(
                        color: ColorUtils.iconTaxColor,
                      ),
                      isSelect: controller.selectedIndex.value == 0,
                    ),
                    TaxWidgetItem(
                      onTap: () {
                        controller.tabController.animateTo(1);
                      },
                      description: 'Kê khai thuế',
                      svgImage: Assets.images.icKekhaithuecn.image(),
                      isSelect: controller.selectedIndex.value == 1,
                    ),
                    TaxWidgetItem(
                      onTap: () {
                        controller.tabController.animateTo(2);
                      },
                      description: 'Nộp thuế',
                      svgImage: Assets.images.icNopthuecn
                          .image(color: ColorUtils.iconTaxColor),
                      isSelect: controller.selectedIndex.value == 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: [
                      const RegistrationTaxScreen(),
                      const TaxDeclarationScreen(),
                      RegisterTax(
                        controller: controller,
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}

class RowTitle extends StatelessWidget {
  final String? title;
  const RowTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.w,
        color: Colors.black12,
        child: Center(
            child: Text(title ?? 'Chọn thanh toán',
                style: StyleUtils.style16Bold
                    .copyWith(color: ColorUtils.blackColor))));
  }
}

class RowItemInfor extends StatelessWidget {
  final String? normalText;
  final String? boldText;
  const RowItemInfor({Key? key, this.normalText, this.boldText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: RichText(
        text: TextSpan(
          text: normalText ?? 'Họ và tên :  ',
          style:
              StyleUtils.style16Normal.copyWith(color: ColorUtils.blackColor),
          children: <TextSpan>[
            TextSpan(
              text: boldText ?? 'Phạm Doãn Hiếu',
              style:
                  StyleUtils.style16Bold.copyWith(color: ColorUtils.blackColor),
              // TextSpan(text: ' world!'),
            )
          ],
        ),
      ),
    );
  }
}

class TaxWidgetItem extends StatelessWidget {
  final Widget? svgImage;
  final VoidCallback? onTap;
  final String? description;
  final bool isSelect;
  const TaxWidgetItem(
      {Key? key,
      this.onTap,
      this.svgImage,
      this.description,
      this.isSelect = false})
      : super(key: key);

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
              padding: const EdgeInsets.all(24),
              width: 100.w,
              height: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.taxItemColor,
              ),
              child: svgImage,
            ),
            Text(
              description ?? '',
              style: StyleUtils.style16Medium
                  .copyWith(color: ColorUtils.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
