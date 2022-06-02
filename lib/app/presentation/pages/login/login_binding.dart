import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
