import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/change_pin/change_pin_controller.dart';

class ChangePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChangePinController());
  }
}
