import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/regist_tax/registration_tax_controller.dart';
import 'package:smart_card/app/presentation/pages/tax_declaration/tax_declaration_controller.dart';
import 'package:smart_card/app/presentation/pages/tax_transaction/tax_controller.dart';

class TaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaxController());
    Get.put(RegistrationTaxController());
    Get.put(RegistrationTaxController());
    Get.put(TaxDeclarationController());
  }
}
