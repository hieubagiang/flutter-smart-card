import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/purchase_screen/purchase_controller.dart';

class PurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PurchaseController());
  }
}
