import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/login/login_screen.dart';
import 'package:smart_card/app/presentation/pages/main/main_screen.dart';

import '../presentation/pages/login/login_binding.dart';
import '../presentation/pages/main/main_binding.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: RouteList.signIn,
        page: () => LoginScreen(),
        binding: LoginBinding()),
  ];
}
