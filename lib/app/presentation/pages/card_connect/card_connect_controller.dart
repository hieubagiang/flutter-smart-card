import 'dart:async';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../injector.dart';
import '../../../common/base/base_controller.dart';
import '../../../common/helper/smart_card_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/dialogs_widget/error_dialog.dart';

class CardConnectController extends BaseController {
  RxBool isInitDone = false.obs;

  var isFirst = true;
  RxBool isConnected = false.obs;
  SmartCardHelper smartCardHelper = injector.get<SmartCardHelper>();
  RSAPublicKey? publicKey;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  Future<void> onResumed() async {
    super.onResumed();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  Future<void> onSubmitCardConnect() async {
    final success = await injector
        .get<SmartCardHelper>()
        .connectCard(SmartCardConstant.appletID);

    if (success) {
      Get.toNamed(RouteList.signIn);
    } else {
      SmartDialog.show(builder: (context) {
        return ErrorDialog(
          errorMessage: 'connect_card_failed_message'.tr,
        );
      });
    }
  }
}
