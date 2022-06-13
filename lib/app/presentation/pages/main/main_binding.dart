import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/change_pin/change_pin_controller.dart';

import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(ChangePinController());
  }
}
