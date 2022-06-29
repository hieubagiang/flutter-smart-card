import 'package:flutter/material.dart';

import '../../../../common/utils/colors_utils.dart';
import '../../../../common/utils/styles.dart';
import '../../../../widgets/custom_button.dart';
import '../tax_screen.dart';

class RegisterTax extends StatelessWidget {
  final SingingCharacter character;

  const RegisterTax({Key? key, this.character = SingingCharacter.thanhtoan})
      : super(key: key);

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
          const RowItemInfor(),
          const RowItemInfor(
            normalText: 'Mã số thuế : ',
            boldText: '123123123',
          ),
          const RowItemInfor(
            normalText: 'Số CMND/ Số CCCD : ',
            boldText: '123123123',
          ),
          const Divider(),
          Text('Thông tin nộp nghĩa vụ tài chính',
              style: StyleUtils.style16Normal
                  .copyWith(color: ColorUtils.blackColor)),
          const RowItemInfor(
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
                const Text(''),
                const Text(''),
                Center(
                    child: Text('0',
                        style: StyleUtils.style16Bold
                            .copyWith(color: ColorUtils.blackColor))),
                const Text(''),
              ])
            ]),
          ),
          RichText(
            text: TextSpan(
              text: 'Số tiền thực hiện thanh toán: ',
              style:
                  StyleUtils.style16Bold.copyWith(color: ColorUtils.blackColor),
              children: <TextSpan>[
                TextSpan(
                  text: '0 VND',
                  style: StyleUtils.style16Bold
                      .copyWith(color: ColorUtils.primaryColor),
                  // TextSpan(text: ' world!'),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          Text(
              'Mọi thắc mắc về thông tin vui lòng liên hệ cơ quan thuế phụ trách',
              style: StyleUtils.style14Normal
                  .copyWith(color: ColorUtils.primaryColor)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: SizedBox(
              width: 20,
              child: CustomButton(
                onTap: () {
                  // _showBottomSheet(context);
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
}
