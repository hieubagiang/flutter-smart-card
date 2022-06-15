import 'package:get/get.dart';
import 'package:smart_card/app/presentation/pages/card_connect/card_connect_binding.dart';
import 'package:smart_card/app/presentation/pages/card_connect/card_connect_screen.dart';
import 'package:smart_card/app/presentation/pages/login/login_screen.dart';
import 'package:smart_card/app/presentation/pages/main/main_binding.dart';
import 'package:smart_card/app/presentation/pages/main/main_screen.dart';

import '../presentation/pages/login/login_binding.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: RouteList.signIn,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: RouteList.connectCard,
        page: () => const CardConnectScreen(),
        binding: CardConnectBinding()),
    GetPage(
        name: RouteList.main,
        page: () => const MainScreen(),
        binding: MainBinding()),
  ];
}
