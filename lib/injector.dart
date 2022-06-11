import 'package:get_it/get_it.dart';

import 'app/common/helper/smart_card_helper.dart';
import 'app/common/utils/log_utils.dart';

GetIt injector = GetIt.asNewInstance();

Future<void> initInjector() async {
  // Dio client
  //database
  injector.registerSingleton<SmartCardHelper>(SmartCardHelper());

  // Dependencies
  // injector.registerSingleton<HomeApi>(HomeApi(injector()));

  ///Repository
  // injector.registerSingleton<HomeRepository>(
  //   HomeRepositoryImpl(injector()),
  // );

  injector.registerSingleton<LogUtils>(LogUtils());
}
