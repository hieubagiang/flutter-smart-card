import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/regist_tax/registration_tax_controller.dart';

class RegistrationTaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegistrationTaxController());
  }
}
