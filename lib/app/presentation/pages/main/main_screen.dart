import 'package:flutter/material.dart' hide MenuItem;
import 'package:smart_card/app/presentation/pages/change_pin/change_pin_screen.dart';
import 'package:smart_card/gen/assets.gen.dart';

import '../../../common/base/base_view_view_model.dart';
import '../../../common/utils/utils.dart';
import '../../../widgets/home_header.dart';
import '../../../widgets/menu_item.dart';
import '../profile/profile_screen.dart';
import 'main_controller.dart';

class MainScreen extends BaseView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 305,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            color: ColorUtils.primaryColor,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  'CCCD App'.tr,
                  style: StyleUtils.style36Bold
                      .copyWith(color: ColorUtils.secondaryColor),
                ),
                const SizedBox(height: 50.0),
                Obx(() {
                  return MenuItem(
                    onTap: () {
                      controller.tabController.animateTo(0);
                    },
                    label: 'profile'.tr,
                    icon: Assets.images.user.path,
                    selected: controller.selectedIndex.value == 0,
                  );
                }),
                Obx(() {
                  return MenuItem(
                    onTap: () {
                      controller.tabController.animateTo(1);
                    },
                    icon: Assets.images.padlock.path,
                    label: 'change_pin'.tr,
                    selected: controller.selectedIndex.value == 1,
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 48.h,
                    child: HomeHeader(
                      userName: 'Phạm Doãn Hiếu',
                      userRole: 'user',
                      avatar:
                          'https://i.pinimg.com/564x/44/15/ba/4415ba5df0f4bfcee5893d6c441577e0.jpg',
                      onLogout: () {
                        controller.logout();
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.tabController,
                      children: const [
                        ProfileScreen(),
                        ChangePinScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
