import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/tax_declaration/tax_declaration_controller.dart';

class TaxDeclarationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaxDeclarationController());
  }
}
