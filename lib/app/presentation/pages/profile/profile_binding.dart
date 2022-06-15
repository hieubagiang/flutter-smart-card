import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
