import 'package:get/get.dart';

import 'card_connect_controller.dart';

class CardConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CardConnectController());
  }
}
