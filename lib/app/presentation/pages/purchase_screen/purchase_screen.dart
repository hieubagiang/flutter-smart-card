import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_card/app/presentation/pages/purchase_screen/purchase_controller.dart';

import '../../../../gen/assets.gen.dart';
import '../../../common/base/base_view_view_model.dart';
import '../../../common/utils/colors_utils.dart';
import '../../../common/utils/functions.dart';
import '../../../common/utils/styles.dart';

class PurchaseScreen extends BaseView<PurchaseController> {
  const PurchaseScreen({Key? key}) : super(key: key);
  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CardItem(),
                CardItem(
                  text: 'Chuyển khoản',
                ),
                CardItem(
                  text: 'QR Code',
                ),
                CardItem(
                  text: 'Thẻ ATM online',
                ),
                CardItem(
                  text: 'Thẻ điện thoại',
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black38)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.primaryColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        QrImage(
                          data:
                              "2|99|0941716670|0941716670|neucodethi@gmail.com|0|0|1",
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                        Text(
                          'Sử dụng App Momo hoặc \nSử dụng Camera hỗ trợ QR code để \nquét mã',
                          style: StyleUtils.style16Bold
                              .copyWith(color: ColorUtils.primaryColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Nội dung chuyển tiền',
                          style: StyleUtils.style16Bold
                              .copyWith(color: ColorUtils.primaryColor)),
                      SizedBox(
                        width: 800.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'VDTC 4QNZY8',
                              style: StyleUtils.style18Bold
                                  .copyWith(color: Colors.black),
                            ),
                            Container(
                              width: 130.w,
                              decoration: const BoxDecoration(
                                color: ColorUtils.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.copy)),
                                  Text(
                                    'Sao chép',
                                    style: StyleUtils.style16Normal
                                        .copyWith(color: ColorUtils.blackColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Text(
                        'Chú ý: ',
                        style: StyleUtils.style18Bold
                            .copyWith(color: ColorUtils.redColor),
                      ),
                      Text(
                        '- Nhập đúng nội dung chuyển tiền, chúng tôi không chịu trách nhiệm với câc trường hợp'
                        ' sai',
                        style: StyleUtils.style16Bold
                            .copyWith(color: ColorUtils.redColor),
                      ),
                      Text(
                          "- Giao dịch chuyển tiền phải có nội dung là 'VDTC 4QNZY8'",
                          style: StyleUtils.style16Bold
                              .copyWith(color: ColorUtils.redColor)),
                      Text(
                          'Tuyệt đối không nhắn tin nội dung chuyển tiền vào số điện thoại và trong mục tin nhắn'
                          ' của app Momo',
                          style: StyleUtils.style16Bold
                              .copyWith(color: ColorUtils.redColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Tài khoản nhận tiền',
                            style: StyleUtils.style18Bold
                                .copyWith(color: ColorUtils.primaryColor)),
                      ),
                      Text('0916271000',
                          style: StyleUtils.style18Bold.copyWith(
                              color: ColorUtils.blackColor, fontSize: 20)),
                      Text('Nguyễn Thị Thanh Tâm',
                          style: StyleUtils.style18Bold.copyWith(
                              color: ColorUtils.blackColor, fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Số tiền cần chuyển',
                            style: StyleUtils.style18Bold.copyWith(
                                color: ColorUtils.primaryColor, fontSize: 20)),
                      ),
                      Text('110.000đ( Đã bao gồm 10% VAT',
                          style: StyleUtils.style18Bold.copyWith(
                              color: ColorUtils.blackColor, fontSize: 20)),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class CardItem extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final VoidCallback? onTap;
  const CardItem({Key? key, this.text, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: GestureDetector(
        onTap: onTap ??
            () {
              FunctionUtils.showSnackBar('Tính năng đang phát triển', '');
            },
        child: Container(
          height: 150.w,
          width: 150.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Assets.svgs.submiTax.svg(color: ColorUtils.whiteColor),
              Text(
                text ?? 'Ví momo',
                style: StyleUtils.style16Bold
                    .copyWith(color: ColorUtils.whiteColor),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: ColorUtils.primaryColor,
            border: Border.all(color: ColorUtils.primaryColor),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
