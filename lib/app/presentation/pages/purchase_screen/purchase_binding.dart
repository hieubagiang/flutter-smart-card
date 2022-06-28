import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_card/app/presentation/pages/purchase_screen/purchase_controller.dart';

class PurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PurchaseController());
  }
}
