import 'package:flutter/material.dart';
import 'package:smart_card/app/widgets/new_dialog/confirm_dialog.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../data/models/user_model.dart';
import '../../../data/provider/api.dart';
import '../main/main_controller.dart';

class TaxController extends BaseController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;
  Rx<UserModel?> user = Get.find<MainController>().user;
  final api = injector.get<Api>();
  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 3, initialIndex: 0)
      ..addListener(() {
        onChangeTab(tabController.index);
      });
  }

  void onChangeTab(int value) {
    selectedIndex.value = value;
  }

  Future<void> createPayment() async {
    bool confirmed = false;
    confirmed = await Get.dialog(ConfirmDialog(
      title: 'Thông báo',
      description:
          'Bạn có muốn thanh toán tiền thuế với số tiền là: ${user.value?.debt ?? 0}',
      onConfirmed: () => Get.back(result: true),
      context: Get.context!,
    ));
    if (!confirmed) {
      return;
    }

    final res = await api.payBill(identificationId: user.value!.cardId!);
    if (res.status ?? false) {
      await Get.dialog(ConfirmDialog(
        title: 'Thông báo',
        description: 'Thanh toán tiền thuế thành công',
        onConfirmed: () => Get.back(),
        context: Get.context!,
      ));
    }
  }
}
