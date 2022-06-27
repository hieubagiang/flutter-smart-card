import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/change_pin/change_pin_controller.dart';
import 'package:smart_card/app/presentation/pages/tax_transaction/tax_controller.dart';

import '../profile/profile_controller.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(ChangePinController());
    Get.put(ProfileController());
    Get.put(TaxController());
  }
}
