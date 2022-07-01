import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_card/app/widgets/dialogs_widget/error_dialog.dart';

import '../../../../common/base/base_controller.dart';
import '../../../../common/utils/colors_utils.dart';
import '../../../../common/utils/styles.dart';
import '../../../../widgets/custom_button.dart';
import '../tax_controller.dart';
import '../tax_screen.dart';

class RegisterTax extends StatelessWidget {
  final SingingCharacter character;

  const RegisterTax(
      {Key? key,
      this.character = SingingCharacter.thanhtoan,
      required this.controller})
      : super(key: key);
  final TaxController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              'Hiển thị kết quả',
              style: StyleUtils.style16Medium
                  .copyWith(color: ColorUtils.blackColor),
            ),
          ),
          Text('Thông tin người nộp thuế',
              style: StyleUtils.style16Normal
                  .copyWith(color: ColorUtils.blackColor)),
          RowItemInfor(
            normalText: 'Họ và tên :  ',
            boldText: controller.user.value?.fullName ?? '',
          ),
          RowItemInfor(
            normalText: 'Mã số thuế : ',
            boldText: controller.user.value?.cardId ?? '',
          ),
          RowItemInfor(
            normalText: 'Số CMND/ Số CCCD : ',
            boldText: controller.user.value?.cardId ?? '',
          ),
          Divider(),
          Text('Thông tin nộp nghĩa vụ tài chính',
              style: StyleUtils.style16Normal
                  .copyWith(color: ColorUtils.blackColor)),
          RowItemInfor(
            normalText: 'Loại thuế : ',
            boldText: 'Thuế thu nhập cá nhân',
          ),
          Text('Công dân được chọn tối đa 1 khoản thanh toán/ 1 lần thanh toán',
              style: StyleUtils.style16Normal
                  .copyWith(color: ColorUtils.blackColor)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child:
                Table(border: TableBorder.all(color: Colors.black), children: [
              const TableRow(children: [
                RowTitle(),
                RowTitle(
                  title: 'Nội dung kinh tế',
                ),
                RowTitle(
                  title: 'Cơ quan thuế',
                ),
                RowTitle(
                  title: 'Số tiền',
                ),
                RowTitle(
                  title: 'Số tiền thanh toán',
                ),
              ]),
              TableRow(children: [
                ListTile(
                  title: const Text('Nợ thuế'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.thanhtoan,
                    groupValue: character,
                    onChanged: (SingingCharacter? value) {
                      // setState(() {
                      //   _character = value;
                      // });
                    },
                  ),
                ),
                const Text(''),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                            '${controller.user.value?.placeOfResidence ?? 0}',
                            style: StyleUtils.style16Bold
                                .copyWith(color: ColorUtils.blackColor)),
                      );
                    }),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text('${controller.user.value?.debt ?? 0}',
                            style: StyleUtils.style16Bold
                                .copyWith(color: ColorUtils.blackColor)),
                      );
                    }),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text('${controller.user.value?.debt ?? 0}',
                            style: StyleUtils.style16Bold
                                .copyWith(color: ColorUtils.blackColor)),
                      );
                    }),
                  ],
                ),
              ])
            ]),
          ),
          Obx(() {
            return RichText(
              text: TextSpan(
                text: 'Số tiền thực hiện thanh toán: ',
                style: StyleUtils.style16Bold
                    .copyWith(color: ColorUtils.blackColor),
                children: <TextSpan>[
                  TextSpan(
                    text: '${controller.user.value?.debt ?? 0} VND',
                    style: StyleUtils.style16Bold
                        .copyWith(color: ColorUtils.primaryColor),
                    // TextSpan(text: ' world!'),
                  )
                ],
              ),
            );
          }),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          Text(
              'Mọi thắc mắc về thông tin vui lòng liên hệ cơ quan thuế phụ trách',
              style: StyleUtils.style14Normal
                  .copyWith(color: ColorUtils.primaryColor)),
          UnconstrainedBox(
            child: SizedBox(
              width: 200.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: SizedBox(
                  width: 20,
                  child: Obx(() {
                    return CustomButton(
                      onTap: () {
                        if (_payCondition()) {
                          if (controller.user.value!.amount <
                              controller.user.value!.debt) {
                            Get.dialog(CustomAlertDialog(
                              title: 'Thông báo',
                              content: 'Số dư tài khoản không đủ để thanh toán',
                              onTap: () {
                                Get.back();
                              },
                            ));
                          }
                          controller.createPayment();
                        }
                      },
                      bgColor: _payCondition()
                          ? ColorUtils.primaryColor
                          : ColorUtils.greyColor,
                      label: 'Thanh toán',
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _payCondition() => (controller.user.value?.debt ?? 0) > 0;
}
