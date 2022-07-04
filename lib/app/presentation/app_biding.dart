import 'package:get/get.dart';
import 'package:smart_card/app/common/network/http/dio_config.dart';

import '../data/provider/api.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Api(dio), permanent: true);
  }
}
