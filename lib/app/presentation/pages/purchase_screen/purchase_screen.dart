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
      width: 1.sw,
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
              children: [
                CardItem(
                    text: 'Ví momo',
                    icon: Assets.images.icLogoMomo.image(width: 72, height: 72),
                    backgroundColor: const Color(0xffa5096c)),
                const CardItem(
                  text: 'Chuyển khoản',
                  backgroundColor: ColorUtils.thirdColor,
                ),
                const CardItem(
                  text: 'Thẻ ATM online',
                  backgroundColor: ColorUtils.thirdColor,
                ),
                const CardItem(
                  text: 'Thẻ điện thoại',
                  backgroundColor: ColorUtils.thirdColor,
                ),
              ],
            ),
          ),
          Container(
            height: 500.h,
            width: 1.sw,
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
                              "2|99|0941716670|0941716670|neucodethi@gmail.com|0|0|100000",
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
                  Expanded(
                    child: Column(
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
                              Obx(() {
                                return Text(
                                  controller.currentUser.value?.cardId ?? '',
                                  style: StyleUtils.style18Bold
                                      .copyWith(color: Colors.black),
                                );
                              }),
                              Container(
                                width: 110,
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
                                    Flexible(
                                      child: Text(
                                        'Sao chép',
                                        style: StyleUtils.style16Normal
                                            .copyWith(
                                                color: ColorUtils.whiteColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Flexible(
                          child: Text(
                            'Chú ý: ',
                            style: StyleUtils.style18Bold
                                .copyWith(color: ColorUtils.redColor),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '- Nhập đúng nội dung chuyển tiền, chúng tôi không chịu trách nhiệm với câc trường hợp'
                            ' sai',
                            style: StyleUtils.style16Bold
                                .copyWith(color: ColorUtils.redColor),
                          ),
                        ),
                        Flexible(
                          child: Text(
                              "- Giao dịch chuyển tiền phải có nội dung là '${controller.currentUser.value?.cardId ?? ''}'",
                              style: StyleUtils.style16Bold
                                  .copyWith(color: ColorUtils.redColor)),
                        ),
                        Flexible(
                          child: Text(
                              'Tuyệt đối không nhắn tin nội dung chuyển tiền vào số điện thoại và trong mục tin nhắn'
                              ' của app Momo',
                              style: StyleUtils.style16Bold
                                  .copyWith(color: ColorUtils.redColor)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Tài khoản nhận tiền',
                              style: StyleUtils.style18Bold
                                  .copyWith(color: ColorUtils.primaryColor)),
                        ),
                        Text('0941716670',
                            style: StyleUtils.style18Bold.copyWith(
                                color: ColorUtils.blackColor, fontSize: 20)),
                        Text('Phạm Doãn Hiếu',
                            style: StyleUtils.style18Bold.copyWith(
                                color: ColorUtils.blackColor, fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Số tiền cần chuyển',
                              style: StyleUtils.style18Bold.copyWith(
                                  color: ColorUtils.primaryColor,
                                  fontSize: 20)),
                        ),
                        Text('VD: 100.000đ',
                            style: StyleUtils.style18Bold.copyWith(
                                color: ColorUtils.blackColor, fontSize: 20)),
                      ],
                    ),
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
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const CardItem(
      {Key? key, this.text, this.icon, this.backgroundColor, this.onTap})
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
              Flexible(
                  child: icon ??
                      const Icon(
                        Icons.monetization_on,
                        size: 64,
                      )),
              Text(
                text ?? '',
                style: StyleUtils.style16Bold
                    .copyWith(color: ColorUtils.whiteColor),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? ColorUtils.primaryColor,
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
