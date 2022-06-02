import 'dart:async';

import '../../../common/base/base_controller.dart';

class MainController extends BaseController {
  static final MainController _singleton = MainController._internal();

  factory MainController() {
    return _singleton;
  }

  MainController._internal();

  var selectedIndex = 0.obs;
  RxInt chatTotalUnreadCount = 0.obs;
  List<BaseController> controllerList = [];
  RxBool isInitDone = false.obs;

  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 1;
  var isFirst = true;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // commonController.startLoading();
  }

  void handleIndexChanged(int index) {
    selectedIndex.value = index;
  }

  // RxBool isSelected(int index) {
  //   return RxBool(index == tabController.index);
  // }

  void onChangeTab(int value) {
    selectedIndex.value = value;
  }

  @override
  Future<void> onResumed() async {
    super.onResumed();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }
}
