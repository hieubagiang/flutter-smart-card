import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_card/gen/assets.gen.dart';

import '../../../../common/utils/colors_utils.dart';
import '../../../../common/utils/styles.dart';
import '../../../../widgets/custom_button.dart';
import '../tax_screen.dart';

class RegisterTax extends StatelessWidget {
  SingingCharacter? character = SingingCharacter.thanhtoan;

  RegisterTax({Key? key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              'Hiển thị kết quả',
              style: StyleUtils.style16Medium.copyWith(color: ColorUtils.blackColor),
            ),
          ),
          Text('Thông tin người nộp thuế', style: StyleUtils.style16Normal.copyWith(color: ColorUtils.blackColor)),
          RowItemInfor(),
          RowItemInfor(
            normalText: 'Mã số thuế : ',
            boldText: '123123123',
          ),
          RowItemInfor(
            normalText: 'Số CMND/ Số CCCD : ',
            boldText: '123123123',
          ),
          Divider(),
          Text('Thông tin nộp nghĩa vụ tài chính',
              style: StyleUtils.style16Normal.copyWith(color: ColorUtils.blackColor)),
          RowItemInfor(
            normalText: 'Loại thuế : ',
            boldText: 'Thuế thu nhập cá nhân',
          ),
          Text('Công dân được chọn tối đa 1 khoản thanh toán/ 1 lần thanh toán',
              style: StyleUtils.style16Normal.copyWith(color: ColorUtils.blackColor)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Table(border: TableBorder.all(color: Colors.black), children: [
              TableRow(children: [
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
                  title: const Text('Lafayette'),
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
                Text(''),
                Text(''),
                Center(child: Text('0', style: StyleUtils.style16Bold.copyWith(color: ColorUtils.blackColor))),
                Text(''),
              ])
            ]),
          ),
          RichText(
            text: TextSpan(
              text: 'Số tiền thực hiện thanh toán: ',
              style: StyleUtils.style16Bold.copyWith(color: ColorUtils.blackColor),
              children: <TextSpan>[
                TextSpan(
                  text: '0 VND', style: StyleUtils.style16Bold.copyWith(color: ColorUtils.primaryColor),
                  // TextSpan(text: ' world!'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          Text('Mọi thắc mắc về thông tin vui lòng liên hệ cơ quan thuế phụ trách',
              style: StyleUtils.style14Normal.copyWith(color: ColorUtils.primaryColor)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              width: 20,
              child: CustomButton(
                onTap: () {
                  _showBottomSheet(context);
                },
                bgColor: ColorUtils.primaryColor,
                label: 'Thanh toán',
              ),
            ),
          )
        ],
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Get.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 100.w,
                    width: 100.w,
                    child: Column(
                      children: [
                        Assets.svgs.submiTax.svg(color: ColorUtils.whiteColor),
                        Text(
                          'Ví momo',
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorUtils.primaryColor, border: Border.all(color: ColorUtils.primaryColor)),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
                child: Row(
                  children: [
                    QrImage(
                      data: "2|99|0941716670|0941716670|neucodethi@gmail.com|0|0|1",
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    Column(
                      children: [
                        Text('Nội dung chuyển tiền',
                            style: StyleUtils.style16Bold.copyWith(color: ColorUtils.blackColor)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'VDTC 4QNZY8',
                              style: StyleUtils.style16Bold.copyWith(color: Colors.black),
                            ),
                            Container(
                              width: 130,
                              decoration: BoxDecoration(
                                color: ColorUtils.accentColor,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                children: [IconButton(onPressed: () {}, icon: Icon(Icons.copy)), Text('Sao chép')],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
