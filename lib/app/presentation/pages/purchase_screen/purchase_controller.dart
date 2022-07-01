import 'package:smart_card/app/presentation/pages/main/main_controller.dart';

import '../../../common/base/base_controller.dart';
import '../../../data/models/user_model.dart';

class PurchaseController extends BaseController {
  Rx<UserModel?> currentUser = Get.find<MainController>().user;
}
