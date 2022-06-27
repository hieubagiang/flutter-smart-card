import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/tax_transaction/tax_controller.dart';

class TaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaxController());
  }
}
